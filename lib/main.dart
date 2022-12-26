import 'package:flutter/material.dart';
import 'package:flutter_animations/app_router.dart';
import 'package:flutter_animations/colors.dart';
import 'package:flutter_animations/src/core/core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preference = await SharedPreferences.getInstance();

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeChanger(preferences: preference),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, darkTheme, child) => MaterialApp.router(
        title: 'Flutter Animations',
        debugShowCheckedModeBanner: false,
        theme: _buildLightTheme(context),
        darkTheme: _buildDarkTheme(context),
        themeMode: darkTheme.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        routerConfig: router,
      ),
    );
  }
}

ThemeData _buildDarkTheme(BuildContext context) {
  final base = ThemeData.dark();

  return base.copyWith(
    useMaterial3: true,
    cardColor: FlutterAnimationColors.darkCardBackground,
    colorScheme: const ColorScheme.dark(
      primary: FlutterAnimationColors.blue200,
      secondary: FlutterAnimationColors.orange300,
      surface: FlutterAnimationColors.black800,
      error: FlutterAnimationColors.red200,
      onPrimary: FlutterAnimationColors.black900,
      onSecondary: FlutterAnimationColors.black900,
      onBackground: FlutterAnimationColors.white50,
      onSurface: FlutterAnimationColors.white50,
      onError: FlutterAnimationColors.black900,
      background: FlutterAnimationColors.black900,
    ),
    scaffoldBackgroundColor: FlutterAnimationColors.black900,
    textTheme: _buildDarkTextTheme(base.textTheme),
  );
}

ThemeData _buildLightTheme(BuildContext context) {
  final base = ThemeData.light();

  return base.copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: FlutterAnimationColors.blue50,
    cardColor: FlutterAnimationColors.white50,
    colorScheme: const ColorScheme.light(
      primary: FlutterAnimationColors.blue700,
      secondary: FlutterAnimationColors.orange500,
      surface: FlutterAnimationColors.white50,
      error: FlutterAnimationColors.red400,
      onPrimary: FlutterAnimationColors.white50,
      onSecondary: FlutterAnimationColors.black900,
      onBackground: FlutterAnimationColors.black900,
      onSurface: FlutterAnimationColors.black900,
      onError: FlutterAnimationColors.black900,
      background: FlutterAnimationColors.blue50,
    ),
    textTheme: _buildLightTextTheme(base.textTheme),
  );
}

TextTheme _buildLightTextTheme(TextTheme base) {
  return base.copyWith(
    headline4: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      letterSpacing: 0.4,
      height: 0.9,
      color: FlutterAnimationColors.black900,
    ),
    headline5: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: 0.27,
      color: FlutterAnimationColors.black900,
    ),
    headline6: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0.18,
      color: FlutterAnimationColors.black900,
    ),
    subtitle2: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: -0.04,
      color: FlutterAnimationColors.black900,
    ),
    bodyText1: GoogleFonts.montserrat(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      letterSpacing: 0.2,
      color: FlutterAnimationColors.black900,
    ),
    bodyText2: GoogleFonts.montserrat(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: -0.05,
      color: FlutterAnimationColors.black900,
    ),
    caption: GoogleFonts.montserrat(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      letterSpacing: 0.2,
      color: FlutterAnimationColors.black900,
    ),
  );
}

TextTheme _buildDarkTextTheme(TextTheme base) {
  return base.copyWith(
    headline4: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      letterSpacing: 0.4,
      height: 0.9,
      color: FlutterAnimationColors.white50,
    ),
    headline5: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: 0.27,
      color: FlutterAnimationColors.white50,
    ),
    headline6: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0.18,
      color: FlutterAnimationColors.white50,
    ),
    subtitle2: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: -0.04,
      color: FlutterAnimationColors.white50,
    ),
    bodyText1: GoogleFonts.montserrat(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      letterSpacing: 0.2,
      color: FlutterAnimationColors.white50,
    ),
    bodyText2: GoogleFonts.montserrat(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: -0.05,
      color: FlutterAnimationColors.white50,
    ),
    caption: GoogleFonts.montserrat(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      letterSpacing: 0.2,
      color: FlutterAnimationColors.white50,
    ),
  );
}
