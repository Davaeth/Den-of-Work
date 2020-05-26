import 'dart:async';

import 'package:den_of_work/timer/infrastructure/store/base/timer_store_base.dart';
import 'package:den_of_work/timer/infrastructure/use_cases/ticker_use_case.dart';
import 'package:den_of_work/timer/ui/entities/timer.dart';

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

  void saveWorkTime() {
    _value.updateSessionWorkTimes();
    _timerStore.workTimes.add(_value.sessionWorkTimes.last.value);
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
        (element) => _timerStore.workTimes.add(element.value),
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
