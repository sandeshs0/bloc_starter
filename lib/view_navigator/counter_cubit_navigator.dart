import 'package:bloc_test/cubit/counter_cubit.dart';
import 'package:bloc_test/init_dependencies.dart';
import 'package:bloc_test/navigator/navigate_route.dart';
import 'package:bloc_test/view/cubit_view/counter_cubit_view.dart';

class CounterViewNavigator {}

mixin CounterRoute {
  openCounterView() {
    NavigateRoute.popAndPushRouteWithCubit(
      CounterCubitView(),
      serviceLocator<CounterCubit>(),
    );
  }
}
