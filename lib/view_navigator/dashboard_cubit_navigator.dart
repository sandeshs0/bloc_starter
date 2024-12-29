import 'package:bloc_test/cubit/dashboard_cubit.dart';
import 'package:bloc_test/init_dependencies.dart';
import 'package:bloc_test/navigator/navigate_route.dart';
import 'package:bloc_test/view/dashboard_view.dart';
import 'package:bloc_test/view_navigator/counter_cubit_navigator.dart';

class DashboardCubitNavigator with CounterRoute {}

mixin DashboardRoute {
  openDashboardView() {
    NavigateRoute.popAndPushRouteWithCubit(
      DashboardView(),
      serviceLocator<DashboardCubit>(),
    );
  }
}
