import 'package:bloc_test/cubit/dashboard_cubit.dart';
import 'package:bloc_test/service_locator/service_locator.dart';
import 'package:bloc_test/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // providers: [
      //   BlocProvider(create: (context) => serviceLocator<CounterCubit>()),
      //   BlocProvider(create: (context) => serviceLocator<ArithmeticCubit>()),
      //   BlocProvider(create: (context) => serviceLocator<StudentCubit>()),
      //   BlocProvider(create: (context) => serviceLocator<CircleAreaCubit>()),
      //   BlocProvider(
      //       create: (context) => serviceLocator<SimpleInterestCubit>()),
      //   BlocProvider(
      //       create: (context) => serviceLocator<DollarRupeesCubit>()),
      //   BlocProvider(create: (context) => serviceLocator<DashboardCubit>()),

      //   // BlocProvider(
      //   //     create: (context) => DashboardCubit(
      //   //           context.read<CounterCubit>(),
      //   //           context.read<ArithmeticCubit>(),
      //   //           context.read<StudentCubit>(),
      //   //           context.read<CircleAreaCubit>(),
      //   //           context.read<SimpleInterestCubit>(),
      //   //           context.read<DollarRupeesCubit>(),
      //   //         ))
      // ],

      debugShowCheckedModeBanner: false,
      title: "Flutter Block",
      home: BlocProvider.value(
        value: serviceLocator<DashboardCubit>(),
        child: DashboardView(),
      ),
    );
  }
}
