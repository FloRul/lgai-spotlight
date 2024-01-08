import 'package:flutter/material.dart';
import 'package:lgai_spotlight/business/document.dart';

class RetrievedDocumentView extends StatelessWidget {
  RetrievedDocumentView({super.key, required this.documents});

  final List<Document> documents;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        if (settings.name == '/') {
          builder = (BuildContext context) => ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('${documents[index].content.substring(0, 100)}...'),
                      onTap: () {
                        _navigatorKey.currentState!.push(
                          MaterialPageRoute(
                            builder: (context) => DetailDocumentPage(document: documents[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
        } else {
          builder = (BuildContext context) => DetailDocumentPage(document: settings.arguments as Document);
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class DetailDocumentPage extends StatelessWidget {
  final Document document;

  const DetailDocumentPage({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Détails du Document'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Contenu:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(document.content),
              const SizedBox(height: 16.0),
              const Text('Métadonnées:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Clé')),
                    DataColumn(label: Text('Valeur')),
                  ],
                  rows: document.metadata.entries.map((entry) {
                    return DataRow(cells: [
                      DataCell(Text(entry.key)),
                      DataCell(Text(entry.value.toString())),
                    ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
