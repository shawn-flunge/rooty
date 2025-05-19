


import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:rooty/src/pages/lesson/domain/entity/step.dart';
import 'package:rooty/src/pages/lesson/presentation/widget/quiz_option_buttons.dart';

class StepView extends StatefulWidget {
  final StepContentType type;
  final Map<String, dynamic> content;
  final void Function() onPassedStep;

  const StepView({
    super.key,
    required this.type,
    required this.content,
    required this.onPassedStep
  });

  @override
  State<StepView> createState() => _StepViewState();
}

class _StepViewState extends State<StepView> with AutomaticKeepAliveClientMixin<StepView>{

  late final ValueNotifier<bool> _canPass;

  @override
  bool get wantKeepAlive => widget.type == StepContentType.quizChoiceSingle;

  @override
  void initState() {
    super.initState();
    if(widget.type == StepContentType.quizChoiceSingle || widget.type == StepContentType.quizChoiceMultiple) {
      _canPass = ValueNotifier(false);
    } else {
      _canPass = ValueNotifier(true);
    }
  }

  List<Widget> _getContentByStepType(BuildContext context) {
    switch(widget.type) {
      case StepContentType.unitExpansion:
        return _unitExpansion(context);
      case StepContentType.quizChoiceSingle || StepContentType.quizChoiceMultiple:
        return _quiz(context);
      case StepContentType.summary:
        return _summary(context);
      default:
        return _default(context);
    }
  }

  List<Widget> _unitExpansion(BuildContext context) {

    return [
      Text(
        widget.content['title'],
        style: TextStyle(
            fontSize: 44
        ),
      ),
      const SizedBox(height: 12,),
      Text(
        widget.content['description'],
        style: TextStyle(
            fontSize: 24
        ),
      ),
      const SizedBox(height: 24,),

      ...List.generate(widget.content['examples'].length, (i) {
        final example = widget.content['examples'][i];

        final sound = example['sound'];
        final character = example['character'];
        final explanation = example['explanation'];
        final meaning = example['meaning'];

        return Text(
            '$sound($character) : $explanation'
        );
      }),

    ];
  }

  List<Widget> _quiz(BuildContext context) {

    return [
      Text(
        widget.content['question'],
        style: TextStyle(
            fontSize: 44
        ),
      ),
      const SizedBox(height: 24,),
      QuizOptionButtons(
        options: widget.content['options'],
        correctIndex: widget.content['correct_index'],
        onOptionSelected: (isPassed) {
          print(isPassed);
          // _selected = selection;
          _canPass.value = isPassed;
        },
      )

    ];
  }

  List<Widget> _summary(BuildContext context) {
    return [
      Text(
        widget.content['question'],
        style: TextStyle(
            fontSize: 32
        ),
      ),

    ];
  }

  List<Widget> _default(BuildContext context) {
    return [
      Text(
        widget.content['title'],
        style: TextStyle(
            fontSize: 44
        ),
      ),
      const SizedBox(height: 24,),
      Text(
        widget.content['description'],
        style: TextStyle(
            fontSize: 24
        ),
      )
    ];
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.type.name,
            style: TextStyle(
                fontSize: 20
            ),
          ),

          ..._getContentByStepType(context),

          const Spacer(),
          ValueListenableBuilder<bool>(
              valueListenable: _canPass,
              builder: (c, canPass, _) {

                return RTConfirmButton.big(
                  text: '${widget.content['button']}',
                  backgroundColor: canPass ? Colors.green : Colors.grey,
                  onPressed: () {
                    if(_canPass.value) {
                      widget.onPassedStep.call();
                    }
                  },
                );
              }
          ),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _canPass.dispose();
    super.dispose();
  }

}
