// Theirs
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
 * Material 3
 */
const useMaterial3 = true;

/*
 * Colors
 */
// const _black = Color(0xFF141414);
// const _white = Color(0xFFF5F5F5);
// const _purple = Color(0xFF9C27B0);
// const _salmon = Color(0xFFFF5252);
// const _fusca = Color(0xFF7C4DFF);
// const _grey = Color(0xFF66818F);
// const _amber = Color(0xFFFFD740);
// const _shadow = Color(0x3300001E);

const _seed = Color(0xFF9238E0);

/*
 * Font Styles
 */
const _displayLarge = TextStyle(
  fontSize: 47,
  fontWeight: FontWeight.w500,
);

const _displayMedium = TextStyle(
  fontSize: 43,
  fontWeight: FontWeight.w500,
);

const _displaySmall = TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.w500,
);

const _headlineLarge = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.w700,
);

const _headlineMedium = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w700,
);

const _headlineSmall = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w400,
);

const _titleLarge = TextStyle(
  fontSize: 27,
  fontWeight: FontWeight.w400,
);

const _titleMedium = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w400,
);

const _titleSmall = TextStyle(
  fontSize: 21,
  fontWeight: FontWeight.w700,
);

const _bodyLarge = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const _bodyMedium = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

const _bodySmall = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const _labelLarge = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.4,
);

const _labelMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.2,
);

const _labelSmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.2,
);

/*
 * Spacing
 */
final class Space {
  static const level_0 = 10.0;
  static const level_1 = 15.0;
  static const level_2 = 20.0;
  static const level_3 = 30.0;
  static const level_4 = 40.0;
  static const level_5 = 60.0;
  static const level_7 = 80.0;
  static const level_8 = 120.0;
  static const level_9 = 180.0;
}

ThemeData generateTheme(BuildContext context) {
  final text = Theme.of(context).textTheme;
  final heeboTheme = GoogleFonts.heeboTextTheme(text);

  // TextStyle lobsterStyle(TextStyle style) {
  //   return GoogleFonts.lobster(textStyle: style);
  // }

//#5E35B1
  return ThemeData(
    useMaterial3: useMaterial3,
    colorScheme: ColorScheme.fromSeed(seedColor: _seed),
    textTheme: heeboTheme.copyWith(
      displayLarge: _displayLarge,
      // displaySmall: lobsterStyle(text.displaySmall!).merge(...),
      displayMedium: _displayMedium,
      displaySmall: _displaySmall,
      headlineLarge: _headlineLarge,
      headlineMedium: _headlineMedium,
      headlineSmall: _headlineSmall,
      titleLarge: _titleLarge,
      titleMedium: _titleMedium,
      titleSmall: _titleSmall,
      bodyLarge: _bodyLarge,
      bodyMedium: _bodyMedium,
      bodySmall: _bodySmall,
      labelLarge: _labelLarge,
      labelMedium: _labelMedium,
      labelSmall: _labelSmall,
    ),
  );
}
