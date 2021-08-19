import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_fall_distance/constants/enums.dart';
import 'package:free_fall_distance/constants/maps.dart';
import 'package:free_fall_distance/logic/cubits/calculation_cubit.dart';
import 'package:free_fall_distance/logic/cubits/timer_cubit.dart';
import 'package:free_fall_distance/logic/suvat.dart';
import 'package:free_fall_distance/logic/timer_logic.dart';

class TimerPage extends StatefulWidget {
  final String title;
  final MyStopwatch stopwatch = MyStopwatch();

  TimerPage({Key? key, required this.title}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50.0,
                  child: BlocBuilder<CalculationCubit, CalculationState>(
                    builder: (context, state) {
                      return Text(
                        stopwatch.formatStopwatchTime(state.recordedTime, false),
                        style: TextStyle(fontSize: 40.0),
                      );
                    },
                  ),
                ),
                BlocBuilder<CalculationCubit, CalculationState>(
                    builder: (context, state) {
                  return Text(
                      calculateDistance(state.recordedTime, 9.81).toString(),
                      style: TextStyle(fontSize: 50.0));
                }),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                  color: Theme.of(context).appBarTheme.color,
                  child: BlocConsumer<TimerCubit, TimerState>(
                    listener: (context, state) {
                      if (state.timing == NamedTimerStates.Init) {
                        stopwatch.reset();
                      } else if (state.timing == NamedTimerStates.Timing) {
                        stopwatch.start();
                      } else {
                        stopwatch.stop();
                      }
                    },
                    builder: (context, state) {
                      context
                          .watch<CalculationCubit>()
                          .recordTime(stopwatch.elapsedMilliseconds);
                      return TextButton(
                        onPressed: () {
                          BlocProvider.of<TimerCubit>(context).timerClick();
                        },
                        child: Text(
                          timerButtonMap[state.timing]!,
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Theme.of(context)
                                  .appBarTheme
                                  .textTheme!
                                  .headline6!
                                  .color),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(10.0)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          if (state.timing == NamedTimerStates.Result) {
            return IconButton(
                icon: Icon(
                  Icons.computer_rounded,
                  color: Colors.white.withOpacity(1.0),
                  size: 30.0,
                  semanticLabel: 'Results',
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/results');
                });
          } else {
            return Text('');
          }
        },
      ),
    );
  }
}
