import 'package:den_of_work/timer/infrastructure/store/timer_store.dart';
import 'package:den_of_work/timer/ui/components/current_work_time.dart';
import 'package:den_of_work/timer/ui/components/timer_panel.dart';
import 'package:den_of_work/timer/ui/components/timer_session_work_times.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    var store = Provider.of<TimerStore>(context);

    return Center(
      child: Container(
        child: Observer(
          builder: (_) => Column(
            mainAxisAlignment: store.workTimes.isEmpty
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CurrentWorkTime(store),
              TimerSessionWorkTimes(store),
              TimerPanel(store),
            ],
          ),
        ),
      ),
    );
  }
}
