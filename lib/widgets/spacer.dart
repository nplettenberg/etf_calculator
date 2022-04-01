import 'package:flutter/material.dart';

class DefaultSpacer extends StatelessWidget {
  const DefaultSpacer({
    this.horizontal = 8,
    this.vertical = 8,
  });

  const DefaultSpacer.vertical({
    this.vertical = 8,
  }) : horizontal = 0;

  const DefaultSpacer.horizontal({
    this.horizontal = 8,
  }) : vertical = 0;

  final double vertical;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vertical,
      width: horizontal,
    );
  }
}
