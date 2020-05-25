import 'package:den_of_work/timer/infrastructure/store/timer_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CurrentWorkTime extends StatefulWidget {
  final TimerStore _store;

  CurrentWorkTime(this._store);

  @override
  _CurrentWorkTimeState createState() => _CurrentWorkTimeState(_store);
}

class _CurrentWorkTimeState extends State<CurrentWorkTime> {
  TimerStore _store;

  _CurrentWorkTimeState(this._store);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "TOTAL",
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Observer(
            builder: (_) {
              var currentWorkHours = _store.checkWorketTimeUseCase
                  .checkWorkedHours(value: _store.timeInSeconds);

              var currentWorkMinutes = _store.checkWorketTimeUseCase
                  .checkWorkedMinutes(value: _store.timeInSeconds);

              var currentWorkSeconds = _store.checkWorketTimeUseCase
                  .checkWorkedSeconds(value: _store.timeInSeconds);

              return Text(
                "$currentWorkHours:$currentWorkMinutes:$currentWorkSeconds",
                style: TextStyle(fontSize: 72.0, color: Colors.black),
              );
            },
          ),
        ],
      );
}
