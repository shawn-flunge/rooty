


import 'package:design_system/color.dart';
import 'package:flutter/material.dart';
import 'package:rooty/src/core/find_value_from_l10n.dart';

class QuizOptionButtons extends StatefulWidget {

  final List<dynamic> options;
  final Map<String, dynamic> bundle;
  final int correctIndex;
  final void Function(bool isPassed) onOptionSelected;


  const QuizOptionButtons({
    super.key,
    required this.options,
    required this.bundle,
    required this.correctIndex,
    required this.onOptionSelected,
  });

  @override
  State<QuizOptionButtons> createState() => _QuizOptionButtonsState();
}

class _QuizOptionButtonsState extends State<QuizOptionButtons> {

  final Set<int> _selected = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.options.length, (i) {
        final option = widget.options[i];

        return GestureDetector(
          onTap: () {

            if(_selected.contains(widget.correctIndex) || _selected.contains(i)) {
              return;
            }

            setState(() {
              _selected.add(i);
            });

            widget.onOptionSelected.call(i == widget.correctIndex);

          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _selected.contains(i)
                  ? widget.correctIndex == i ? context.colors.primary : context.colors.disabled
                  : context.colors.lightGrey
            ),
            child: Text(
              widget.bundle.findString(option['text']),
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontVariations: [
                  FontVariation.weight(360)
                ]
              ),
            ),
          ),
        );
      }),
    );
  }

}
