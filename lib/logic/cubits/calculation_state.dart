part of 'calculation_cubit.dart';

class CalculationState extends Equatable{
  final int recordedTime;

  CalculationState({required this.recordedTime});

  @override
  List<Object> get props => [recordedTime];
}
