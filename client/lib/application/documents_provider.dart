import 'dart:convert';

import 'package:lgai_spotlight/business/completion.dart';
import 'package:lgai_spotlight/business/document.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'documents_provider.g.dart';

@riverpod
class DocumentsGetter extends _$DocumentsGetter {
  @override
  FutureOr<List<Document>> build(String? messageId) async {
    if (messageId == null || messageId.isEmpty) return [];
    final prefs = await SharedPreferences.getInstance();
    var res = prefs.getString(messageId);
    if (res == null) return [];
    var completion = Completion.fromJson(jsonDecode(res));
    return completion.documents;
  }
}
