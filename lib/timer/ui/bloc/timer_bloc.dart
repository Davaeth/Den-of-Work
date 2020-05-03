import 'dart:async';

import 'package:den_of_work/timer/domain/entities/workt_time.dart';
import 'package:den_of_work/timer/infrastructure/ticker_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends HydratedBloc<TimerEvent, TimerState> {
  final WorkTime _runningWorkTime = WorkTime(0);
  final List<WorkTime> _workTimes = [];
  final Ticker _ticker;

  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker;

  @override
  TimerState get initialState =>
      super.initialState ?? Ready(_runningWorkTime, _workTimes);

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is Start) {
      yield* _mapStartToState(event);
    } else if (event is Pause) {
      yield* _mapPauseToState(event);
    } else if (event is Resume) {
      yield* _mapResumeToState(event);
    } else if (event is Reset) {
      yield* _mapResetToState(event);
    } else if (event is Tick) {
      yield* _mapTickToState(event);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Stream<TimerState> _mapStartToState(Start start) async* {
    yield Running(start.runningWorkTime, start.workTimes);

    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(workTime: start.runningWorkTime).listen(
          (tick) => add(
            Tick(runningWorkTime: WorkTime(tick), workTimes: state.workTimes),
          ),
        );
  }

  Stream<TimerState> _mapPauseToState(Pause pause) async* {
    if (state is Running) {
      _tickerSubscription?.pause();
      yield Paused(state.runningWorktime, state.workTimes);
    }
  }

  Stream<TimerState> _mapResumeToState(Resume resume) async* {
    if (state is Paused) {
      _tickerSubscription?.resume();
      yield Running(state.runningWorktime, state.workTimes);
    }
  }

  Stream<TimerState> _mapResetToState(Reset reset) async* {
    if (state is Running) {
      _tickerSubscription?.cancel();
      yield Ready(state.runningWorktime, state.workTimes);
    }
  }

  Stream<TimerState> _mapTickToState(Tick tick) async* {
    yield Running(tick.runningWorkTime, tick.workTimes);
  }

  @override
  TimerState fromJson(Map<String, dynamic> json) => Paused(
      json['runningWorkTime'] as WorkTime, json['workTimes'] as List<WorkTime>);

  @override
  Map<String, dynamic> toJson(TimerState state) =>
      {'runningWorkTime': state.runningWorktime, 'workTimes': state.workTimes};
}
