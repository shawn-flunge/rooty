


import 'package:flutter/material.dart';

class QuizOptionButtons extends StatefulWidget {

  final List<dynamic> options;
  final int correctIndex;
  final void Function(bool isPassed) onOptionSelected;


  const QuizOptionButtons({
    super.key,
    required this.options,
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
            padding: const EdgeInsets.symmetric(vertical: 6),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: _selected.contains(i)
                    ? widget.correctIndex == i ? Colors.green : Colors.grey
                    : Colors.grey.shade200
            ),
            child: Text(
              option['text'],
              style: TextStyle(
                  fontSize: 24
              ),
            ),
          ),
        );
      }),
    );
  }

}
