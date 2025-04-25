

import 'package:flutter/material.dart';

class StepSceneView extends StatefulWidget {
  final List<dynamic> steps;

  const StepSceneView({
    super.key,
    required this.steps
  });

  @override
  State<StepSceneView> createState() => _StepSceneViewState();
}

class _StepSceneViewState extends State<StepSceneView> {

  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }


  _goToNextStep(int index) {
    if(index == widget.steps.length-1) {

      /// todo 종료
      //
    } else {
      final sceneHeight = _controller.position.maxScrollExtent/(widget.steps.length-1);
      _animateTo(sceneHeight * (index + 1));
    }
  }

  _animateTo(double offset) => _controller.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease
  );

  _offsetCorrection() {
    final sceneHeight = _controller.position.maxScrollExtent/(widget.steps.length-1);
    final currentOffset = _controller.offset;

    final divided = currentOffset / sceneHeight;

    int to;
    final decimal = divided- divided.floor();
    if(decimal < 0.3) {
      to = divided.round();
    } else if(decimal < 0.55) {
      to = divided.floor();
    } else {
      to = divided.round();
    }

    _animateTo(to * sceneHeight);
  }


  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if(notification is ScrollEndNotification) {
          Future.microtask(_offsetCorrection);
        }
        return true;
      },
      child: LayoutBuilder(
        builder: (context, constraints) {

          return ListView.builder(
            controller: _controller,
            itemExtent: constraints.maxHeight,
            itemCount: widget.steps.length,
            itemBuilder: (context, index) {

              return Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(
                          color: Colors.red,
                          width: 3
                      )
                  ),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'step $index',
                            style: TextStyle(
                                fontSize: 48
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _goToNextStep(index);
                            },
                            child: Text(
                              'next',
                              style: TextStyle(
                                  fontSize: 36
                              ),
                            ),
                          )
                        ],
                      )
                  )
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
