import 'package:equatable/equatable.dart';

class WorkTime extends Equatable {
  int _value;

  WorkTime(this._value);

  set newValue(int value) {
    _value = value;
  }

  int get value => _value;

  set value(int value) {
    _value += value;
  }

  String checkWorkedHours() =>
      (this._value / 3600).floor().toString().padLeft(2, '0');

  String checkWorkedMinutes() =>
      ((this._value / 60) % 60).floor().toString().padLeft(2, '0');

  String checkWorkedSeconds() =>
      (this._value % 60).floor().toString().padLeft(2, '0');

  @override
  List<Object> get props => [_value];
}
