// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rag_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RagSettingsState _$RagSettingsStateFromJson(Map<String, dynamic> json) {
  return _RagSettingsState.fromJson(json);
}

/// @nodoc
mixin _$RagSettingsState {
  int get currentTokensOutput => throw _privateConstructorUsedError;
  int get minTokensOut => throw _privateConstructorUsedError;
  int get maxTokensOut => throw _privateConstructorUsedError;
  int get topK => throw _privateConstructorUsedError;
  int get maxTopK => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RagSettingsStateCopyWith<RagSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RagSettingsStateCopyWith<$Res> {
  factory $RagSettingsStateCopyWith(
          RagSettingsState value, $Res Function(RagSettingsState) then) =
      _$RagSettingsStateCopyWithImpl<$Res, RagSettingsState>;
  @useResult
  $Res call(
      {int currentTokensOutput,
      int minTokensOut,
      int maxTokensOut,
      int topK,
      int maxTopK});
}

/// @nodoc
class _$RagSettingsStateCopyWithImpl<$Res, $Val extends RagSettingsState>
    implements $RagSettingsStateCopyWith<$Res> {
  _$RagSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTokensOutput = null,
    Object? minTokensOut = null,
    Object? maxTokensOut = null,
    Object? topK = null,
    Object? maxTopK = null,
  }) {
    return _then(_value.copyWith(
      currentTokensOutput: null == currentTokensOutput
          ? _value.currentTokensOutput
          : currentTokensOutput // ignore: cast_nullable_to_non_nullable
              as int,
      minTokensOut: null == minTokensOut
          ? _value.minTokensOut
          : minTokensOut // ignore: cast_nullable_to_non_nullable
              as int,
      maxTokensOut: null == maxTokensOut
          ? _value.maxTokensOut
          : maxTokensOut // ignore: cast_nullable_to_non_nullable
              as int,
      topK: null == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int,
      maxTopK: null == maxTopK
          ? _value.maxTopK
          : maxTopK // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RagSettingsStateImplCopyWith<$Res>
    implements $RagSettingsStateCopyWith<$Res> {
  factory _$$RagSettingsStateImplCopyWith(_$RagSettingsStateImpl value,
          $Res Function(_$RagSettingsStateImpl) then) =
      __$$RagSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentTokensOutput,
      int minTokensOut,
      int maxTokensOut,
      int topK,
      int maxTopK});
}

/// @nodoc
class __$$RagSettingsStateImplCopyWithImpl<$Res>
    extends _$RagSettingsStateCopyWithImpl<$Res, _$RagSettingsStateImpl>
    implements _$$RagSettingsStateImplCopyWith<$Res> {
  __$$RagSettingsStateImplCopyWithImpl(_$RagSettingsStateImpl _value,
      $Res Function(_$RagSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTokensOutput = null,
    Object? minTokensOut = null,
    Object? maxTokensOut = null,
    Object? topK = null,
    Object? maxTopK = null,
  }) {
    return _then(_$RagSettingsStateImpl(
      currentTokensOutput: null == currentTokensOutput
          ? _value.currentTokensOutput
          : currentTokensOutput // ignore: cast_nullable_to_non_nullable
              as int,
      minTokensOut: null == minTokensOut
          ? _value.minTokensOut
          : minTokensOut // ignore: cast_nullable_to_non_nullable
              as int,
      maxTokensOut: null == maxTokensOut
          ? _value.maxTokensOut
          : maxTokensOut // ignore: cast_nullable_to_non_nullable
              as int,
      topK: null == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int,
      maxTopK: null == maxTopK
          ? _value.maxTopK
          : maxTopK // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RagSettingsStateImpl implements _RagSettingsState {
  const _$RagSettingsStateImpl(
      {required this.currentTokensOutput,
      required this.minTokensOut,
      required this.maxTokensOut,
      required this.topK,
      required this.maxTopK});

  factory _$RagSettingsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RagSettingsStateImplFromJson(json);

  @override
  final int currentTokensOutput;
  @override
  final int minTokensOut;
  @override
  final int maxTokensOut;
  @override
  final int topK;
  @override
  final int maxTopK;

  @override
  String toString() {
    return 'RagSettingsState(currentTokensOutput: $currentTokensOutput, minTokensOut: $minTokensOut, maxTokensOut: $maxTokensOut, topK: $topK, maxTopK: $maxTopK)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RagSettingsStateImpl &&
            (identical(other.currentTokensOutput, currentTokensOutput) ||
                other.currentTokensOutput == currentTokensOutput) &&
            (identical(other.minTokensOut, minTokensOut) ||
                other.minTokensOut == minTokensOut) &&
            (identical(other.maxTokensOut, maxTokensOut) ||
                other.maxTokensOut == maxTokensOut) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.maxTopK, maxTopK) || other.maxTopK == maxTopK));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentTokensOutput,
      minTokensOut, maxTokensOut, topK, maxTopK);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RagSettingsStateImplCopyWith<_$RagSettingsStateImpl> get copyWith =>
      __$$RagSettingsStateImplCopyWithImpl<_$RagSettingsStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RagSettingsStateImplToJson(
      this,
    );
  }
}

abstract class _RagSettingsState implements RagSettingsState {
  const factory _RagSettingsState(
      {required final int currentTokensOutput,
      required final int minTokensOut,
      required final int maxTokensOut,
      required final int topK,
      required final int maxTopK}) = _$RagSettingsStateImpl;

  factory _RagSettingsState.fromJson(Map<String, dynamic> json) =
      _$RagSettingsStateImpl.fromJson;

  @override
  int get currentTokensOutput;
  @override
  int get minTokensOut;
  @override
  int get maxTokensOut;
  @override
  int get topK;
  @override
  int get maxTopK;
  @override
  @JsonKey(ignore: true)
  _$$RagSettingsStateImplCopyWith<_$RagSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
