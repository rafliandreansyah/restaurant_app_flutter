import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4286011915),
      surfaceTint: Color(4286011915),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294959004),
      onPrimaryContainer: Color(4280621568),
      secondary: Color(4285226303),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294238395),
      onSecondaryContainer: Color(4280556036),
      tertiary: Color(4283065671),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291554245),
      onTertiaryContainer: Color(4278657289),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Colors.white,
      onSurface: Color(4280228627),
      onSurfaceVariant: Color(4283254329),
      outline: Color(4286543463),
      outlineVariant: Color(4291872180),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281675815),
      inversePrimary: Color(4293444204),
      primaryFixed: Color(4294959004),
      onPrimaryFixed: Color(4280621568),
      primaryFixedDim: Color(4293444204),
      onPrimaryFixedVariant: Color(4284171008),
      secondaryFixed: Color(4294238395),
      onSecondaryFixed: Color(4280556036),
      secondaryFixedDim: Color(4292330656),
      onSecondaryFixedVariant: Color(4283581738),
      tertiaryFixed: Color(4291554245),
      onTertiaryFixed: Color(4278657289),
      tertiaryFixedDim: Color(4289777578),
      onTertiaryFixedVariant: Color(4281486641),
      surfaceDim: Color(4293056972),
      surfaceBright: Color(4294965490),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294767333),
      surfaceContainer: Color(4294372831),
      surfaceContainerHigh: Color(4294043609),
      surfaceContainerHighest: Color(4293648852),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283842304),
      surfaceTint: Color(4286011915),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4287590435),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283318566),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286739284),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281289005),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284447836),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965490),
      onSurface: Color(4280228627),
      onSurfaceVariant: Color(4282991157),
      outline: Color(4284898896),
      outlineVariant: Color(4286741099),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281675815),
      inversePrimary: Color(4293444204),
      primaryFixed: Color(4287590435),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4285814792),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286739284),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285028925),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284447836),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282868549),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293056972),
      surfaceBright: Color(4294965490),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294767333),
      surfaceContainer: Color(4294372831),
      surfaceContainerHigh: Color(4294043609),
      surfaceContainerHighest: Color(4293648852),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281147392),
      surfaceTint: Color(4286011915),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283842304),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281016584),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283318566),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279117583),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281289005),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965490),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280886040),
      outline: Color(4282991157),
      outlineVariant: Color(4282991157),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281675815),
      inversePrimary: Color(4294961857),
      primaryFixed: Color(4283842304),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282001920),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283318566),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281740050),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281289005),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4279841305),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293056972),
      surfaceBright: Color(4294965490),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294767333),
      surfaceContainer: Color(4294372831),
      surfaceContainerHigh: Color(4294043609),
      surfaceContainerHighest: Color(4293648852),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293444204),
      surfaceTint: Color(4293444204),
      onPrimary: Color(4282330624),
      primaryContainer: Color(4284171008),
      onPrimaryContainer: Color(4294959004),
      secondary: Color(4292330656),
      onSecondary: Color(4282003221),
      secondaryContainer: Color(4283581738),
      onSecondaryContainer: Color(4294238395),
      tertiary: Color(4289777578),
      onTertiary: Color(4280038940),
      tertiaryContainer: Color(4281486641),
      onTertiaryContainer: Color(4291554245),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279702283),
      onSurface: Color(4293648852),
      onSurfaceVariant: Color(4291872180),
      outline: Color(4288254080),
      outlineVariant: Color(4283254329),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293648852),
      inversePrimary: Color(4286011915),
      primaryFixed: Color(4294959004),
      onPrimaryFixed: Color(4280621568),
      primaryFixedDim: Color(4293444204),
      onPrimaryFixedVariant: Color(4284171008),
      secondaryFixed: Color(4294238395),
      onSecondaryFixed: Color(4280556036),
      secondaryFixedDim: Color(4292330656),
      onSecondaryFixedVariant: Color(4283581738),
      tertiaryFixed: Color(4291554245),
      onTertiaryFixed: Color(4278657289),
      tertiaryFixedDim: Color(4289777578),
      onTertiaryFixedVariant: Color(4281486641),
      surfaceDim: Color(4279702283),
      surfaceBright: Color(4282267951),
      surfaceContainerLowest: Color(4279307783),
      surfaceContainerLow: Color(4280228627),
      surfaceContainer: Color(4280491799),
      surfaceContainerHigh: Color(4281215265),
      surfaceContainerHighest: Color(4281938987),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293772912),
      surfaceTint: Color(4293444204),
      onPrimary: Color(4280227072),
      primaryContainer: Color(4289629245),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292659620),
      onSecondary: Color(4280161537),
      secondaryContainer: Color(4288647022),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290040750),
      onTertiary: Color(4278328069),
      tertiaryContainer: Color(4286290039),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279702283),
      onSurface: Color(4294966007),
      onSurfaceVariant: Color(4292135352),
      outline: Color(4289503889),
      outlineVariant: Color(4287332979),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293648852),
      inversePrimary: Color(4284236800),
      primaryFixed: Color(4294959004),
      onPrimaryFixed: Color(4279767040),
      primaryFixedDim: Color(4293444204),
      onPrimaryFixedVariant: Color(4282790656),
      secondaryFixed: Color(4294238395),
      onSecondaryFixed: Color(4279767040),
      secondaryFixedDim: Color(4292330656),
      onSecondaryFixedVariant: Color(4282397979),
      tertiaryFixed: Color(4291554245),
      onTertiaryFixed: Color(4278195714),
      tertiaryFixedDim: Color(4289777578),
      onTertiaryFixedVariant: Color(4280433698),
      surfaceDim: Color(4279702283),
      surfaceBright: Color(4282267951),
      surfaceContainerLowest: Color(4279307783),
      surfaceContainerLow: Color(4280228627),
      surfaceContainer: Color(4280491799),
      surfaceContainerHigh: Color(4281215265),
      surfaceContainerHighest: Color(4281938987),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294966007),
      surfaceTint: Color(4293444204),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4293772912),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966007),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292659620),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294049770),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4290040750),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279702283),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294966007),
      outline: Color(4292135352),
      outlineVariant: Color(4292135352),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293648852),
      inversePrimary: Color(4281804800),
      primaryFixed: Color(4294960301),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4293772912),
      onPrimaryFixedVariant: Color(4280227072),
      secondaryFixed: Color(4294567359),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292659620),
      onSecondaryFixedVariant: Color(4280161537),
      tertiaryFixed: Color(4291883209),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290040750),
      onTertiaryFixedVariant: Color(4278328069),
      surfaceDim: Color(4279702283),
      surfaceBright: Color(4282267951),
      surfaceContainerLowest: Color(4279307783),
      surfaceContainerLow: Color(4280228627),
      surfaceContainer: Color(4280491799),
      surfaceContainerHigh: Color(4281215265),
      surfaceContainerHighest: Color(4281938987),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
