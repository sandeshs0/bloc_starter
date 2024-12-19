import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'arithmetic_event.dart';

class ArithmeticBloc extends Bloc<ArithmeticEvent, int> {
  ArithmeticBloc() : super(0) {
    on<IncrementEvent>((event, emit) {
      final result = event.first + event.second;
      emit(result);
    });

    on<DecrementEvent>((event, emit) {
      final result = event.first - event.second;
      emit(result);
    });

    on<MultiplyEvent>((event, emit) {
      final result = event.first * event.second;
      emit(result);
    });
  }
}


   // on<ArithmeticEvent>((event, emit) {
    //   if (event is IncrementEvent) {
    //     final result = event.first + event.second;
    //     emit(result);
    //   } else if (event is DecrementEvent) {
    //     final result = event.first - event.second;
    //     emit(result);
    //   } else if (event is MultiplyEvent) {
    //     final result = event.first * event.second;
    //     emit(result);
    //   }
    // });
