import 'models.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

/// Generate the source code for a given bloc
class Template {
  final String blocName;
  final List<OpinionatedEvent> events;
  String modelName;
  Template({this.blocName, this.events}) {
    modelName = blocName.replaceAll("Bloc", "");
  }

  String toDart() {
    return '''
    ${_abstractClass()}
    
    ${_mixin()}
    ''';
  }

  String _abstractClass() {
    return '''
abstract class ${blocName}Mapping {
  ${_abstractClassMethods()}
}
''';
  }

  String _abstractClassMethods() {
    return events.map((e) => _abstractMethod(e)).join("\n");
  }

  String _abstractMethod(OpinionatedEvent event) {
    return 'Stream<${modelName}State> on${event.name.capitalize()}(${_arguments(event.arguments)});';
  }

  String _arguments(List<OpinionatedEventArgument> arguments) {
    return arguments.map((a) => "${a.type} ${a.name}").join(", ");
  }

  String _mixin() {
    return '''
mixin ${blocName}Opinionated on Bloc<${modelName}Event, ${modelName}State>
    implements ${blocName}Mapping {
  @override
  Stream<${modelName}State> mapEventToState(
    ${modelName}Event event,
  ) async* {
    ${_handleEvents()}
  }
}
    ''';
  }

  String _handleEvents() {
    if (events.isEmpty) {
      return null;
    } else if (events.length == 1) {
      return '''
      yield * on${events[0].name.capitalize()} (${_values(events[0].arguments, prefix: "event.")});
      ''';
    } else {
      return '''
      yield* event.when(
        ${_handleMultipleEvents()}
      );
      ''';
    }
  }

  String _handleMultipleEvents() {
    return events.map((e) => _handleEvent(e)).join(",\n");
  }

  String _handleEvent(OpinionatedEvent event) {
    return '''
      ${event.name}: (${_arguments(event.arguments)}) async* {
        yield* on${event.name.capitalize()}(${_values(event.arguments)});
      }''';
  }

  String _values(List<OpinionatedEventArgument> arguments,
      {String prefix = ""}) {
    return arguments.map((e) => "${prefix}${e.name}").join(", ");
  }
}
