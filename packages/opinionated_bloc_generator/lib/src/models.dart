/// Represent each event in a bloc
class OpinionatedEvent {
  final String name;
  final List<OpinionatedEventArgument> arguments;

  OpinionatedEvent({this.name, this.arguments});
}

/// Represent a argument in a bloc event
class OpinionatedEventArgument {
  final String name;
  final String type;

  const OpinionatedEventArgument({this.name, this.type});
}
