import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'theme/app_colors.dart';

void main() => runApp(const SireApp());

/// App raíz. Sólo registra el tema y arranca en S1 (inicio de sesión).
class SireApp extends StatelessWidget {
  const SireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIRE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.navy),
      ),
      home: const LoginScreen(),
    );
  }
}
