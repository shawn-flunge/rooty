

import 'package:flutter/material.dart';

class RTBnb extends StatefulWidget {

  final int shellIndex;

  final void Function(int index)? onTapChanged;

  const RTBnb({super.key, required this.shellIndex, this.onTapChanged});

  @override
  State<RTBnb> createState() => _RTBnbState();
}

class _RTBnbState extends State<RTBnb> with SingleTickerProviderStateMixin{

  /// iconoir: home, cellar
  /// lucide: home, layers, bolt
  final items = [
    _Item(
      child: Text('home'),
    ),
    _Item(
      child: Text('courses'),
    ),
    _Item(
      child: Text('setting'),
    ),
  ];

  late final AnimationController _controller;
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.shellIndex;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      upperBound: items.length-1,
      value: _selected.toDouble()
    );
  }

  @override
  void didUpdateWidget(covariant RTBnb oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.shellIndex != _selected){
      setState(() {
        _selected = widget.shellIndex;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      // margin: const EdgeInsets.all(16),
      // decoration: SquircleDecoration(
      //   color: Colors.blue
      // ),
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12)
        ),
        border: Border.all(
          color: Colors.black
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (i){
              return GestureDetector(
                onTap: () {

                  if(_selected == i){
                    return;
                  }

                  setState(() {
                    _selected = i;
                  });

                  _controller.animateTo(i.toDouble());
                  widget.onTapChanged?.call(_selected);

                },
                child: items[i],
              );
            }),
          ),
          SizedBox(
            width: double.infinity,
            height: 4,
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return CustomPaint(
                    painter: _BottomIndicator(_selected, _controller),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final Widget child;
  const _Item({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      color: Colors.grey,
      alignment: Alignment.center,
      child: child,
    );
  }
}


class _BottomIndicator extends CustomPainter {

  final int index;
  final Animation _animation;
  late final Paint _painter;
  _BottomIndicator(this.index, this._animation) : super(repaint: _animation) {
    _painter = Paint()..color = Colors.blue;
  }

  @override
  void paint(Canvas canvas, Size size) {
    const barWidth = 48.0;

    final l = 3;

    final position = (size.width - barWidth) / (l - 1) * (_animation.value);

    final rect = Rect.fromCenter(
      center: Offset(position + 24, size.height/2),
      width: barWidth,
      height: size.height
    );

    canvas.drawRect(rect, _painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}


// class SquircleCurveRatio {
//   late final double topLeft;
//   late final double topRight;
//   late final double bottomLeft;
//   late final double bottomRight;
//
//   SquircleCurveRatio.all(double curve) {
//     topLeft = curve;
//     topRight = curve;
//     bottomLeft = curve;
//     bottomRight = curve;
//   }
//
//   SquircleCurveRatio.only({double? topLeft, double? topRight, double? bottomLeft, double? bottomRight}) {
//     this.topLeft = topLeft ?? 0;
//     this.topRight = topRight ?? 0;
//     this.bottomLeft = bottomLeft ?? 0;
//     this.bottomRight = bottomRight ?? 0;
//   }
// }
//
// class SquircleDecoration extends Decoration {
//
//   final Color? color;
//   final SquircleCurveRatio? curveRatio;
//
//   const SquircleDecoration({
//     this.color,
//     this.curveRatio,
//   });
//
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return _SquircleDecorationPainter(this);
//   }
// }
//
// class _SquircleDecorationPainter extends BoxPainter{
//   final SquircleDecoration decoration;
//
//   _SquircleDecorationPainter(this.decoration){
//     painter = Paint()..color=decoration.color ?? Colors.transparent;
//   }
//
//   late final Paint painter;
//
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     final size = configuration.size ?? Size.zero;
//
//
//     final topLeft = offset;
//     final bottomRight = offset + Offset(size.width, size.height);
//
//
//
//     final r = 0.25 * min(size.height, size.width);
//
//
//
//     // final rect = Rect.fromPoints(topLeft, bottomRight);
//     // canvas.drawRect(rect, painter);
//   }
//
// }
