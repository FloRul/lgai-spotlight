import 'package:freezed_annotation/freezed_annotation.dart';
part 'document.freezed.dart';
part 'document.g.dart';

@freezed
class Document with _$Document {
  const factory Document({
    required String content,
    required Map<String, dynamic> metadata,
    required double score,
  }) = _Document;

  factory Document.fromJson(Map<String, Object?> json) => _$DocumentFromJson(json);
}
