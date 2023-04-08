import 'package:aw_pilot_helper/l10n/l10n.dart';
import 'package:aw_pilot_helper/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class AWHelperApp extends StatelessWidget {
  const AWHelperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.l10n.appName,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0C2779),
        ),
      ).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      onGenerateRoute: (_) => HomeScreenRoute(),
      builder: (context, child) => L10nFormat(child: child!),
    );
  }
}
