import 'dart:convert';

import 'package:http/http.dart' as http;

import '../jisho_api.dart';

class JishoApiService {
  static const String _baseUrl = "https://jisho.org/api/v1/search/words";

  static Future<JishoResult> searchTranslations(String toSearch) async {
    final result = await http.get(Uri.parse('$_baseUrl?keyword=$toSearch'));
    return JishoResult.fromJson(jsonDecode(result.body));
  }
}
