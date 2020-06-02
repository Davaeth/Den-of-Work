import 'dart:async';

import 'package:den_of_work/infrastructure/base/timer_store_base.dart';
import 'package:den_of_work/infrastructure/timer/timer_state.dart';
import 'package:den_of_work/infrastructure/timer/timer_view_model.dart';
import 'package:den_of_work/infrastructure/timer/use_cases/check_worked_time_use_case.dart';
import 'package:den_of_work/infrastructure/timer/use_cases/ticker_use_case.dart';
import 'package:mobx/mobx.dart';

part 'timer_store.g.dart';

class TimerStore = _TimerStore with _$TimerStore;

abstract class _TimerStore with Store implements TimerStoreBase {
  @observable
  TimerState timerState;

  @observable
  int timeInSeconds;

  ObservableMap<String, int> workTimes;

  TickerUseCase _tickerUseCase;
  CheckWorkedTimeUseCase _checkWorkedTimeUseCase;
  CheckWorkedTimeUseCase get checkWorkedTimeUseCase => _checkWorkedTimeUseCase;

  TimerViewModel _viewModel;

  _TimerStore() {
    timerState = TimerState.READY;
    timeInSeconds = 0;
    workTimes = ObservableMap();

    _tickerUseCase = TickerUseCase();
    _checkWorkedTimeUseCase = CheckWorkedTimeUseCase();

    _viewModel =
        TimerViewModel(tickerUseCase: _tickerUseCase, timerStoreBase: this);
  }

  @action
  void pause() {
    _viewModel.pauseTimer();

    timerState = TimerState.PAUSED;
  }

  @action
  Future<void> reset() async {
    await _dispose();

    timerState = TimerState.READY;
  }

  @action
  void resume() {
    _viewModel.resumeTimer();

    timerState = TimerState.RUNNING;
  }

  @action
  void saveWorkTime() {
    _viewModel.saveWorkTime('Test');
  }

  @action
  void start() {
    _viewModel.startTimer();

    timerState = TimerState.RUNNING;
  }

  Future<void> _dispose() async {
    await _viewModel.dispose();

    workTimes.clear();
    timeInSeconds = 0;
  }
}
