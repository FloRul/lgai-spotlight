import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_messages_state.freezed.dart';

typedef ChatMessage = types.Message;

@freezed
class ChatMessagesState with _$ChatMessagesState {
  const factory ChatMessagesState({
    required List<ChatMessage> messages,
    required bool isLoading,
    required bool hasError,
  }) = _ChatMessagesState;

  factory ChatMessagesState.initial() => const ChatMessagesState(
        messages: [],
        isLoading: false,
        hasError: false,
      );
}
