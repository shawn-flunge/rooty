
import 'package:design_system/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:rooty/src/core/find_value_from_l10n.dart';


class ExampleWordsView extends StatefulWidget {

  // final List<Map<String, dynamic>> words;
  final List<dynamic> words;
  final Map<String, dynamic> bundle;

  const ExampleWordsView({
    super.key,
    required this.words,
    required this.bundle
  });

  @override
  State<ExampleWordsView> createState() => _ExampleWordsViewState();
}

class _ExampleWordsViewState extends State<ExampleWordsView> {

  late final PageController _controller;
  late final ValueNotifier<int> _currentPage;

  List<dynamic> get examples => widget.words;
  Map<String, dynamic> get bundle => widget.bundle;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.9);
    _currentPage = ValueNotifier(0);
  }

  void onPageChanged(int page) {
    _currentPage.value = page;
  }

  void goTo(bool next) {
    if(next) {
      if(_currentPage.value == examples.length-1) return;
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      if(_currentPage.value == 0) return;
      _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }

  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: 230,
          child: PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: examples.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, i) {
              final example = examples[i];

              return _Content(
                example: example,
                bundle: bundle
              );
            },
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                LucideIcons.chevron_left,
                color: context.colors.text,
                size: 16,
              ),
              onPressed: () => goTo(false),
            ),
            ValueListenableBuilder<int>(
                valueListenable: _currentPage,
                builder: (c, value, _) {
                  return Text(
                    '${value+1}',
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      fontSize: 16,
                      color: context.colors.text,
                      fontVariations: [
                        FontVariation.weight(360)
                      ]
                    ),
                  );
                }
            ),
            IconButton(
              icon: Icon(
                LucideIcons.chevron_right,
                color: context.colors.text,
                size: 16,
              ),
              onPressed: () => goTo(true),
            ),
          ],
        )

      ],
    );

  }


  @override
  void dispose() {
    _controller.dispose();
    _currentPage.dispose();
    super.dispose();
  }
}




class _Content extends StatelessWidget {
  final dynamic example;
  final Map<String, dynamic> bundle;

  const _Content({super.key, this.example, required this.bundle});

  @override
  Widget build(BuildContext context) {
    final sound = example['sound'];
    final character = example['character'];
    final explanation = bundle.findString(example['explanation']);

    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: context.colors.cardBackground,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Text(
            '$sound($character)',
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontSize: 26,
              color: context.colors.text,
              fontVariations: [
                FontVariation.weight(360)
              ]
            ),
          ),
          Text(
            explanation,
            textScaler: TextScaler.noScaling,
            style: TextStyle(
                fontSize: 16,
                color: context.colors.text,
                fontVariations: [
                  FontVariation.weight(320)
                ]
            ),
          )
        ],
      ),
    );
  }
}
