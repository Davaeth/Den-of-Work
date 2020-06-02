// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TimerStore on _TimerStore, Store {
  final _$timerStateAtom = Atom(name: '_TimerStore.timerState');

  @override
  TimerState get timerState {
    _$timerStateAtom.context.enforceReadPolicy(_$timerStateAtom);
    _$timerStateAtom.reportObserved();
    return super.timerState;
  }

  @override
  set timerState(TimerState value) {
    _$timerStateAtom.context.conditionallyRunInAction(() {
      super.timerState = value;
      _$timerStateAtom.reportChanged();
    }, _$timerStateAtom, name: '${_$timerStateAtom.name}_set');
  }

  final _$timeInSecondsAtom = Atom(name: '_TimerStore.timeInSeconds');

  @override
  int get timeInSeconds {
    _$timeInSecondsAtom.context.enforceReadPolicy(_$timeInSecondsAtom);
    _$timeInSecondsAtom.reportObserved();
    return super.timeInSeconds;
  }

  @override
  set timeInSeconds(int value) {
    _$timeInSecondsAtom.context.conditionallyRunInAction(() {
      super.timeInSeconds = value;
      _$timeInSecondsAtom.reportChanged();
    }, _$timeInSecondsAtom, name: '${_$timeInSecondsAtom.name}_set');
  }

  final _$resetAsyncAction = AsyncAction('reset');

  @override
  Future<void> reset() {
    return _$resetAsyncAction.run(() => super.reset());
  }

  final _$_TimerStoreActionController = ActionController(name: '_TimerStore');

  @override
  void pause() {
    final _$actionInfo = _$_TimerStoreActionController.startAction();
    try {
      return super.pause();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resume() {
    final _$actionInfo = _$_TimerStoreActionController.startAction();
    try {
      return super.resume();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveWorkTime() {
    final _$actionInfo = _$_TimerStoreActionController.startAction();
    try {
      return super.saveWorkTime();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void start() {
    final _$actionInfo = _$_TimerStoreActionController.startAction();
    try {
      return super.start();
    } finally {
      _$_TimerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'timerState: ${timerState.toString()},timeInSeconds: ${timeInSeconds.toString()}';
    return '{$string}';
  }
}
