import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double scale;
  final Color backgroundColor;
  final Color valueColor;
  final double strokeWidth;

  const LoadingIndicator({
    Key? key,
    this.scale = 1.4,
    this.backgroundColor =  const Color.fromARGB(255, 216, 156, 151),
    this.valueColor = Colors.red,
    this.strokeWidth = 3.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: scale,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation(valueColor),
        ),
      ),
    );
  }
}