

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/pages/router.enum.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {


  late final ScrollController _controller;
  final lessons = [1,2,3,4,5,6,7,8,9];

  @override
  void initState() {
    super.initState();
    /// 진행 중인 레슨이 있으면 거기를 initialScrollOffset으로
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Course'
        ),
      ),
      body: LayoutBuilder(
          builder: (c, constraints) {
            return ListView.builder(
                controller: _controller,
                itemCount: lessons.length + 1,
                itemBuilder: (c2, i) {
                  if(i == lessons.length) {
                    return const SizedBox(
                      height: 264,
                    );
                  }

                  final lesson = lessons[i];
                  final d = i % 2 == 0 ? 1 : -1;

                  return LessonButton(
                    lesson: lesson.toString(),
                    direction: d,
                    onTap: () async {

                      final double to = (132.0 * (i+1) - constraints.maxHeight/2)
                          .clamp(0, _controller.position.maxScrollExtent);

                      await _controller.animateTo(
                          to,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease
                      );
                    },
                  );
                }
            );
          }
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// height: 16 + 100 + 16
class LessonButton extends StatefulWidget {
  final String lesson;
  final int direction;
  final VoidCallback? onTap;

  const LessonButton({
    super.key,
    required this.lesson,
    required this.direction,
    this.onTap
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
                          'sdafsdf',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async{
                            await _hide();
                            context.goNamed(Routes.lesson.name);
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
                    child: Text(widget.lesson),
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
