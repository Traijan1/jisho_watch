import 'package:flutter/material.dart';

class WordEntry extends StatelessWidget {
  final String? japanese;
  final String? english;

  const WordEntry({super.key, required this.japanese, required this.english});

  @override
  Widget build(BuildContext context) {
    return _WordEntryView(this);
  }
}

class _WordEntryView extends StatelessWidget {
  final WordEntry controller;

  const _WordEntryView(this.controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (controller.japanese != null && controller.english != null) ...[
          Expanded(
            child: Text(
              controller.japanese ?? "",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Expanded(
            child: Text(
              controller.english ?? "",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ],
    );
  }
}
