import 'dart:async';

import 'package:den_of_work/timer/infrastructure/timer_state.dart';
import 'package:den_of_work/timer/infrastructure/use_cases/check_worked_time_use_case.dart';
import 'package:den_of_work/timer/infrastructure/use_cases/ticker_use_case.dart';
import 'package:den_of_work/timer/ui/entities/timer.dart';
import 'package:mobx/mobx.dart';

part 'timer_store.g.dart';

class TimerStore = _TimerStore with _$TimerStore;

abstract class _TimerStore with Store {
  @observable
  TimerState timerState;

  @observable
  int timeInSeconds;

  ObservableList<int> workTimes;

  CheckWorketTimeUseCase checkWorketTimeUseCase;

  Timer _value;

  Stream<int> _timerStream;
  StreamSubscription<int> _timerStreamSubscription;

  TickerUseCase _tickerUseCase;

  _TimerStore() {
    timerState = TimerState.READY;
    timeInSeconds = 0;
    checkWorketTimeUseCase = CheckWorketTimeUseCase();
    workTimes = ObservableList();

    _tickerUseCase = TickerUseCase();
    _timerStream = _tickerUseCase.tick();

    _value = Timer();
  }

  @action
  void pause() {
    _timerStreamSubscription.pause();

    timerState = TimerState.PAUSED;
  }

  @action
  Future<void> reset() async {
    await _dispose();

    timerState = TimerState.READY;
  }

  @action
  void resume() {
    _timerStreamSubscription.resume();

    timerState = TimerState.RUNNING;
  }

  @action
  void saveWorkTime() {
    _value.updateSessionWorkTimes();
    workTimes.add(_value.sessionWorkTimes.last.value);
  }

  @action
  void start() {
    if (_timerStream != null) {
      _timerStream = _tickerUseCase.tick();
      _value = Timer();
    }

    _timerStreamSubscription = _timerStream.listen(
      (value) {
        _value.addTime();
        timeInSeconds = _value.currentWorkTime.value;
      },
    );

    timerState = TimerState.RUNNING;
  }

  Future<void> _dispose() async {
    await _timerStreamSubscription.cancel();
    workTimes.clear();
    _value.reset();

    timeInSeconds = 0;
  }
}
