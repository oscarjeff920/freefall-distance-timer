import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:free_fall_distance/constants/enums.dart';
import 'package:free_fall_distance/logic/timer_logic.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerState(timing: NamedTimerStates.Init));

  void timerClick() => emit(TimerState(timing: cycleTimerStates(state.timing)));

  void timerContinue() => emit(TimerState(timing: NamedTimerStates.Timing));
}
