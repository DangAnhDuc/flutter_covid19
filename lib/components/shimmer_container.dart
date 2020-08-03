import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer(
      {@required this.width,
      @required this.height,
        this.color,
      this.firstColor,
      this.secondColor,
      this.radius});
  final height;
  final width;
  final color;
  final firstColor;
  final secondColor;
  final radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius??10.0)),
              color: color?? Colors.white,),
          width: width,
          height: height,
        ),
        baseColor: firstColor ?? Colors.grey[100],
        highlightColor: secondColor ?? Colors.grey[200]);
  }
}
