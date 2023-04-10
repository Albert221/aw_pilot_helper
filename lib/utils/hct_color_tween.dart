import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class HctColorTween extends Tween<Color?> {
  HctColorTween({super.begin, super.end});

  @override
  Color? lerp(double t) {
    if (begin == null || end == null) {
      return super.lerp(t);
    }

    final beginHct = Hct.fromInt(begin!.value);
    final endHct = Hct.fromInt(end!.value);

    final opacity = lerpDouble(begin!.opacity, end!.opacity, t)!;
    final hue = lerpDouble(beginHct.hue, endHct.hue, t)!;
    final chroma = lerpDouble(beginHct.chroma, endHct.chroma, t)!;
    final tone = lerpDouble(beginHct.tone, endHct.tone, t)!;

    return Color(
      Hct.from(hue, chroma, tone).toInt(),
    ).withOpacity(opacity);
  }
}
