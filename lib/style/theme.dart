import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart = const Color(0xFF581845);
  static const Color loginGradientEnd = const Color(0xFF900C3F);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}