import 'package:freezed_annotation/freezed_annotation.dart';
part 'rag_settings_state.freezed.dart';
part 'rag_settings_state.g.dart';

@freezed
class RagSettingsState with _$RagSettingsState {
  const factory RagSettingsState(
      {required int currentTokensOutput,
      required int minTokensOut,
      required int maxTokensOut,
      required int topK,
      required int maxTopK}) = _RagSettingsState;
  factory RagSettingsState.initial() => const RagSettingsState(
        topK: 5,
        maxTopK: 15,
        minTokensOut: 50,
        maxTokensOut: 200,
        currentTokensOutput: 100,
      );
  factory RagSettingsState.fromJson(Map<String, Object?> json) => _$RagSettingsStateFromJson(json);
}
