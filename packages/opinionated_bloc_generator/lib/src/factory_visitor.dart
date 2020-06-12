import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'models.dart';

/// Visitor to parse de AST
class FactoryVisitor extends SimpleElementVisitor {
  List<OpinionatedEvent> events = [];
  @override
  visitConstructorElement(ConstructorElement element) {
    events.add(
      OpinionatedEvent(
        name: element.name,
        arguments: _getArguments(element.parameters),
      ),
    );

    return super.visitConstructorElement(element);
  }

  List<OpinionatedEventArgument> _getArguments(
      List<ParameterElement> parameters) {
    return parameters
        .map(
          (param) => OpinionatedEventArgument(
            name: param.name,
            type: (param.declaration as ParameterElementImpl)
                .typeInternal
                .getDisplayString(),
          ),
        )
        .toList();
  }
}
