import 'package:den_of_work/infrastructure/base/work_time_editor_dialog_store_base.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'work_time_editor_dialog_state.dart';

part 'work_time_editor_dialog_store.g.dart';

class WorkTimeEditorDialogStore = _WorkTimeEditorDialogStore
    with _$_WorkTimeEditorDialogStore;

abstract class _WorkTimeEditorDialogStore
    with Store
    implements WorkTimeEditorDialogStoreBase {
  @observable
  WorkTimeEditorDialogState workTimeEditorDialogState;

  @observable
  TextEditingController titleController;

  @action
  void save() {}

  @action
  void cancel() {}
}
