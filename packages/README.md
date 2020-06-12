# opinionated_bloc_generator

This generator aims to reduce [Bloc Library](https://pub.dev/packages/bloc) boilerplate in an opinionated way.

In blocs with many events the `mapEventToState` method tends to be big once you have to handle each event and calls an appropriated method to handle it.

Opinionated Bloc Generator is the way we reduce this kind of bloc boilerplate in ours projects. Maybe it will be useful for you too.

## What opinions we have? 

You should use sealed classes to declare bloc states and events. For this we rely on [freezed](https://pub.dev/packages/freezed) library.

You should handle each event in a separated method inside your bloc. 

## Hot it works?

You need to do four simple steps to use the Opinionated Bloc Generator:

1 – Add part of `.opinionated.dart` after yours imports statements.

2 – Annotate your bloc class with `@opinionatedBloc`.

3 – Add the generated mixin to your bloc. It will have your bloc name followed by Opinionated.

4 – Implement the required methods in our bloc.

## Example

```dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opinionated_bloc_annotations/opinionated_bloc_annotations.dart';

part 'calculator_bloc.freezed.dart';
part 'calculator_bloc.opinionated.dart';

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
```

when you run `pub run build_runner watch --delete-conflicting-outputs` a file called `calculator_bloc.opinionated.dart` will be generated with the follow content:

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_bloc.dart';

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
```

## Instaling
To use opinionated_bloc_generator, you will need ad the follow packages to your `pubspec.yaml`:

```yaml
dependencies:
  opinionated_bloc_annotation:

dev_dependencies:
  build_runner:
  opinionated_bloc_generator:
```

## Using `async*` in your method declaration

To be able to yield states in each event handle you must to declare your method with `async*`. 

### Don't
```dart
@override
Stream<CalculatorState> onMultiply(int value) 
```

### Do
```dart
@override
Stream<CalculatorState> onMultiply(int value) async *

```


