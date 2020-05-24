import 'package:den_of_work/timer/infrastructure/store/timer_store.dart';
import 'package:den_of_work/timer/infrastructure/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TimerPanel extends StatefulWidget {
  final TimerStore _store;

  TimerPanel(this._store);

  @override
  State<StatefulWidget> createState() => _TimerPanelState(_store);
}

class _TimerPanelState extends State<TimerPanel> {
  TimerStore _store;

  _TimerPanelState(this._store);

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildTimerPanel(timerStore: _store),
        ),
      );

  List<Widget> _buildTimerPanel({@required TimerStore timerStore}) {
    switch (timerStore.timerState) {
      case TimerState.READY:
        return [
          FloatingActionButton(
            child: Icon(Icons.timer),
            onPressed: timerStore.start,
          )
        ];
        break;

      case TimerState.PAUSED:
        return [
          FloatingActionButton(
            child: Icon(Icons.timer),
            onPressed: timerStore.resume,
          ),
          FloatingActionButton(
            child: Icon(Icons.timer_off),
            onPressed: timerStore.reset,
          ),
        ];
        break;

      case TimerState.RUNNING:
        return [
          FloatingActionButton(
            child: Icon(Icons.pause),
            onPressed: timerStore.pause,
          ),
          FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: timerStore.saveWorkTime,
          )
        ];
        break;

      default:
        return [];
        break;
    }
  }
}
