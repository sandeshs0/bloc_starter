import 'package:bloc_test/bloc/arithmetic_bloc.dart';
import 'package:bloc_test/cubit/arithmetic_cubit.dart';
import 'package:bloc_test/cubit/counter_cubit.dart';
import 'package:bloc_test/cubit/dashboard_cubit.dart';
import 'package:bloc_test/cubit/student_cubit.dart';
import 'package:bloc_test/init_dependencies.dart';
import 'package:bloc_test/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => serviceLocator(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<ArithmeticCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<StudentCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<DashboardCubit>(),
        ),
        BlocProvider(create: (context) => serviceLocator<ArithmeticBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter BLoC',
        home: DashboardView(),
      ),
    );
  }
}


// Without getit


  // BlocProvider(create: (context) => CounterCubit()),
        // BlocProvider(create: (context) => ArithmeticCubit()),
        // BlocProvider(create: (context) => StudentCubit()),
        // BlocProvider(
        //   create: (context) => DashboardCubit(
        //     context.read<CounterCubit>(),
        //     context.read<ArithmeticCubit>(),
        //     context.read<StudentCubit>(),
        //   ),
        // ),