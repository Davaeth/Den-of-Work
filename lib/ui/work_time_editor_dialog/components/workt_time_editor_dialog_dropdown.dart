import 'package:flutter/material.dart';

class WorkTimeWditorDialogDropdown extends StatefulWidget {
  @override
  _WorkTimeWditorDialogDropdownState createState() =>
      _WorkTimeWditorDialogDropdownState();
}

class _WorkTimeWditorDialogDropdownState
    extends State<WorkTimeWditorDialogDropdown> {
  String _value = "NEW";

  @override
  Widget build(BuildContext context) => DropdownButtonHideUnderline(
        child: DropdownButton(
          items: _buildDropdownItems().toList(),
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          value: _value,
        ),
      );

  Iterable<DropdownMenuItem<String>> _buildDropdownItems() sync* {
    for (var workTime in ["NEW", "Test", "Test2"]) {
      yield DropdownMenuItem<String>(
        value: workTime,
        child: Text(
          workTime,
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
