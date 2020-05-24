import 'dart:async';

class TickerUseCase {
  Stream<int> tick() => Stream.periodic(
        Duration(
          seconds: 1,
        ),
        (tick) => tick,
      ).takeWhile((_) => true);
}
