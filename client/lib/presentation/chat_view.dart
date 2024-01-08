import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portail_levio_ai/application/chat_state_notifier.dart';
import 'package:uuid/uuid.dart';

class ChatView extends ConsumerWidget {
  const ChatView({
    super.key,
    required this.onMessageSelected,
  });

  final void Function(String messageId) onMessageSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chatState = ref.watch(chatStateNotifierProvider);
    var colorScheme = Theme.of(context).colorScheme;
    return Chat(
      onMessageTap: (context, p1) => onMessageSelected(p1.id),
      emptyState: const Center(
        child: Text('Aucun message'),
      ),
      theme: DefaultChatTheme(
        inputBorderRadius: BorderRadius.circular(15),
        backgroundColor: Colors.transparent,
        sendingIcon: const CircularProgressIndicator(),
        inputBackgroundColor: colorScheme.onBackground,
        inputTextColor: colorScheme.onPrimary,
        primaryColor: colorScheme.primary,
      ),
      messages: chatState.messages.reversed.toList(),
      onSendPressed: (pText) async {
        await ref.read(chatStateNotifierProvider.notifier).callCompletion(
              types.TextMessage(
                id: const Uuid().v1(),
                author: const types.User(id: '1'),
                text: pText.text,
              ),
            );
      },
      user: const types.User(id: '1'),
    );
  }
}
