import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lgai_spotlight/business/document.dart';
import 'package:lgai_spotlight/presentation/retrieved_document_view.dart';

void main() {
  group('RetrievedDocumentView', () {
    testWidgets('should display a list of documents', (WidgetTester tester) async {
      final documents = [
        const Document(content: 'Document 1 content', score: 0, metadata: {'key1': 'value1'}),
        const Document(content: 'Document 2 content', score: 0, metadata: {'key2': 'value2'}),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: RetrievedDocumentView(documents: documents),
        ),
      );

      expect(find.text('Document 1 content...'), findsOneWidget);
      expect(find.text('Document 2 content...'), findsOneWidget);
    });

    testWidgets('should navigate to detail document page when a document is tapped', (WidgetTester tester) async {
      final documents = [
        const Document(content: 'Document 1 content', score: 0, metadata: {'key1': 'value1'}),
        const Document(content: 'Document 2 content', score: 0, metadata: {'key2': 'value2'}),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: RetrievedDocumentView(documents: documents),
        ),
      );

      await tester.tap(find.text('Document 1 content...'));
      await tester.pumpAndSettle();

      expect(find.text('Détails du Document'), findsOneWidget);
      expect(find.text('Document 1 content'), findsOneWidget);
      expect(find.text('key1'), findsOneWidget);
      expect(find.text('value1'), findsOneWidget);
    });
  });
}
