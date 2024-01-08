import 'package:portail_levio_ai/application/rag_settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'rag_settings_notifier.g.dart';

@Riverpod(keepAlive: true)
class RagSettingsNotifier extends _$RagSettingsNotifier {
  @override
  RagSettingsState build() {
    return RagSettingsState.initial();
  }

  set topK(int value) => state = state.copyWith(topK: value);
  set currentTokensOutput(int value) => state = state.copyWith(currentTokensOutput: value);

  // void setRagSettings(RagSettings ragSettings) {
  //   state = state.copyWith(ragSettings: ragSettings);
  // }

  // Future<void> fetchRagSettings() async {
  //   try {
  //     state = state.copyWith(isLoading: true);
  //     var res = await ref.read(dioProvider).get('/rag_settings');
  //     Map<String, dynamic> json = jsonDecode(res.data);
  //     var ragSettings = RagSettings.fromJson(json);
  //     state = state.copyWith(
  //       isLoading: false,
  //       hasError: false,
  //       ragSettings: ragSettings,
  //     );
  //   } on DioException {
  //     state = state.copyWith(
  //       isLoading: false,
  //       hasError: true,
  //       ragSettings: RagSettings(),
  //     );
  //   }
  // }

  // Future<void> updateRagSettings(RagSettings ragSettings) async {
  //   try {
  //     state = state.copyWith(isLoading: true);
  //     var res = await ref.read(dioProvider).put('/rag_settings', data: ragSettings.toJson());
  //     Map<String, dynamic> json = jsonDecode(res.data);
  //     var ragSettings = RagSettings.fromJson(json);
  //     state = state.copyWith(
  //       isLoading: false,
  //       hasError: false,
  //       ragSettings: ragSettings,
  //     );
  //   } on DioException {
  //     state = state.copyWith(
  //       isLoading: false,
  //       hasError: true,
  //       ragSettings: RagSettings(),
  //     );
  //   }
  // }
}
