import 'package:den_of_work/infrastructure/timer/timer_state.dart';
import 'package:mobx/mobx.dart';

abstract class TimerStoreBase {
  TimerState timerState;
  int timeInSeconds;
  ObservableMap<String, int> workTimes;

  void pause();
  Future<void> reset();
  void resume();
  void saveWorkTime();
  void start();
}
