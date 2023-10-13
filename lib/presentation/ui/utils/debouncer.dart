import 'dart:ui';
import 'dart:async';

class Debounce {
  final Duration duration;
  Timer? _timer;

  Debounce(this.duration);

  run(VoidCallback actionCallback) {
    _timer?.cancel();
    _timer = Timer(duration, actionCallback);
  }

  cancel() {
    _timer?.cancel();
  }
}
