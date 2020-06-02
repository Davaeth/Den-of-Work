import 'package:den_of_work/infrastructure/timer/store/timer_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'components/current_work_time.dart';
import 'components/timer_panel.dart';
import 'components/timer_session_work_times.dart';

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
