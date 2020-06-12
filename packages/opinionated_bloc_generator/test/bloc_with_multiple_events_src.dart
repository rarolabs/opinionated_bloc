import 'package:bloc/bloc.dart';
import 'package:opinionated_bloc_annotations/opinionated_bloc_annotations.dart';
import 'package:source_gen_test/annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@ShouldGenerate(
  r'''
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
''',
)
@opinionatedBloc
class CalculatorBloc extends Bloc<CalculatorState, CalculatorEvent> {
  @override
  get initialState => throw UnimplementedError();

  @override
  Stream<CalculatorEvent> mapEventToState(CalculatorState event) {
    throw UnimplementedError();
  }
}

abstract class CalculatorState with _$CalculatorState {
  const factory CalculatorState.done(int result) = Done;
}

abstract class CalculatorEvent with _$CalculatorEvent {
  const factory CalculatorEvent.add(int value) = Add;
  const factory CalculatorEvent.subtract(int value) = Subtract;
}

T _$identity<T>(T value) => value;

class _$CalculatorStateTearOff {
  const _$CalculatorStateTearOff();

  Done done(int result) {
    return Done(
      result,
    );
  }
}

// ignore: unused_element
const $CalculatorState = _$CalculatorStateTearOff();

mixin _$CalculatorState {
  int get result;

  $CalculatorStateCopyWith<CalculatorState> get copyWith;
}

abstract class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
          CalculatorState value, $Res Function(CalculatorState) then) =
      _$CalculatorStateCopyWithImpl<$Res>;
  $Res call({int result});
}

class _$CalculatorStateCopyWithImpl<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._value, this._then);

  final CalculatorState _value;
  // ignore: unused_field
  final $Res Function(CalculatorState) _then;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed ? _value.result : result as int,
    ));
  }
}

abstract class $DoneCopyWith<$Res> implements $CalculatorStateCopyWith<$Res> {
  factory $DoneCopyWith(Done value, $Res Function(Done) then) =
      _$DoneCopyWithImpl<$Res>;
  @override
  $Res call({int result});
}

class _$DoneCopyWithImpl<$Res> extends _$CalculatorStateCopyWithImpl<$Res>
    implements $DoneCopyWith<$Res> {
  _$DoneCopyWithImpl(Done _value, $Res Function(Done) _then)
      : super(_value, (v) => _then(v as Done));

  @override
  Done get _value => super._value as Done;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(Done(
      result == freezed ? _value.result : result as int,
    ));
  }
}

class _$Done implements Done {
  const _$Done(this.result) : assert(result != null);

  @override
  final int result;

  @override
  String toString() {
    return 'CalculatorState.done(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Done &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @override
  $DoneCopyWith<Done> get copyWith =>
      _$DoneCopyWithImpl<Done>(this, _$identity);
}

abstract class Done implements CalculatorState {
  const factory Done(int result) = _$Done;

  @override
  int get result;
  @override
  $DoneCopyWith<Done> get copyWith;
}

class _$CalculatorEventTearOff {
  const _$CalculatorEventTearOff();

  Add add(int value) {
    return Add(
      value,
    );
  }

  Subtract subtract(int value) {
    return Subtract(
      value,
    );
  }
}

// ignore: unused_element
const $CalculatorEvent = _$CalculatorEventTearOff();

mixin _$CalculatorEvent {
  int get value;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result add(int value),
    @required Result subtract(int value),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result add(int value),
    Result subtract(int value),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result add(Add value),
    @required Result subtract(Subtract value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result add(Add value),
    Result subtract(Subtract value),
    @required Result orElse(),
  });

  $CalculatorEventCopyWith<CalculatorEvent> get copyWith;
}

abstract class $CalculatorEventCopyWith<$Res> {
  factory $CalculatorEventCopyWith(
          CalculatorEvent value, $Res Function(CalculatorEvent) then) =
      _$CalculatorEventCopyWithImpl<$Res>;
  $Res call({int value});
}

class _$CalculatorEventCopyWithImpl<$Res>
    implements $CalculatorEventCopyWith<$Res> {
  _$CalculatorEventCopyWithImpl(this._value, this._then);

  final CalculatorEvent _value;
  // ignore: unused_field
  final $Res Function(CalculatorEvent) _then;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed ? _value.value : value as int,
    ));
  }
}

abstract class $AddCopyWith<$Res> implements $CalculatorEventCopyWith<$Res> {
  factory $AddCopyWith(Add value, $Res Function(Add) then) =
      _$AddCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

class _$AddCopyWithImpl<$Res> extends _$CalculatorEventCopyWithImpl<$Res>
    implements $AddCopyWith<$Res> {
  _$AddCopyWithImpl(Add _value, $Res Function(Add) _then)
      : super(_value, (v) => _then(v as Add));

  @override
  Add get _value => super._value as Add;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(Add(
      value == freezed ? _value.value : value as int,
    ));
  }
}

class _$Add implements Add {
  const _$Add(this.value) : assert(value != null);

  @override
  final int value;

  @override
  String toString() {
    return 'CalculatorEvent.add(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Add &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  $AddCopyWith<Add> get copyWith => _$AddCopyWithImpl<Add>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result add(int value),
    @required Result subtract(int value),
  }) {
    assert(add != null);
    assert(subtract != null);
    return add(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result add(int value),
    Result subtract(int value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result add(Add value),
    @required Result subtract(Subtract value),
  }) {
    assert(add != null);
    assert(subtract != null);
    return add(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result add(Add value),
    Result subtract(Subtract value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class Add implements CalculatorEvent {
  const factory Add(int value) = _$Add;

  @override
  int get value;
  @override
  $AddCopyWith<Add> get copyWith;
}

abstract class $SubtractCopyWith<$Res>
    implements $CalculatorEventCopyWith<$Res> {
  factory $SubtractCopyWith(Subtract value, $Res Function(Subtract) then) =
      _$SubtractCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

class _$SubtractCopyWithImpl<$Res> extends _$CalculatorEventCopyWithImpl<$Res>
    implements $SubtractCopyWith<$Res> {
  _$SubtractCopyWithImpl(Subtract _value, $Res Function(Subtract) _then)
      : super(_value, (v) => _then(v as Subtract));

  @override
  Subtract get _value => super._value as Subtract;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(Subtract(
      value == freezed ? _value.value : value as int,
    ));
  }
}

class _$Subtract implements Subtract {
  const _$Subtract(this.value) : assert(value != null);

  @override
  final int value;

  @override
  String toString() {
    return 'CalculatorEvent.subtract(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Subtract &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  $SubtractCopyWith<Subtract> get copyWith =>
      _$SubtractCopyWithImpl<Subtract>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result add(int value),
    @required Result subtract(int value),
  }) {
    assert(add != null);
    assert(subtract != null);
    return subtract(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result add(int value),
    Result subtract(int value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subtract != null) {
      return subtract(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result add(Add value),
    @required Result subtract(Subtract value),
  }) {
    assert(add != null);
    assert(subtract != null);
    return subtract(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result add(Add value),
    Result subtract(Subtract value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subtract != null) {
      return subtract(this);
    }
    return orElse();
  }
}

abstract class Subtract implements CalculatorEvent {
  const factory Subtract(int value) = _$Subtract;

  @override
  int get value;
  @override
  $SubtractCopyWith<Subtract> get copyWith;
}
