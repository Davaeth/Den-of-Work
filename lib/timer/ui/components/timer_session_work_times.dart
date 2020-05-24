import 'package:den_of_work/timer/infrastructure/store/timer_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TimerSessionWorkTimes extends StatefulWidget {
  final TimerStore _store;

  TimerSessionWorkTimes(this._store);

  @override
  State<StatefulWidget> createState() => _TimerSessionWorkTimesState(_store);
}

class _TimerSessionWorkTimesState extends State<TimerSessionWorkTimes> {
  TimerStore _store;

  _TimerSessionWorkTimesState(this._store);

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: _store.workTimes.isNotEmpty ? _buildSessionWorkTimes() : [],
        ),
      );

  Iterable<Widget> _buildSessionWorkTimes() sync* {
    for (var workTime in _store.workTimes) {
      var currentWorkHours =
          _store.checkWorketTimeUseCase.checkWorkedHours(value: workTime);

      var currentWorkMinutes =
          _store.checkWorketTimeUseCase.checkWorkedMinutes(value: workTime);

      var currentWorkSeconds =
          _store.checkWorketTimeUseCase.checkWorkedSeconds(value: workTime);

      yield Text('$currentWorkHours:$currentWorkMinutes:$currentWorkSeconds');
    }
  }
}
