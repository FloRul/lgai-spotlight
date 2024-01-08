import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:lgai_spotlight/application/documents_provider.dart';
import 'package:lgai_spotlight/presentation/chat_view.dart';
import 'package:lgai_spotlight/presentation/common/elevated_card.dart';
import 'package:lgai_spotlight/presentation/rag_settings_view.dart';
import 'package:lgai_spotlight/presentation/retrieved_document_view.dart';
import 'package:lgai_spotlight/presentation/sidebar_view.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomePage> {
  late SidebarXController _controller;
  String? _selectedMessageId;
  @override
  void initState() {
    super.initState();
    _controller = SidebarXController(selectedIndex: 0, extended: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SidebarView(controller: _controller),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          'Bienvenue sur le portail Levio GenAI',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Vous pouvez maintenant questionner vos données',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Expanded(
                          child: ElevatedCard(
                            child: ChatView(
                              onMessageSelected: (messageId) => setState(() => _selectedMessageId = messageId),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: ElevatedCard(
                            title: 'Paramètres',
                            child: RagSettingsView(),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: ElevatedCard(
                            title: 'Documents récupérés',
                            child: ref.watch(documentsGetterProvider(_selectedMessageId)).when(
                                data: (documents) => RetrievedDocumentView(
                                      documents: documents,
                                    ),
                                loading: () => const Center(child: CircularProgressIndicator()),
                                error: (error, stackTrace) => Center(child: Text(error.toString()))),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
