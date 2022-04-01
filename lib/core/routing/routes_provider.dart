import 'package:etf_calculator/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routesProvider = Provider<List<GoRoute>>((ref) {
  return [
    GoRoute(
      path: '/calculator',
      name: HomePage.page,
      pageBuilder: (_, state) {
        return MaterialPage<void>(
          key: state.pageKey,
          child: const HomePage(),
        );
      },
    ),
  ];
});
