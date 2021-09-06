import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_fall_distance/logic/cubits/calculation_cubit.dart';
import 'package:free_fall_distance/logic/cubits/timer_cubit.dart';
import 'package:free_fall_distance/logic/timer_logic.dart';
import 'package:free_fall_distance/presentation/router/app_router.dart';
import 'package:free_fall_distance/presentation/theme.dart';
import 'package:provider/provider.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TimerCubit()),
        BlocProvider(create: (context) => CalculationCubit()),
      ],
      child: MaterialApp(
        title: 'Fall Distance Calculator',
        theme: standardTheme,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
