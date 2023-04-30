import 'package:jisho_api/jisho_api.dart';
import 'package:jisho_api/src/jisho_api_service.dart';

void main() async {
  final result = await JishoApiService.searchTranslations("to eat");

  print(result.words[0].english);
  print(result.words[0].japanese);
  print(result.words[0].reading);
}
