import 'package:bloc_test/bloc/arithmetic_bloc.dart';
import 'package:bloc_test/bloc/student_bloc.dart';
import 'package:bloc_test/cubit/arithmetic_cubit.dart';
import 'package:bloc_test/cubit/counter_cubit.dart';
import 'package:bloc_test/cubit/dashboard_cubit.dart';
import 'package:bloc_test/cubit/student_cubit.dart';
import 'package:bloc_test/view_navigator/dashboard_cubit_navigator.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
  _initCubit();
}

void _initBloc() {
  serviceLocator.registerFactory(() => ArithmeticBloc());
  serviceLocator.registerFactory(() => StudentBloc());
}

void _initCubit() {
  serviceLocator.registerFactory<CounterCubit>(() => CounterCubit());
  serviceLocator.registerFactory<ArithmeticCubit>(() => ArithmeticCubit());
  serviceLocator.registerFactory<StudentCubit>(() => StudentCubit());

  // Navigators
  serviceLocator.registerLazySingleton(() => DashboardCubitNavigator());
  serviceLocator.registerFactory<DashboardCubit>(
    () => DashboardCubit(
      serviceLocator<DashboardCubitNavigator>(),
    ),
  );
}
