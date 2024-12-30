import 'package:bloc_test/model/student_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.initial());

  void addStudent(StudentModel student) {
    emit(state.copyWith(isLoading: true));

    Future.delayed(Duration(seconds: 1), () {
      emit(
        state.copyWith(
          students: state.students..add(student),
          isLoading: false,
        ),
      );
    });
  }

  void deleteStudent(int index) {
    emit(state.copyWith(isLoading: true));

    Future.delayed(Duration(seconds: 1), () {
      emit(
        state.copyWith(
          students: state.students..removeAt(index),
          isLoading: false,
        ),
      );
    });
  }
}