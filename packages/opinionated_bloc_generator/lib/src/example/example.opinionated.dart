// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// Generator: OpinionatedBuilder
// **************************************************************************

abstract class CalculatorBlocMapping {
  Stream<CalculatorState> onAdd(int value);
  Stream<CalculatorState> onSubtract(int value);
}

mixin CalculatorBlocOpinionated on Bloc<CalculatorEvent, CalculatorState>
    implements CalculatorBlocMapping {
  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    yield* event.when(add: (int value) async* {
      yield* onAdd(value);
    }, subtract: (int value) async* {
      yield* onSubtract(value);
    });
  }
}
