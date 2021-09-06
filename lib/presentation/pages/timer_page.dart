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
        elevation: 40.0,
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
                Container(  // - Timer Box
                  padding: EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 4.0),
                  decoration: BoxDecoration(
                  ),
                  height: 60.0,
                  child: BlocBuilder<CalculationCubit, CalculationState>(
                    builder: (context, state) {
                      return Text(
                        stopwatch.formatStopwatchTime(
                            state.recordedTime, false),
                        style: TextStyle(fontSize: 50.0,
                        color: Theme.of(context).accentColor),
                      );
                    },
                  ),
                ),
                Center(
                  child: BlocBuilder<CalculationCubit, CalculationState>(
                      builder: (context, state) {
                    return Text(  // - Calculated Distance
                        calculateDistance(state.recordedTime, 9.81).toString(),
                        style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'RussoOne',
                          fontWeight: FontWeight.bold
                        ));
                  }),
                ),
                BlocConsumer<TimerCubit, TimerState>(
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
                    return Container( // - Start, Stop, Reset and Continue Buttons
                      height: 110.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BlocBuilder<TimerCubit, TimerState>(
                              builder: (context, state) {
                            if (state.timing == NamedTimerStates.Result) {
                              return Container( // - Continue
                                height: 34.0,
                                width: 84.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    elevation: 20.0
                                  ),
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        ),
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<TimerCubit>(context)
                                        .timerContinue();
                                  },
                                ),
                              );
                            } else {
                              return Text('');
                            }
                          }),
                          Container(  // - Start, Stop and Reset Buttons
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
                            height: 60.0,
                            width: 120.0,
                            child: Center(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  elevation: 20.0
                                ),
                                onPressed: () {
                                  BlocProvider.of<TimerCubit>(context)
                                      .timerClick();
                                },
                                child: Text(
                                  timerButtonMap[state.timing]!,
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .appBarTheme
                                          .textTheme!
                                          .headline6!
                                          .color),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          if (state.timing == NamedTimerStates.Result) {
            return TextButton(  // - Results Button
                onPressed: () {
                  Navigator.of(context).pushNamed('/results');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.computer_rounded,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    Text(
                      'Results',
                      style:
                          TextStyle(color: Theme.of(context).iconTheme.color),
                    )
                  ],
                ));
          } else {
            return Text('');
          }
        },
      ),
    );
  }
}
