import 'package:bloc_test/cubit/arithmetic_cubit.dart';
import 'package:bloc_test/cubit/circle_area_cubit.dart';
import 'package:bloc_test/cubit/cubit.dart';
import 'package:bloc_test/cubit/dollar_rupees_cubit.dart';
import 'package:bloc_test/cubit/simple_interest_cubit.dart';
import 'package:bloc_test/cubit/student_cubit.dart';
import 'package:bloc_test/view/arithmetic_cubit_view.dart';
import 'package:bloc_test/view/circle_area_view.dart';
import 'package:bloc_test/view/counter_cubit_view.dart';
import 'package:bloc_test/view/dollar_rupees.dart';
import 'package:bloc_test/view/simple_interest_view.dart';
import 'package:bloc_test/view/student_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this._counterCubit,
    this._arithmeticCubit,
    this._studentCubit,
    this._circleAreaCubit,
    this._simpleInterestCubit,
    this._dollarRupeesCubit,
  ) : super(null);

  final CounterCubit _counterCubit;
  final ArithmeticCubit _arithmeticCubit;
  final StudentCubit _studentCubit;
  final CircleAreaCubit _circleAreaCubit;
  final SimpleInterestCubit _simpleInterestCubit;
  final DollarRupeesCubit _dollarRupeesCubit;

  void openCounterView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _counterCubit,
          child: CounterCubitView(),
        ),
      ),
    );
  }

  void openArithmeticView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _arithmeticCubit,
          child: ArithmeticCubitView(),
        ),
      ),
    );
  }

  void openStudentView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _studentCubit,
          child: StudentCubitView(),
        ),
      ),
    );
  }

  void openCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _circleAreaCubit,
          child: CircleAreaScreen(),
        ),
      ),
    );
  }

  void openSimpleInterest(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleInterestCubit,
          child: SimpleInterestCubitScreen(),
        ),
      ),
    );
  }

  void openDollarRupees(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _dollarRupeesCubit,
          child: DollarRupeesScreen(),
        ),
      ),
    );
  }
  // void openArithmeticView(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => ArithmeticCubitView(),
  //     ),
  //   );
  // }

  // void openStudentView(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => StudentCubitView(),
  //     ),
  //   );
  // }
}
