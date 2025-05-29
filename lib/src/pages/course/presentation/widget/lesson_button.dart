

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/pages/course/domain/entity/lesson.dart';
import 'package:rooty/src/pages/router.enum.dart';

/// height: 16 + 100 + 16
class LessonButton extends StatefulWidget {
  final LessonEntity lesson;
  final int direction;
  final VoidCallback? onTap;
  final VoidCallback? onLessonFinished;

  const LessonButton({
    super.key,
    required this.lesson,
    required this.direction,
    this.onTap,
    this.onLessonFinished
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
                    color: Colors.grey.withAlpha(125),
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
                    color: Colors.grey,
                    width: 200,
                    height: 100,
                    child: Column(
                      children: [
                        Text(
                          widget.lesson.description,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async{
                            await _hide();

                            final bool? result = await context.pushNamed<bool>(
                                Routes.lesson.name,
                                pathParameters: {
                                  // 'courseId': '${widget.lesson.courseId}',
                                  'lessonId': '${widget.lesson.id}'
                                },
                                extra: widget.lesson.splashMeta
                            );
                            if(result == true) {
                              widget.onLessonFinished?.call();
                            }
                          },
                          child: Text(
                            'start',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
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
                alignment: Alignment(widget.direction * 0.75, 0),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                        widget.lesson.title
                    ),
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
