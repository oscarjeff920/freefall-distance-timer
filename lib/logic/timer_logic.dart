import 'package:free_fall_distance/constants/enums.dart';

NamedTimerStates cycleTimerStates(NamedTimerStates timerState) {
  if (timerState == NamedTimerStates.Init) {
    return NamedTimerStates.Timing;
  } else if (timerState == NamedTimerStates.Timing) {
    return NamedTimerStates.Result;
  } else {
    return NamedTimerStates.Init;
  }
}

class MyStopwatch extends Stopwatch {
  static const Map<TimeIntervals, int> timeConversionMap = {
    // TimeIntervals.Hour: 3600,
    TimeIntervals.Minute: 60,
    TimeIntervals.Second: 1
  };

  String formatStopwatchTime(int timeInMilli, bool intoSeconds) {
    String returnString = '';
    // int timeInMilli = Stopwatch().elapsedMilliseconds;
    int milli = timeInMilli % 1000;
    int time = timeInMilli ~/ 1000;

    if (intoSeconds) {
      returnString += time.toString();
    } else {
      for (var interval in timeConversionMap.keys) {
        returnString +=
            (time ~/ timeConversionMap[interval]!).toString().padLeft(2, '0') +
                ':';
        time = time % timeConversionMap[interval]!;
      }
    }
    return returnString.substring(0, returnString.length - 1) +
        '.${milli.toString().padLeft(3, '0')}';
  }
}

MyStopwatch stopwatch = MyStopwatch();
