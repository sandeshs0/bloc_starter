import 'package:bloc/bloc.dart';
import 'package:bloc_test/model/student_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentBlocState> {
  StudentBloc() : super(StudentBlocState.initial()) {
    on<AddStudentEvent>((event, emit) async {
      // Show loading bar
      emit(state.copyWith(isLoading: true));
      // Wait for 1 seconds
      await Future.delayed(const Duration(seconds: 1), () {
        emit(
          state.copyWith(
            students: state.students..add(event.studentModel),
            isLoading: false,
          ),
        );
      });
    });

    on<DeleteStudentEvent>((event, emit) async {
      // Show loading bar
      emit(state.copyWith(isLoading: true));
      // Wait for 1 seconds
      await Future.delayed(const Duration(seconds: 1));
      final List<StudentModel> updatedStudents = List.from(state.students)
        ..removeAt(event.index);
      emit(state.copyWith(
        students: updatedStudents,
        isLoading: false,
      ));
    });
  }
}
