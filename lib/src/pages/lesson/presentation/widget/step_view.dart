

import 'package:design_system/color.dart';
import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:rooty/src/core/find_value_from_l10n.dart';
import 'package:rooty/src/localizations/texts.dart';
import 'package:rooty/src/pages/lesson/domain/entity/step.dart';
import 'package:rooty/src/pages/lesson/presentation/widget/example_words.dart';
import 'package:rooty/src/pages/lesson/presentation/widget/quiz_option_buttons.dart';

class StepView extends StatefulWidget {
  final StepContentType type;
  final Map<String, dynamic> content;
  final Map<String, dynamic> bundle;
  final void Function() onPassedStep;

  const StepView({
    super.key,
    required this.type,
    required this.content,
    required this.bundle,
    required this.onPassedStep
  });

  @override
  State<StepView> createState() => _StepViewState();
}

class _StepViewState extends State<StepView> with AutomaticKeepAliveClientMixin<StepView>{

  late final ValueNotifier<bool> _canPass;

  @override
  bool get wantKeepAlive => widget.type == StepContentType.quizChoiceSingle;

  Map<String, dynamic> get content => widget.content;
  Map<String, dynamic> get bundle => widget.bundle;

  String _localizedString(String contentKey) {
    return bundle.findString(content[contentKey]);
  }

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
      Center(
        child: Text(
          _localizedString('title'),
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            fontSize: 40,
            color: context.colors.text,
            fontVariations: [
              FontVariation.weight(320)
            ]
          ),
        ),
      ),
      const SizedBox(height: 24,),

      ExampleWordsView(
        words: widget.content['examples'],
        bundle: widget.bundle,
      ),
      ..._descriptions(context),

    ];
  }

  List<Widget> _quiz(BuildContext context) {

    return [
      Center(
        child: Text(
          _localizedString('question'),
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            fontSize: 28,
            color: context.colors.text,
            fontVariations: [
              FontVariation.weight(320)
            ]
          ),
        ),
      ),
      const SizedBox(height: 24,),
      QuizOptionButtons(
        options: widget.content['options'],
        bundle: widget.bundle,
        correctIndex: widget.content['correct_index'],
        onOptionSelected: (isPassed) {
          // _selected = selection;
          _canPass.value = isPassed;
        },
      )

    ];
  }

  List<Widget> _summary(BuildContext context) {
    return [
      Text(
        _localizedString('question'),
        textScaler: TextScaler.noScaling,
        style: TextStyle(
          fontSize: 32,
          color: context.colors.text,
          fontVariations: [
            FontVariation.weight(320)
          ]
        ),
      ),

    ];
  }

  List<Widget> _default(BuildContext context) {
    return [
      Center(
        child: Text(
          _localizedString('title'),
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            fontSize: 40,
            color: context.colors.text,
            fontVariations: [
              FontVariation.weight(320)
            ]
          ),
        ),
      ),
      ..._descriptions(context)
    ];
  }

  List<Widget> _descriptions(BuildContext context) {
    return List.generate(content['description'].length, (i) {
      final key = content['description'][i];

      // print(bundle.findString(key));
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          bundle.findString(key),
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            fontSize: 18,
            color: context.colors.text,
            fontVariations: [
              FontVariation.weight(320)
            ]
          ),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._getContentByStepType(context),

          const Spacer(),
          ValueListenableBuilder<bool>(
              valueListenable: _canPass,
              builder: (c, canPass, _) {

                return RTConfirmButton.medium(
                  text: RootyTexts.of(context).get(widget.content['button'])!.text,
                  backgroundColor: canPass ? context.colors.primary : context.colors.disabled,
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
