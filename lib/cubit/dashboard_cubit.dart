import 'package:bloc_test/view_navigator/dashboard_cubit_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  final DashboardCubitNavigator _navigator;

  DashboardCubit(this._navigator) : super(null);

  void openCounterViewWithNavigator() {
    _navigator.openCounterView();
  }

  void openArithmeticViewWithNavigator() {}

  void openStudenViewWithNavigator() {}

  void openArithmeticBlocViewWithNavigator() {}

  void openStudentBlocViewWithNavigator() {}
}



// DashboardCubit(
//     this._counterCubit,
//     this._arithmeticCubit,
//     this._studentCubit,
//     this._arithmeticBloc,
//     this._studentBloc,
//   ) : super(null);

//   final CounterCubit _counterCubit;
//   final ArithmeticCubit _arithmeticCubit;
//   final StudentCubit _studentCubit;
//   final ArithmeticBloc _arithmeticBloc;
//   final StudentBloc _studentBloc;

//   void openCounterViewWithNavigator() {}

//   void openArithmeticViewWithNavigator() {
//     Navigator.push(
//       AppNavigatorKey.navigatorKey.currentState!.context,
//       MaterialPageRoute(
//         builder: (_) => BlocProvider.value(
//           value: _arithmeticCubit,
//           child: ArithmeticCubitView(),
//         ),
//       ),
//     );
//   }

//   void openStudenViewWithNavigator() {
//     Navigator.push(
//       AppNavigatorKey.navigatorKey.currentState!.context,
//       MaterialPageRoute(
//         builder: (_) => BlocProvider.value(
//           value: _studentCubit,
//           child: StudentCubitView(),
//         ),
//       ),
//     );
//   }

//   void openArithmeticBlocViewWithNavigator() {
//     Navigator.push(
//       AppNavigatorKey.navigatorKey.currentState!.context,
//       MaterialPageRoute(
//         builder: (_) => BlocProvider.value(
//           value: _arithmeticBloc,
//           child: ArithmeticBlocView(),
//         ),
//       ),
//     );
//   }

//   void openStudentBlocViewWithNavigator() {
//     Navigator.push(
//       AppNavigatorKey.navigatorKey.currentState!.context,
//       MaterialPageRoute(
//         builder: (_) => BlocProvider.value(
//           value: _studentBloc,
//           child: StudentBlocView(),
//         ),
//       ),
//     );
//   }