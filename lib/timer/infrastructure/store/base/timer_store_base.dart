import 'package:den_of_work/timer/infrastructure/timer_state.dart';
import 'package:mobx/mobx.dart';

abstract class TimerStoreBase {
  TimerState timerState;
  int timeInSeconds;
  ObservableList<int> workTimes;
}
