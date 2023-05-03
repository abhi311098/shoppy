import 'package:flutter/material.dart';

class HorizontalGap extends StatelessWidget {
  const HorizontalGap({
    super.key,
    this.gap = 10,
  });

  final double gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: gap,
    );
  }
}

class VerticalGap extends StatelessWidget {
  const VerticalGap({
    super.key,
    this.gap = 10,
  });

  final double gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gap,
    );
  }
}
