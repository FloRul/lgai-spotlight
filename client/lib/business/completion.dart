import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lgai_spotlight/business/document.dart';

part 'completion.freezed.dart';
part 'completion.g.dart';

@freezed
class Completion with _$Completion {
  const factory Completion({
    required String text,
    required List<Document> documents,
  }) = _Completion;

  factory Completion.fromJson(Map<String, Object?> json) => _$CompletionFromJson(json);
}
