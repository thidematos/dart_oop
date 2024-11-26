import 'package:flutter/material.dart';

class AppColors {
  final Color _from = const Color.fromARGB(255, 0, 34, 89);
  final Color _to = const Color.fromARGB(255, 15, 23, 42);
  final Color _font = const Color.fromARGB(255, 198, 195, 195);
  final Color _fontCTA = const Color.fromARGB(255, 110, 231, 183);

  List<Color> get gradientColor {
    return [_from, _to];
  }

  Color get fontCTA {
    return _fontCTA;
  }

  Color get font {
    return _font;
  }
}
