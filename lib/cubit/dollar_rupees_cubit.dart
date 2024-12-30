import 'package:flutter_bloc/flutter_bloc.dart';

class DollarRupeesCubit extends Cubit<double> {
  DollarRupeesCubit() : super(0);

  void convertToRupees(double dollers, double rate) {
    final rupees = dollers * rate;
    emit(rupees);
  }
}
