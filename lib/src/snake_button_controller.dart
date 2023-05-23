import 'package:flutter/animation.dart';

class SnakeButtonController {
  late AnimationController animation;

  void toggle() {
    if (animation.value == 0) {
      animation.forward();
    } else {
      animation.reverse();
    }
  }

  void show() {
    animation.forward();
  }

  void hide({double from = 1.0}) {
    animation.reverse(from: from);
  }
}
