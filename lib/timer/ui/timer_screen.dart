import 'package:den_of_work/timer/domain/entities/workt_time.dart';
import 'package:den_of_work/timer/infrastructure/ticker_use_case.dart';
import 'package:den_of_work/timer/ui/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<TimerBloc, TimerState>(
                  builder: (context, state) => Text(
                    '${state.runningWorktime.checkWorkedHours()}:${state.runningWorktime.checkWorkedMinutes()}:${state.runningWorktime.checkWorkedSeconds()}',
                    style: TextStyle(fontSize: 72.0, color: Colors.black),
                  ),
                ),
                BlocBuilder<TimerBloc, TimerState>(
                  builder: (context, state) {
                    var timerBloc = BlocProvider.of<TimerBloc>(context);

                    return FloatingActionButton(
                      child: Icon(Icons.access_alarms),
                      onPressed: () => timerBloc.add(
                        Start(
                          runningWorkTime: WorkTime(0),
                          workTimes: state.workTimes,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
