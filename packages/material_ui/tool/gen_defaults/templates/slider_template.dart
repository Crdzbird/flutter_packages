// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../data/slider.dart';
import '../data/slider_large.dart';
import '../data/slider_medium.dart';
import '../data/slider_small.dart';
import '../data/slider_xlarge.dart';
import '../data/slider_xsmall.dart';
import 'template.dart';

class SliderTemplateM3 extends TokenTemplateM3 {
  const SliderTemplateM3();

  @override
  String get name => 'Slider';

  @override
  String get parentFilePath => 'slider.dart';

  // TODO(Crdzbird): Replace with tokens when/if they become available.
  static const double _secondaryActiveTrackOpacity = 0.54;
  static const double _draggedOverlayOpacity = 0.1;
  static const double _hoveredOverlayOpacity = 0.08;
  static const double _focusedOverlayOpacity = 0.1;
  static const String _valueIndicatorTextStyle = 'Theme.of(context).textTheme.labelLarge';

  @override
  String generateContents(String className) =>
      '''
class $className extends SliderThemeData {
  $className(this.context)
    : super(trackHeight: ${TokenSlider.activeTrackHeight});

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  Color? get activeTrackColor => ${color(TokenSlider.activeTrackColor)};

  @override
  Color? get inactiveTrackColor => ${color(TokenSlider.inactiveTrackColor)};

  @override
  Color? get secondaryActiveTrackColor => ${colorWithOpacity(TokenSlider.activeTrackColor, _secondaryActiveTrackOpacity)};

  @override
  Color? get disabledActiveTrackColor => ${colorWithOpacity(TokenSlider.disabledActiveTrackColor, TokenSlider.disabledActiveTrackOpacity)};

  @override
  Color? get disabledInactiveTrackColor => ${colorWithOpacity(TokenSlider.disabledInactiveTrackColor, TokenSlider.disabledInactiveTrackOpacity)};

  @override
  Color? get disabledSecondaryActiveTrackColor => ${colorWithOpacity(TokenSlider.disabledActiveTrackColor, TokenSlider.disabledActiveTrackOpacity)};

  @override
  Color? get activeTickMarkColor => ${color(TokenSlider.activeStopIndicatorContainerColor)}.withOpacity(${TokenSlider.activeStopIndicatorContainerOpacity});

  @override
  Color? get inactiveTickMarkColor => ${color(TokenSlider.inactiveStopIndicatorContainerColor)}.withOpacity(${TokenSlider.inactiveStopIndicatorContainerOpacity});

  @override
  Color? get disabledActiveTickMarkColor => ${color(TokenSlider.disabledActiveStopIndicatorContainerColor)};

  @override
  Color? get disabledInactiveTickMarkColor => ${color(TokenSlider.disabledInactiveStopIndicatorContainerColor)};

  @override
  Color? get thumbColor => ${color(TokenSlider.handleColor)};

  @override
  Color? get disabledThumbColor => ${colorWithOpacity(TokenSlider.disabledHandleColor, TokenSlider.disabledHandleOpacity)};

  @override
  Color? get overlayColor => WidgetStateColor.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.dragged)) {
      return _colors.primary.withOpacity($_draggedOverlayOpacity);
    }
    if (states.contains(WidgetState.hovered)) {
      return _colors.primary.withOpacity($_hoveredOverlayOpacity);
    }
    if (states.contains(WidgetState.focused)) {
      return _colors.primary.withOpacity($_focusedOverlayOpacity);
    }

    return Colors.transparent;
  });

  @override
  TextStyle? get valueIndicatorTextStyle => $_valueIndicatorTextStyle!.copyWith(
    color: ${color(TokenSlider.valueIndicatorLabelLabelTextColor)},
  );

  @override
  Color? get valueIndicatorColor => ${color(TokenSlider.valueIndicatorContainerColor)};

  @override
  SliderComponentShape? get valueIndicatorShape => const RoundedRectSliderValueIndicatorShape();

  @override
  SliderComponentShape? get thumbShape => const HandleThumbShape();

  @override
  SliderTrackShape? get trackShape => const GappedSliderTrackShape();

  @override
  SliderComponentShape? get overlayShape => const RoundSliderOverlayShape();

  @override
  SliderTickMarkShape? get tickMarkShape => const RoundSliderTickMarkShape(tickMarkRadius: ${TokenSlider.stopIndicatorSize} / 2);

  @override
  WidgetStateProperty<Size?>? get thumbSize {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return const Size(${TokenSlider.disabledHandleWidth}, ${TokenSlider.handleHeight});
      }
      if (states.contains(WidgetState.hovered)) {
        return const Size(${TokenSlider.hoverHandleWidth}, ${TokenSlider.handleHeight});
      }
      if (states.contains(WidgetState.focused)) {
        return const Size(${TokenSlider.focusHandleWidth}, ${TokenSlider.handleHeight});
      }
      if (states.contains(WidgetState.pressed)) {
        return const Size(${TokenSlider.pressedHandleWidth}, ${TokenSlider.handleHeight});
      }
      return const Size(${TokenSlider.handleWidth}, ${TokenSlider.handleHeight});
    });
  }

  @override
  double? get trackGap => ${TokenSlider.activeHandlePadding};
}
''';
}

class SliderTemplateM3E extends TokenTemplateM3E {
  const SliderTemplateM3E();

  @override
  String get name => 'Slider';

  @override
  String get parentFilePath => 'slider.dart';

  String _sizeSwitch({
    required String xSmall,
    required String small,
    required String medium,
    required String large,
    required String xLarge,
  }) {
    return '''
switch (sizeVariant) {
      SliderSizeVariant.xSmall => $xSmall,
      SliderSizeVariant.small => $small,
      SliderSizeVariant.medium => $medium,
      SliderSizeVariant.large => $large,
      SliderSizeVariant.xLarge => $xLarge,
    }''';
  }

  String _trackShape(double cornerRadius) =>
      'const GappedSliderTrackShape(trackCornerRadius: $cornerRadius)';

  String _thumbShape(double handleHeight) =>
      'const HandleThumbShape(preferredSize: Size(${TokenSlider.handleWidth}, $handleHeight))';

  String get _handleHeight => _sizeSwitch(
    xSmall: '${TokenSliderXsmall.activeHandleHeight}',
    small: '${TokenSliderSmall.activeHandleHeight}',
    medium: '${TokenSliderMedium.activeHandleHeight}',
    large: '${TokenSliderLarge.activeHandleHeight}',
    xLarge: '${TokenSliderXlarge.activeHandleHeight}',
  );

  @override
  String generateContents(String className) =>
      '''
class $className extends SliderThemeData {
  $className(this.context, SliderSizeVariant? sizeVariant) : _sizeVariant = sizeVariant;

  final BuildContext context;
  final SliderSizeVariant? _sizeVariant;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  SliderSizeVariant get sizeVariant => _sizeVariant ?? SliderSizeVariant.xSmall;

  @override
  double? get trackHeight => ${_sizeSwitch(xSmall: '${TokenSliderXsmall.activeTrackHeight}', small: '${TokenSliderSmall.activeTrackHeight}', medium: '${TokenSliderMedium.activeTrackHeight}', large: '${TokenSliderLarge.activeTrackHeight}', xLarge: '${TokenSliderXlarge.activeTrackHeight}')};

  @override
  Color? get activeTrackColor => ${color(TokenSlider.activeTrackColor)};

  @override
  Color? get inactiveTrackColor => ${color(TokenSlider.inactiveTrackColor)};

  @override
  Color? get secondaryActiveTrackColor => ${colorWithOpacity(TokenSlider.activeTrackColor, SliderTemplateM3._secondaryActiveTrackOpacity)};

  @override
  Color? get disabledActiveTrackColor => ${colorWithOpacity(TokenSlider.disabledActiveTrackColor, TokenSlider.disabledActiveTrackOpacity)};

  @override
  Color? get disabledInactiveTrackColor => ${colorWithOpacity(TokenSlider.disabledInactiveTrackColor, TokenSlider.disabledInactiveTrackOpacity)};

  @override
  Color? get disabledSecondaryActiveTrackColor => ${colorWithOpacity(TokenSlider.disabledActiveTrackColor, TokenSlider.disabledActiveTrackOpacity)};

  @override
  Color? get activeTickMarkColor => ${colorWithOpacity(TokenSlider.activeStopIndicatorContainerColor, TokenSlider.activeStopIndicatorContainerOpacity)};

  @override
  Color? get inactiveTickMarkColor => ${colorWithOpacity(TokenSlider.inactiveStopIndicatorContainerColor, TokenSlider.inactiveStopIndicatorContainerOpacity)};

  @override
  Color? get disabledActiveTickMarkColor => ${color(TokenSlider.disabledActiveStopIndicatorContainerColor)};

  @override
  Color? get disabledInactiveTickMarkColor => ${color(TokenSlider.disabledInactiveStopIndicatorContainerColor)};

  @override
  Color? get thumbColor => ${color(TokenSlider.handleColor)};

  @override
  Color? get disabledThumbColor => ${colorWithOpacity(TokenSlider.disabledHandleColor, TokenSlider.disabledHandleOpacity)};

  @override
  Color? get overlayColor => WidgetStateColor.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.dragged)) {
      return ${colorWithOpacity(TokenSlider.handleColor, SliderTemplateM3._draggedOverlayOpacity)};
    }
    if (states.contains(WidgetState.hovered)) {
      return ${colorWithOpacity(TokenSlider.handleColor, SliderTemplateM3._hoveredOverlayOpacity)};
    }
    if (states.contains(WidgetState.focused)) {
      return ${colorWithOpacity(TokenSlider.handleColor, SliderTemplateM3._focusedOverlayOpacity)};
    }

    return Colors.transparent;
  });

  @override
  TextStyle? get valueIndicatorTextStyle => ${SliderTemplateM3._valueIndicatorTextStyle}!.copyWith(
    color: ${color(TokenSlider.valueIndicatorLabelLabelTextColor)},
  );

  @override
  Color? get valueIndicatorColor => ${color(TokenSlider.valueIndicatorContainerColor)};

  @override
  SliderComponentShape? get valueIndicatorShape => const RoundedRectSliderValueIndicatorShape();

  @override
  SliderComponentShape? get thumbShape => ${_sizeSwitch(xSmall: _thumbShape(TokenSliderXsmall.activeHandleHeight), small: _thumbShape(TokenSliderSmall.activeHandleHeight), medium: _thumbShape(TokenSliderMedium.activeHandleHeight), large: _thumbShape(TokenSliderLarge.activeHandleHeight), xLarge: _thumbShape(TokenSliderXlarge.activeHandleHeight))};

  @override
  SliderTrackShape? get trackShape => ${_sizeSwitch(xSmall: _trackShape(TokenSliderXsmall.activeTrackShapeLeading), small: _trackShape(TokenSliderSmall.activeTrackShapeLeading), medium: _trackShape(TokenSliderMedium.activeTrackShapeLeading), large: _trackShape(TokenSliderLarge.activeTrackShapeLeading), xLarge: _trackShape(TokenSliderXlarge.activeTrackShapeLeading))};

  @override
  SliderComponentShape? get overlayShape => const RoundSliderOverlayShape();

  @override
  SliderTickMarkShape? get tickMarkShape => const RoundSliderTickMarkShape(tickMarkRadius: ${TokenSlider.stopIndicatorSize} / 2);

  @override
  WidgetStateProperty<Size?>? get thumbSize {
    final double handleHeight = $_handleHeight;
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return Size(${TokenSlider.disabledHandleWidth}, handleHeight);
      }
      if (states.contains(WidgetState.hovered)) {
        return Size(${TokenSlider.hoverHandleWidth}, handleHeight);
      }
      if (states.contains(WidgetState.focused)) {
        return Size(${TokenSlider.focusHandleWidth}, handleHeight);
      }
      if (states.contains(WidgetState.pressed)) {
        return Size(${TokenSlider.pressedHandleWidth}, handleHeight);
      }
      return Size(${TokenSlider.handleWidth}, handleHeight);
    });
  }

  @override
  double? get trackGap => ${TokenSlider.activeHandlePadding};
}
''';
}
