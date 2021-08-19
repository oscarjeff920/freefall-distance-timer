import 'dart:math';

String calculateDistance (int fallTime, double acceleration) {
  double t = fallTime / 1000;
  double d = 0.5 * acceleration * pow(t, 2);
  if (d ~/ 1000 <= 0) {
    return d.toStringAsFixed(2) + 'm';
  } else {
    return (d / 1000).toStringAsFixed(2) + 'km';
  }
}


double calculateFinalVelocity (int fallTime, double acceleration) {
  double t = fallTime / 1000;
  return acceleration * fallTime;
}
