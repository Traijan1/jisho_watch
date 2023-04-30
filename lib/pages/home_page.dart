import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:jisho_api/jisho_api.dart';
import 'package:wear_jisho/widgets/word_entry.dart';
import 'package:wearable_rotary/wearable_rotary.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageController();
}

class _MyHomePageView extends StatelessWidget {
  final _MyHomePageController controller;

  const _MyHomePageView(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: WatchShape(
        builder: (context, shape, child) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Center(
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: controller.openTextField,
                ),
                TextFormField(
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (value) => controller.searchWord(),
                  focusNode: controller.focusNode,
                  controller: controller.inputController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                  ),
                ),
                const SizedBox(height: 10),
                if (controller.jishoResult != null)
                  Expanded(
                    child: Center(
                      child: FractionallySizedBox(
                        widthFactor: 0.85,
                        child: ListView.separated(
                          controller: controller.scrollController,
                          itemCount: controller.jishoResult!.words.length,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const SizedBox(height: 7.5),
                          itemBuilder: (context, index) {
                            final words = controller.jishoResult!.words;
                            return WordEntry(
                              english: words[index].english,
                              japanese: words[index].japanese,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MyHomePageController extends State<MyHomePage> {
  RotaryScrollController scrollController = RotaryScrollController();

  TextEditingController inputController = TextEditingController();
  FocusNode focusNode = FocusNode();

  JishoResult? jishoResult;

  void openTextField() => FocusScope.of(context).requestFocus(focusNode);
  void searchWord() {
    if (inputController.text.isEmpty) {
      return;
    }

    JishoApiService.searchTranslations(inputController.text).then(
      (value) => setState(() => jishoResult = value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _MyHomePageView(this);
  }
}
