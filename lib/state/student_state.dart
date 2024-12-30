import 'package:bloc_test/model/student_model.dart';

class StudentState {
  final List<StudentModel> students;
  final bool isLoading;

  const StudentState({
    required this.students,
    required this.isLoading,
  });

  factory StudentState.initial() {
    return StudentState(
      students: [],
      isLoading: false,
    );
  }
  StudentState copyWith({
    List<StudentModel>? students,
    bool? isLoading,
  }) {
    return StudentState(
      students: students ?? this.students,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
