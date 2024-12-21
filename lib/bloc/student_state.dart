part of 'student_bloc.dart';

class StudentBlocState extends Equatable {
  final List<StudentModel> students;
  final bool isLoading;

  const StudentBlocState({
    required this.students,
    required this.isLoading,
  });

  factory StudentBlocState.initial() {
    return StudentBlocState(students: [], isLoading: false);
  }

  StudentBlocState copyWith({List<StudentModel>? students, bool? isLoading}) {
    return StudentBlocState(
      students: students ?? this.students,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [students, isLoading];
}



