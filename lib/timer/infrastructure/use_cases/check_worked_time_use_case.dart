import 'package:flutter/material.dart';

class CheckWorketTimeUseCase {
  String checkWorkedHours({@required int value}) =>
      (value / 3600).floor().toString().padLeft(2, '0');

  String checkWorkedMinutes({@required int value}) =>
      ((value / 60) % 60).floor().toString().padLeft(2, '0');

  String checkWorkedSeconds({@required int value}) =>
      (value % 60).floor().toString().padLeft(2, '0');
}
