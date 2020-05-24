import 'package:den_of_work/timer/domain/value_objects/workt_time.dart';

class Timer {
  static const String _key = "TIMER_KEY";
  static final Map<String, Timer> _cache = <String, Timer>{};

  WorkTime _currentWorkTime;
  List<WorkTime> _sessionWorkTimes;

  factory Timer() {
    return _cache.putIfAbsent(
      _key,
      () => Timer._internal(
        currentWorkTime: WorkTime(),
        sessionWorkTimes: [],
      ),
    );
  }

  Timer._internal({WorkTime currentWorkTime, List<WorkTime> sessionWorkTimes})
      : this._currentWorkTime = currentWorkTime,
        this._sessionWorkTimes = sessionWorkTimes;

  WorkTime get currentWorkTime => _currentWorkTime;

  List<WorkTime> get sessionWorkTimes => _sessionWorkTimes;

  void updateSessionWorkTimes() {
    _sessionWorkTimes.add(_currentWorkTime);
    _currentWorkTime = WorkTime();
  }

  void addTime() {
    _currentWorkTime.value++;
  }

  void updateCache() {
    _cache.update(
      _key,
      (value) => Timer._internal(
        currentWorkTime: _currentWorkTime,
        sessionWorkTimes: _sessionWorkTimes,
      ),
    );
  }

  void reset() {
    _currentWorkTime.value = 0;
    _sessionWorkTimes.clear();
  }
}
