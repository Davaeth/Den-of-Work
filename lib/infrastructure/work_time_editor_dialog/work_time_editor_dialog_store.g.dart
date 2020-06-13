// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_time_editor_dialog_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkTimeEditorDialogStore on _WorkTimeEditorDialogStore, Store {
  final _$workTimeEditorDialogStateAtom =
      Atom(name: '_WorkTimeEditorDialogStore.workTimeEditorDialogState');

  @override
  WorkTimeEditorDialogState get workTimeEditorDialogState {
    _$workTimeEditorDialogStateAtom.context
        .enforceReadPolicy(_$workTimeEditorDialogStateAtom);
    _$workTimeEditorDialogStateAtom.reportObserved();
    return super.workTimeEditorDialogState;
  }

  @override
  set workTimeEditorDialogState(WorkTimeEditorDialogState value) {
    _$workTimeEditorDialogStateAtom.context.conditionallyRunInAction(() {
      super.workTimeEditorDialogState = value;
      _$workTimeEditorDialogStateAtom.reportChanged();
    }, _$workTimeEditorDialogStateAtom,
        name: '${_$workTimeEditorDialogStateAtom.name}_set');
  }

  final _$titleControllerAtom =
      Atom(name: '_WorkTimeEditorDialogStore.titleController');

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.context.enforceReadPolicy(_$titleControllerAtom);
    _$titleControllerAtom.reportObserved();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.context.conditionallyRunInAction(() {
      super.titleController = value;
      _$titleControllerAtom.reportChanged();
    }, _$titleControllerAtom, name: '${_$titleControllerAtom.name}_set');
  }

  final _$_WorkTimeEditorDialogStoreActionController =
      ActionController(name: '_WorkTimeEditorDialogStore');

  @override
  void save() {
    final _$actionInfo =
        _$_WorkTimeEditorDialogStoreActionController.startAction();
    try {
      return super.save();
    } finally {
      _$_WorkTimeEditorDialogStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancel() {
    final _$actionInfo =
        _$_WorkTimeEditorDialogStoreActionController.startAction();
    try {
      return super.cancel();
    } finally {
      _$_WorkTimeEditorDialogStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'workTimeEditorDialogState: ${workTimeEditorDialogState.toString()},titleController: ${titleController.toString()}';
    return '{$string}';
  }
}
