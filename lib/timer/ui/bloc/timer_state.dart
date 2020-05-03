part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final WorkTime runningWorktime;
  final List<WorkTime> workTimes;

  TimerState({@required this.runningWorktime, @required this.workTimes});

  @override
  List<Object> get props => [runningWorktime, workTimes];
}

class Ready extends TimerState {
  Ready(WorkTime runningWorkTime, List<WorkTime> workTimes)
      : super(runningWorktime: runningWorkTime, workTimes: workTimes);
}

class Running extends TimerState {
  Running(WorkTime runningWorkTime, List<WorkTime> workTimes)
      : super(runningWorktime: runningWorkTime, workTimes: workTimes);
}

class Paused extends TimerState {
  Paused(WorkTime runningWorkTime, List<WorkTime> workTimes)
      : super(runningWorktime: runningWorkTime, workTimes: workTimes);
}
