import 'package:den_of_work/infrastructure/timer/store/timer_store.dart';
import 'package:den_of_work/ui/work_time_editor_dialog/work_time_editor_dialog.dart';
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
        builder: (_) => Container(
          height: 270.0,
          child: ListView(
            shrinkWrap: true,
            reverse: true,
            children: _store.workTimes.isNotEmpty
                ? _buildSessionWorkTimes(context: context).toList()
                : [],
          ),
        ),
      );

  Iterable<Widget> _buildSessionWorkTimes({BuildContext context}) sync* {
    for (var workTime in _store.workTimes.entries) {
      var currentWorkHours =
          _store.checkWorkedTimeUseCase.checkWorkedHours(value: workTime.value);

      var currentWorkMinutes = _store.checkWorkedTimeUseCase
          .checkWorkedMinutes(value: workTime.value);

      var currentWorkSeconds = _store.checkWorkedTimeUseCase
          .checkWorkedSeconds(value: workTime.value);

      yield _buildSessionWorkTime(context, workTime, currentWorkHours,
          currentWorkMinutes, currentWorkSeconds);
    }
  }

  GestureDetector _buildSessionWorkTime(
    BuildContext context,
    MapEntry<String, int> workTime,
    String currentWorkHours,
    String currentWorkMinutes,
    String currentWorkSeconds,
  ) =>
      GestureDetector(
        onTap: () => showDialog(
          context: context,
          child: WorkTimeEditorDialog(),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                right: (MediaQuery.of(context).size.width / 3.5),
              ),
              child: Text(
                workTime.key,
                style: _workTimeTitleStyle(),
              ),
            ),
            Center(
              child: Text(
                '$currentWorkHours:$currentWorkMinutes:$currentWorkSeconds',
                style: _sessionWorkTimesStyle(),
              ),
            ),
          ],
        ),
      );

  TextStyle _sessionWorkTimesStyle() => TextStyle(
        fontSize: 40.0,
        color: Colors.green,
      );

  TextStyle _workTimeTitleStyle() => TextStyle(
        fontSize: 16.0,
        color: Colors.blue,
      );
}
