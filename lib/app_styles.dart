import 'package:flutter/widgets.dart';

BoxDecoration gradientBackDecoration() {
    return const BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: const <Color>[
          Color(0xffF55B9A), // <color name="violet_red">#F55B9A</color>
          Color(0xffF9B16E), // <color name="rajah">#F9B16E</color>
        ],
      ),
    );
  }

    BoxDecoration cardGradientBackground() {
    return const BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: const <Color>[
          Color(0xffF1EEE7), // <color name="alabaster">#F1EEE7</color>
          Color(0xffF8FAF9), // <color name="hint_of_red">#F8FAF9</color>
        ],
      ),
    );
  }