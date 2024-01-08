import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portail_levio_ai/application/rag_settings_notifier.dart';

class RagSettingsView extends ConsumerWidget {
  const RagSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ragSettings = ref.watch(ragSettingsNotifierProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Max Tokens Output: ${ragSettings.currentTokensOutput}'),
          Slider(
            divisions: ragSettings.maxTokensOut - ragSettings.minTokensOut,
            value: ragSettings.currentTokensOutput.toDouble(),
            min: ragSettings.minTokensOut.toDouble(),
            max: ragSettings.maxTokensOut.toDouble(),
            onChanged: (value) => ref.read(ragSettingsNotifierProvider.notifier).currentTokensOutput = value.toInt(),
          ),
          Text('Top K: ${ragSettings.topK}'),
          Slider(
            divisions: ragSettings.maxTopK,
            value: ragSettings.topK.toDouble(),
            min: 0,
            max: 15,
            onChanged: (value) => ref.read(ragSettingsNotifierProvider.notifier).topK = value.toInt(),
          ),
        ],
      ),
    );
  }
}
