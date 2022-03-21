import 'package:etf_calculator/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/calculator',
    routes: ref.watch(routesProvider),
  );
});
