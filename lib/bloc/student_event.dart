part of 'student_bloc.dart';

@immutable
sealed class StudentEvent {}

class AddStudentEvent extends StudentEvent {
  final StudentModel studentModel;

  AddStudentEvent(this.studentModel);
}

class DeleteStudentEvent extends StudentEvent {
  final int index;

  DeleteStudentEvent(this.index);
}
