import 'package:den_of_work/timer/infrastructure/store/timer_store.dart';
import 'package:den_of_work/utils/custom_scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'timer/ui/timer_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Den of Work',
        builder: (_, child) =>
            CustomScrollBehavior.configureScrollBehavior(child),
        home: Provider<TimerStore>(
          create: (_) => TimerStore(),
          child: Scaffold(
            body: TimerScreen(),
          ),
        ),
      );
}
