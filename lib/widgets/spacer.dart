import 'package:flutter/material.dart';

class DefaultSpacer extends StatelessWidget {
  DefaultSpacer({
    this.horizontal = 8,
    this.vertical = 8,
  });

  DefaultSpacer.vertical({
    this.vertical = 8,
  }) : horizontal = 0;

  DefaultSpacer.horizontal({
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
