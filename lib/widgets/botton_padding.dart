import 'package:flutter/material.dart';

class BottomPadding extends StatelessWidget {
  const BottomPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SizedBox(
      height: mediaQuery.padding.bottom,
    );
  }
}
