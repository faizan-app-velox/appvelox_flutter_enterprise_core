import 'package:flutter/material.dart';

class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? color;

  const SkeletonBox({
    super.key,
    required this.width,
    required this.height,
    this.radius = 4,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // If no color is provided, use a subtle default based on the theme
    final defaultColor = Theme.of(context).colorScheme.surface;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? defaultColor,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
