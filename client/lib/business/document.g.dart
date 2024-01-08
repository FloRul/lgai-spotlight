// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentImpl _$$DocumentImplFromJson(Map<String, dynamic> json) =>
    _$DocumentImpl(
      content: json['content'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$$DocumentImplToJson(_$DocumentImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'metadata': instance.metadata,
      'score': instance.score,
    };
