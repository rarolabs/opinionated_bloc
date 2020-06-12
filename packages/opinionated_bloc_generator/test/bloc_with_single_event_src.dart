import 'package:bloc/bloc.dart';
import 'package:opinionated_bloc_annotations/opinionated_bloc_annotations.dart';
import 'package:source_gen_test/annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@ShouldGenerate(r'''
abstract class SingleEventBlocMapping {
  Stream<SingleEventState> onAdd(int value, List<Map<String, String>> foo);
}

mixin SingleEventBlocOpinionated on Bloc<SingleEventEvent, SingleEventState>
    implements SingleEventBlocMapping {
  @override
  Stream<SingleEventState> mapEventToState(
    SingleEventEvent event,
  ) async* {
    yield* onAdd(event.value, event.foo);
  }
}
''')
@opinionatedBloc
class SingleEventBloc extends Bloc<SingleEventEvent, SingleEventState> {
  @override
  SingleEventState get initialState => SingleEventState.done(0);

  @override
  Stream<SingleEventState> mapEventToState(SingleEventEvent event) {
    throw UnimplementedError();
  }
}

abstract class SingleEventState with _$SingleEventState {
  const factory SingleEventState.done(int result) = Done;
}

abstract class SingleEventEvent with _$SingleEventEvent {
  const factory SingleEventEvent.add(int value, List<Map<String, String>> foo) =
      Add;
}

T _$identity<T>(T value) => value;

class _$SingleEventStateTearOff {
  const _$SingleEventStateTearOff();

  Done done(int result) {
    return Done(
      result,
    );
  }
}

// ignore: unused_element
const $SingleEventState = _$SingleEventStateTearOff();

mixin _$SingleEventState {
  int get result;

  $SingleEventStateCopyWith<SingleEventState> get copyWith;
}

abstract class $SingleEventStateCopyWith<$Res> {
  factory $SingleEventStateCopyWith(
          SingleEventState value, $Res Function(SingleEventState) then) =
      _$SingleEventStateCopyWithImpl<$Res>;
  $Res call({int result});
}

class _$SingleEventStateCopyWithImpl<$Res>
    implements $SingleEventStateCopyWith<$Res> {
  _$SingleEventStateCopyWithImpl(this._value, this._then);

  final SingleEventState _value;
  // ignore: unused_field
  final $Res Function(SingleEventState) _then;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed ? _value.result : result as int,
    ));
  }
}

abstract class $DoneCopyWith<$Res> implements $SingleEventStateCopyWith<$Res> {
  factory $DoneCopyWith(Done value, $Res Function(Done) then) =
      _$DoneCopyWithImpl<$Res>;
  @override
  $Res call({int result});
}

class _$DoneCopyWithImpl<$Res> extends _$SingleEventStateCopyWithImpl<$Res>
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
    return 'SingleEventState.done(result: $result)';
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

abstract class Done implements SingleEventState {
  const factory Done(int result) = _$Done;

  @override
  int get result;
  @override
  $DoneCopyWith<Done> get copyWith;
}

class _$SingleEventEventTearOff {
  const _$SingleEventEventTearOff();

  Add add(int value, List<Map<String, String>> foo) {
    return Add(
      value,
      foo,
    );
  }
}

// ignore: unused_element
const $SingleEventEvent = _$SingleEventEventTearOff();

mixin _$SingleEventEvent {
  int get value;
  List<Map<String, String>> get foo;

  $SingleEventEventCopyWith<SingleEventEvent> get copyWith;
}

abstract class $SingleEventEventCopyWith<$Res> {
  factory $SingleEventEventCopyWith(
          SingleEventEvent value, $Res Function(SingleEventEvent) then) =
      _$SingleEventEventCopyWithImpl<$Res>;
  $Res call({int value, List<Map<String, String>> foo});
}

class _$SingleEventEventCopyWithImpl<$Res>
    implements $SingleEventEventCopyWith<$Res> {
  _$SingleEventEventCopyWithImpl(this._value, this._then);

  final SingleEventEvent _value;
  // ignore: unused_field
  final $Res Function(SingleEventEvent) _then;

  @override
  $Res call({
    Object value = freezed,
    Object foo = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed ? _value.value : value as int,
      foo: foo == freezed ? _value.foo : foo as List<Map<String, String>>,
    ));
  }
}

abstract class $AddCopyWith<$Res> implements $SingleEventEventCopyWith<$Res> {
  factory $AddCopyWith(Add value, $Res Function(Add) then) =
      _$AddCopyWithImpl<$Res>;
  @override
  $Res call({int value, List<Map<String, String>> foo});
}

class _$AddCopyWithImpl<$Res> extends _$SingleEventEventCopyWithImpl<$Res>
    implements $AddCopyWith<$Res> {
  _$AddCopyWithImpl(Add _value, $Res Function(Add) _then)
      : super(_value, (v) => _then(v as Add));

  @override
  Add get _value => super._value as Add;

  @override
  $Res call({
    Object value = freezed,
    Object foo = freezed,
  }) {
    return _then(Add(
      value == freezed ? _value.value : value as int,
      foo == freezed ? _value.foo : foo as List<Map<String, String>>,
    ));
  }
}

class _$Add implements Add {
  const _$Add(this.value, this.foo)
      : assert(value != null),
        assert(foo != null);

  @override
  final int value;
  @override
  final List<Map<String, String>> foo;

  @override
  String toString() {
    return 'SingleEventEvent.add(value: $value, foo: $foo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Add &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.foo, foo) ||
                const DeepCollectionEquality().equals(other.foo, foo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(foo);

  @override
  $AddCopyWith<Add> get copyWith => _$AddCopyWithImpl<Add>(this, _$identity);
}

abstract class Add implements SingleEventEvent {
  const factory Add(int value, List<Map<String, String>> foo) = _$Add;

  @override
  int get value;
  @override
  List<Map<String, String>> get foo;
  @override
  $AddCopyWith<Add> get copyWith;
}
