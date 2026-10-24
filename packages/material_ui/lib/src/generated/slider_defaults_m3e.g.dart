// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Do not edit by hand. The code is generated from data in the Material
// Design token database by the script:
//   packages/material_ui/tool/gen_defaults/bin/gen_defaults.dart.
part of '../slider.dart';

class _SliderDefaultsM3E extends SliderThemeData {
  _SliderDefaultsM3E(this.context, SliderSizeVariant? sizeVariant) : _sizeVariant = sizeVariant;

  final BuildContext context;
  final SliderSizeVariant? _sizeVariant;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  SliderSizeVariant get sizeVariant => _sizeVariant ?? SliderSizeVariant.xSmall;

  @override
  double? get trackHeight => switch (sizeVariant) {
    SliderSizeVariant.xSmall => 16.0,
    SliderSizeVariant.small => 24.0,
    SliderSizeVariant.medium => 40.0,
    SliderSizeVariant.large => 56.0,
    SliderSizeVariant.xLarge => 96.0,
  };

  @override
  Color? get activeTrackColor => _colors.primary;

  @override
  Color? get inactiveTrackColor => _colors.secondaryContainer;

  @override
  Color? get secondaryActiveTrackColor => _colors.primary.withValues(alpha: 0.54);

  @override
  Color? get disabledActiveTrackColor => _colors.onSurface.withValues(alpha: 0.38);

  @override
  Color? get disabledInactiveTrackColor => _colors.onSurface.withValues(alpha: 0.12);

  @override
  Color? get disabledSecondaryActiveTrackColor => _colors.onSurface.withValues(alpha: 0.38);

  @override
  Color? get activeTickMarkColor => _colors.onPrimary;

  @override
  Color? get inactiveTickMarkColor => _colors.onSecondaryContainer;

  @override
  Color? get disabledActiveTickMarkColor => _colors.onInverseSurface;

  @override
  Color? get disabledInactiveTickMarkColor => _colors.onSurface;

  @override
  Color? get thumbColor => _colors.primary;

  @override
  Color? get disabledThumbColor => _colors.onSurface.withValues(alpha: 0.38);

  @override
  Color? get overlayColor => WidgetStateColor.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.dragged)) {
      return _colors.primary.withValues(alpha: 0.1);
    }
    if (states.contains(WidgetState.hovered)) {
      return _colors.primary.withValues(alpha: 0.08);
    }
    if (states.contains(WidgetState.focused)) {
      return _colors.primary.withValues(alpha: 0.1);
    }

    return Colors.transparent;
  });

  @override
  TextStyle? get valueIndicatorTextStyle =>
      Theme.of(context).textTheme.labelLarge!.copyWith(color: _colors.onInverseSurface);

  @override
  Color? get valueIndicatorColor => _colors.inverseSurface;

  @override
  SliderComponentShape? get valueIndicatorShape => const RoundedRectSliderValueIndicatorShape();

  @override
  SliderComponentShape? get thumbShape => switch (sizeVariant) {
    SliderSizeVariant.xSmall => const HandleThumbShape(preferredSize: Size(4.0, 44.0)),
    SliderSizeVariant.small => const HandleThumbShape(preferredSize: Size(4.0, 44.0)),
    SliderSizeVariant.medium => const HandleThumbShape(preferredSize: Size(4.0, 44.0)),
    SliderSizeVariant.large => const HandleThumbShape(preferredSize: Size(4.0, 68.0)),
    SliderSizeVariant.xLarge => const HandleThumbShape(preferredSize: Size(4.0, 108.0)),
  };

  @override
  SliderTrackShape? get trackShape => switch (sizeVariant) {
    SliderSizeVariant.xSmall => const GappedSliderTrackShape(trackCornerRadius: 8.0),
    SliderSizeVariant.small => const GappedSliderTrackShape(trackCornerRadius: 8.0),
    SliderSizeVariant.medium => const GappedSliderTrackShape(trackCornerRadius: 12.0),
    SliderSizeVariant.large => const GappedSliderTrackShape(trackCornerRadius: 16.0),
    SliderSizeVariant.xLarge => const GappedSliderTrackShape(trackCornerRadius: 28.0),
  };

  @override
  SliderComponentShape? get overlayShape => const RoundSliderOverlayShape();

  @override
  SliderTickMarkShape? get tickMarkShape => const RoundSliderTickMarkShape(tickMarkRadius: 4.0 / 2);

  @override
  WidgetStateProperty<Size?>? get thumbSize {
    final double handleHeight = switch (sizeVariant) {
      SliderSizeVariant.xSmall => 44.0,
      SliderSizeVariant.small => 44.0,
      SliderSizeVariant.medium => 44.0,
      SliderSizeVariant.large => 68.0,
      SliderSizeVariant.xLarge => 108.0,
    };
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return Size(4.0, handleHeight);
      }
      if (states.contains(WidgetState.hovered)) {
        return Size(4.0, handleHeight);
      }
      if (states.contains(WidgetState.focused)) {
        return Size(2.0, handleHeight);
      }
      if (states.contains(WidgetState.pressed)) {
        return Size(2.0, handleHeight);
      }
      return Size(4.0, handleHeight);
    });
  }

  @override
  double? get trackGap => 6.0;
}
