import 'package:flutter/material.dart';

import 'components/workt_time_editor_dialog_dropdown.dart';

class WorkTimeEditorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 30.0,
        height: 400.0,
        child: SimpleDialog(
          contentPadding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 32.0,
            bottom: 32.0,
          ),
          title: Text('Work time editor'),
          children: [
            WorkTimeWditorDialogDropdown(),
            // TODO('Action ('save') -> Reaction');
            TextField(
              keyboardType: TextInputType.text,
              maxLength: 25,
              maxLines: 1,
              decoration: InputDecoration(
                // border: InputBorder.,
                hintText: 'Title',
                border: UnderlineInputBorder(),
                counterText: '',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 0.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
