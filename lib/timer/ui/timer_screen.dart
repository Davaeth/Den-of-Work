import 'package:den_of_work/timer/infrastructure/store/timer_store.dart';
import 'package:den_of_work/timer/ui/components/timer_panel.dart';
import 'package:den_of_work/timer/ui/components/timer_session_work_times.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<TimerStore>(context);

    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_) {
                var currentWorkHours = store.checkWorketTimeUseCase
                    .checkWorkedHours(value: store.timeInSeconds);

                var currentWorkMinutes = store.checkWorketTimeUseCase
                    .checkWorkedMinutes(value: store.timeInSeconds);

                var currentWorkSeconds = store.checkWorketTimeUseCase
                    .checkWorkedSeconds(value: store.timeInSeconds);

                return Text(
                  "$currentWorkHours:$currentWorkMinutes:$currentWorkSeconds",
                  style: TextStyle(fontSize: 72.0, color: Colors.black),
                );
              },
            ),
            TimerSessionWorkTimes(store),
            TimerPanel(store),
          ],
        ),
      ),
    );
  }
}
