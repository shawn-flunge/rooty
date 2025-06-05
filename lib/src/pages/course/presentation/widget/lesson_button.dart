
import 'package:design_system/color.dart';
import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/core/find_value_from_l10n.dart';
import 'package:rooty/src/localizations/texts.dart';
import 'package:rooty/src/localizations/widget.dart';
import 'package:rooty/src/pages/course/domain/entity/lesson.dart';
import 'package:rooty/src/pages/router.enum.dart';

/// height: 16 + 100 + 16
class LessonButton extends StatefulWidget {
  final LessonEntity lesson;
  final bool disabled;
  final bool isDone;
  final int direction;
  final VoidCallback? onTap;
  // final VoidCallback? onLessonFinished;

  const LessonButton({
    super.key,
    required this.lesson,
    required this.disabled,
    required this.isDone,
    required this.direction,
    this.onTap,
    // this.onLessonFinished
  });

  @override
  State<LessonButton> createState() => _LessonButtonState();
}


class _LessonButtonState extends State<LessonButton> with SingleTickerProviderStateMixin{
  final LayerLink _layerLink = LayerLink();
  final OverlayPortalController _portalController = OverlayPortalController();
  late final AnimationController _animationController;

  void _toggleOverlay() {
    if(_portalController.isShowing) {
      _hide();
    } else {
      _show();
    }
  }

  void _show() {
    widget.onTap?.call();
    _animationController.reset();
    _animationController.forward();
    _portalController.show();
  }

  Future<void> _hide() async{
    await _animationController.reverse();
    _portalController.hide();
  }


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 10));
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (c, _) => _hide(),
      child: OverlayPortal(
        controller: _portalController,
        overlayChildBuilder: (context) {
          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => _toggleOverlay(),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color: context.colors.dimmed,
                  ),
                ),
              ),
              CompositedTransformFollower(
                link: _layerLink,
                followerAnchor: Alignment.topCenter,
                targetAnchor: Alignment.bottomCenter,
                child: ScaleTransition(
                  scale: _animationController,
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      color: context.colors.modalBackground,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LocalizedText(
                          widget.lesson.title.byLanguage(),
                          style: TextStyle(
                            fontSize: 24,
                            color: context.colors.text,
                            fontVariations: [
                              FontVariation.weight(400)
                            ]
                          ),
                        ),
                        const SizedBox(height: 8,),
                        LocalizedText(
                          widget.lesson.description.byLanguage(),
                          style: TextStyle(
                            fontSize: 18,
                            color: context.colors.text,
                            fontVariations: [
                              FontVariation.weight(320)
                            ]
                          ),
                        ),
                        const SizedBox(height: 16,),
                        RTConfirmButton.small(
                          text: RootyTexts.of(context).get('start')?.text ?? '',
                          onPressed: () async{
                            await _hide();

                            final bool? result = await context.pushNamed<bool>(
                                Routes.lesson.name,
                                pathParameters: {
                                  // 'courseId': '${widget.lesson.courseId}',
                                  'lessonId': '${widget.lesson.id}'
                                },
                                extra: widget.lesson.splashMeta
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        child: CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: _toggleOverlay,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Align(
                alignment: Alignment(widget.direction * 0.25, 0),
                child: RTPushButton(
                  isPressed: widget.isDone,
                  disabled: widget.disabled,
                  onPressed: _toggleOverlay,
                  child: LocalizedText(
                    // widget.lesson.title,
                    widget.lesson.title.byLanguage(),
                    style: TextStyle(
                      color: widget.disabled ? Colors.grey : Colors.white,
                      fontSize: 18,
                      fontVariations: [
                        FontVariation.weight(500)
                      ],
                      shadows: widget.disabled
                        ? null
                        : [
                          Shadow(
                            color: Color(0x3C000000),
                            offset: Offset(1, 1),
                            blurRadius: 4
                          )
                        ]
                    ),
                    // textScaler: TextScaler.noScaling,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if(_portalController.isShowing) {
      _portalController.hide();
    }
    if(_animationController.isAnimating){
      _animationController.stop();
    }
    _animationController.dispose();
    super.dispose();
  }
}
