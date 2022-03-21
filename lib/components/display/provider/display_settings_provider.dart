import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final displaySettingsProvider = Provider((ref) {
  return DisplaySettings();
});

class DisplaySettings {
  final double paddingValue = 8;

  late final EdgeInsets padding = EdgeInsets.all(paddingValue);
}
