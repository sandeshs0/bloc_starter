import 'package:bloc_test/model/student_model.dart';
import 'package:bloc_test/state/student_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.initial());

  void addStudent(StudentModel student) {
    emit(state.copyWith(isLoading: true));
    //wait for 1 second, so that we can see the loading state
    Future.delayed(Duration(seconds: 1), () {
      emit(
        state.copyWith(
          lstStudents: state.lstStudents..add(student),
          isLoading: false,
        ),
      );
    });
  }

  void deleteStudent(int index) {
    emit(state.copyWith(isLoading: true));
    //wait for 1 second, so that we can see the loading state
    Future.delayed(Duration(seconds: 1), () {
      emit(
        state.copyWith(
          lstStudents: state.lstStudents..removeAt(index),
          isLoading: false,
        ),
      );
    });
  }
}


