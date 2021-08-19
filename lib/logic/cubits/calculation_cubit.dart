import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit() : super(CalculationState(recordedTime: 0));

  void recordTime(int stopWatchTime) =>
      emit(CalculationState(recordedTime: stopWatchTime));
}
