import 'dart:async';

import 'package:den_of_work/timer/infrastructure/store/base/timer_store_base.dart';
import 'package:den_of_work/timer/infrastructure/timer_state.dart';
import 'package:den_of_work/timer/infrastructure/timer_view_model.dart';
import 'package:den_of_work/timer/infrastructure/use_cases/check_worked_time_use_case.dart';
import 'package:den_of_work/timer/infrastructure/use_cases/ticker_use_case.dart';
import 'package:mobx/mobx.dart';

part 'timer_store.g.dart';

class TimerStore = _TimerStore with _$TimerStore;

abstract class _TimerStore with Store implements TimerStoreBase {
  @observable
  TimerState timerState;

  @observable
  int timeInSeconds;

  ObservableList<int> workTimes;

  TickerUseCase _tickerUseCase;
  CheckWorkedTimeUseCase _checkWorkedTimeUseCase;
  CheckWorkedTimeUseCase get checkWorkedTimeUseCase => _checkWorkedTimeUseCase;

  TimerViewModel _viewModel;

  _TimerStore() {
    timerState = TimerState.READY;
    timeInSeconds = 0;
    workTimes = ObservableList();

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
    _viewModel.saveWorkTime();
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
