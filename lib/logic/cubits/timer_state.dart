part of 'timer_cubit.dart';

class TimerState extends Equatable {
  final NamedTimerStates timing;

  TimerState({required this.timing});

  @override
  List<Object> get props => [timing];
}
