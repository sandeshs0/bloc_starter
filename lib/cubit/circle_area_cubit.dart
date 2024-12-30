import 'package:flutter_bloc/flutter_bloc.dart';

class CircleAreaCubit extends Cubit<double> {
  CircleAreaCubit() : super(0);

  void calculateCircleArea(double radius) {
    final area = 3.14159 * radius * radius;
    emit(area);
  }
}