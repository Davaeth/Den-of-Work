import 'package:den_of_work/timer/domain/entities/workt_time.dart';

class Ticker {
  Stream<int> tick({WorkTime workTime}) => Stream.periodic(
        Duration(
          seconds: 1,
        ),
        (tick) => workTime.value + tick + 1,
      ).takeWhile((it) => true);
}
