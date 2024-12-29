import 'package:bloc_test/navigator/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigateRoute {
  static void _navigate(Widget view, {Cubit? cubit, bool replace = false}) {
    final context = AppNavigatorKey.navigatorKey.currentState!.context;
    final route = MaterialPageRoute(
      builder: (context) => cubit != null
          ? BlocProvider.value(
              value: cubit,
              child: view,
            )
          : view,
    );

    if (replace) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }

  // Close the current Screen and Open another Screen
  static void popAndPushRouteWithoutCubit(Widget view) {
    _navigate(view, replace: true);
  }

  // Open another Screen
  static void pushRouteWithCubit(Widget view, Cubit cubit) {
    _navigate(view, cubit: cubit);
  }

  // Close the current Screen and Open another Screen
  static void popAndPushRouteWithCubit(Widget view, Cubit cubit) {
    _navigate(view, cubit: cubit, replace: true);
  }

  // Just Go Back or Close the current Screen
  static void pop() {
    Navigator.pop(
      AppNavigatorKey.navigatorKey.currentState!.context,
    );
  }
}
