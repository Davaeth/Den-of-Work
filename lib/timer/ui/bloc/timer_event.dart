part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class Start extends TimerEvent {
  final WorkTime runningWorkTime;
  final List<WorkTime> workTimes;

  Start({@required this.runningWorkTime, @required this.workTimes});
}

class Pause extends TimerEvent {}

class Resume extends TimerEvent {}

class Reset extends TimerEvent {}

class Tick extends TimerEvent {
  final WorkTime runningWorkTime;
  final List<WorkTime> workTimes;

  Tick({@required this.runningWorkTime, @required this.workTimes});
}
