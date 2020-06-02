import 'package:den_of_work/infrastructure/work_time_editor_dialog/work_time_editor_dialog_state.dart';
import 'package:flutter/material.dart';

abstract class WorkTimeEditorDialogStoreBase {
  WorkTimeEditorDialogState workTimeEditorDialogState;
  TextEditingController titleController;

  void save();
  void cancel();
}
