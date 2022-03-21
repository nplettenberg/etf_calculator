import 'package:flutter/material.dart';

class TopPadding extends StatelessWidget {
  const TopPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SizedBox(
      height: mediaQuery.padding.top,
    );
  }
}
