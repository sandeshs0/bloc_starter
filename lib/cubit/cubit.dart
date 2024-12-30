// Step 1: Create a Cubit
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(100);
  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state == 98) {
      reset();
    } else {
      emit(state - 1);
    }
  }

  void reset() {
    emit(100);
  }
}
