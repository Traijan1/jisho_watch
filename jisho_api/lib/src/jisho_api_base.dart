class JishoWord {
  final String? english;
  final String? japanese;
  final String? reading;

  const JishoWord(this.english, this.japanese, this.reading);
}

class JishoResult {
  final List<JishoWord> words;

  const JishoResult(this.words);
  factory JishoResult.fromJson(Map<String, dynamic> json) {
    if (json["meta"]["status"] != 200) {
      return JishoResult([]);
    }

    final data = List<Map<String, dynamic>>.from(json["data"]);
    final List<JishoWord> cache = [];

    for (final map in data) {
      final japanese = List<Map<String, dynamic>>.from(map["japanese"]);
      final senses = List<Map<String, dynamic>>.from(map["senses"]);

      for (var i = 0; i < japanese.length; i++) {
        final english = senses.length > i ? senses[i]["english_definitions"][0] : null;

        cache.add(
          JishoWord(
            english,
            japanese[i]["word"],
            japanese[i]["reading"],
          ),
        );
      }
    }

    return JishoResult(cache);
  }
}
