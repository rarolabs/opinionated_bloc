import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opinionated_bloc_annotations/opinionated_bloc_annotations.dart';

part 'example.freezed.dart';
part 'example.opinionated.dart';

@freezed
abstract class CalculatorState with _$CalculatorState {
  const factory CalculatorState.done(int result) = Done;
}

@freezed
abstract class CalculatorEvent with _$CalculatorEvent {
  const factory CalculatorEvent.add(int value) = Add;
  const factory CalculatorEvent.subtract(int value) = Subtract;
}

@opinionatedBloc
class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState>
    with CalculatorBlocOpinionated {
  @override
  CalculatorState get initialState => CalculatorState.done(0);
  var result = 0;

  @override
  Stream<CalculatorState> onSubtract(int value) async* {
    throw UnimplementedError();
  }

  @override
  Stream<CalculatorState> onMultiply(int value) async* {
    throw UnimplementedError();
  }

  @override
  Stream<CalculatorState> onAdd(int value) {
    throw UnimplementedError();
  }
}
