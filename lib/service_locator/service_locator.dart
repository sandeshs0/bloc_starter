import 'package:bloc_test/cubit/arithmetic_cubit.dart';
import 'package:bloc_test/cubit/circle_area_cubit.dart';
import 'package:bloc_test/cubit/cubit.dart';
import 'package:bloc_test/cubit/dashboard_cubit.dart';
import 'package:bloc_test/cubit/dollar_rupees_cubit.dart';
import 'package:bloc_test/cubit/simple_interest_cubit.dart';
import 'package:bloc_test/cubit/student_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
}

void _initBloc() {
  serviceLocator.registerFactory<CounterCubit>(() => CounterCubit());
  serviceLocator.registerFactory<ArithmeticCubit>(() => ArithmeticCubit());
  serviceLocator
      .registerFactory<SimpleInterestCubit>(() => SimpleInterestCubit());
  serviceLocator.registerFactory<DollarRupeesCubit>(() => DollarRupeesCubit());
  serviceLocator.registerFactory<StudentCubit>(() => StudentCubit());
  serviceLocator.registerFactory<CircleAreaCubit>(() => CircleAreaCubit());
  serviceLocator.registerLazySingleton<DashboardCubit>(() => DashboardCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ));
}
