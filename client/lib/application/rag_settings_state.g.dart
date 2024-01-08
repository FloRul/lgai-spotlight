// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rag_settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RagSettingsStateImpl _$$RagSettingsStateImplFromJson(
        Map<String, dynamic> json) =>
    _$RagSettingsStateImpl(
      currentTokensOutput: json['currentTokensOutput'] as int,
      minTokensOut: json['minTokensOut'] as int,
      maxTokensOut: json['maxTokensOut'] as int,
      topK: json['topK'] as int,
      maxTopK: json['maxTopK'] as int,
    );

Map<String, dynamic> _$$RagSettingsStateImplToJson(
        _$RagSettingsStateImpl instance) =>
    <String, dynamic>{
      'currentTokensOutput': instance.currentTokensOutput,
      'minTokensOut': instance.minTokensOut,
      'maxTokensOut': instance.maxTokensOut,
      'topK': instance.topK,
      'maxTopK': instance.maxTopK,
    };
