import 'package:jisho_api/src/jisho_api_service.dart';
import 'package:test/test.dart';

void main() {
  group('Testing the searchTranslations Method', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Search for apple is not empty', () {
      return JishoApiService.searchTranslations("apple").then((value) {
        expect(value.words.isNotEmpty, isTrue);
      });
    });

    test('Search for apple gets りんご as reading', () {
      return JishoApiService.searchTranslations("apple").then((value) {
        expect(value.words[0].reading == "りんご", isTrue);
      });
    });

    test('Search for "to eat" gets 食べる as japanese', () {
      return JishoApiService.searchTranslations("to eat").then((value) {
        expect(value.words[0].japanese == "食べる", isTrue);
      });
    });

    test('Search for "飲む" gets to drink as english', () {
      return JishoApiService.searchTranslations("飲む").then((value) {
        expect(value.words[0].english == "to drink", isTrue);
      });
    });
  });
}
