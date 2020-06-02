import 'dart:async';

import 'package:den_of_work/infrastructure/base/timer_store_base.dart';
import 'package:den_of_work/ui/timer/entities/timer.dart';

import 'use_cases/ticker_use_case.dart';

class TimerViewModel {
  TickerUseCase _tickerUseCase;
  TimerStoreBase _timerStore;

  Timer _value;

  Stream<int> _timerStream;
  StreamSubscription<int> _timerStreamSubscription;

  TimerViewModel({TickerUseCase tickerUseCase, TimerStoreBase timerStoreBase}) {
    _tickerUseCase = tickerUseCase;
    _timerStore = timerStoreBase;

    _timerStream = _tickerUseCase.tick();

    _value = Timer();

    _readSessionWorkTimesFromCache();
  }

  Future<void> dispose() async {
    await _timerStreamSubscription.cancel();
    _value.reset();
  }

  void pauseTimer() {
    _timerStreamSubscription.pause();
  }

  void resumeTimer() {
    _timerStreamSubscription.resume();
  }

  void saveWorkTime(String workTimeTitle) {
    _value.updateSessionWorkTimes(workTimeTitle);
    _timerStore.workTimes.putIfAbsent(
      workTimeTitle,
      () => _value.sessionWorkTimes.values.last.value,
    );
  }

  void startTimer() {
    _recreateStream();

    _timerStreamSubscription = _timerStream.listen(
      (value) {
        _value.addTime();
        _timerStore.timeInSeconds = _value.currentWorkTime.value;
      },
    );
  }

  void _readSessionWorkTimesFromCache() {
    if (_value.sessionWorkTimes.isNotEmpty) {
      _value.sessionWorkTimes.forEach(
        (key, value) =>
            _timerStore.workTimes.putIfAbsent(key, () => value.value),
      );
    }
  }

  void _recreateStream() {
    if (_timerStream != null) {
      _timerStream = _tickerUseCase.tick();
      _value = Timer();
    }
  }
}
