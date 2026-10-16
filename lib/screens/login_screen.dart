import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'panel_screen.dart';

/// S1 · Inicio de sesión.
///
/// Sólo interfaz: no valida número de empleado ni PIN. El único
/// comportamiento es que "INGRESAR" navega a [PanelScreen].
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const _Header(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _FieldLabel('Usuario'),
                    const SizedBox(height: 8),
                    const _InputBox(initialValue: ''),
                    const SizedBox(height: 22),
                    const _FieldLabel('PIN'),
                    const SizedBox(height: 8),
                    const _InputBox(initialValue: '', obscure: true),
                    const SizedBox(height: 28),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.navy,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(58),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Sin lógica real: sólo pasa a la segunda pantalla.
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const PanelScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'INGRESAR',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 40, 32, 36),
      color: AppColors.navy,
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: AppColors.red, size: 44),
          ),
          const SizedBox(height: 14),
          const Text(
            'SIRE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Sistema de Registro de Emergencias',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFFD7E4EC), fontSize: 15),
          ),
          const SizedBox(height: 4),
          const Text(
            'Bomberos y Paramédicos SMA',
            style: TextStyle(
              color: Color(0xFF8FC5E8),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: AppColors.muted,
      ),
    );
  }
}

class _InputBox extends StatelessWidget {
  final String initialValue;
  final bool obscure;
  const _InputBox({required this.initialValue, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: initialValue),
      obscureText: obscure,
      style: const TextStyle(fontSize: 20, color: AppColors.ink),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.line, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.navy, width: 2),
        ),
      ),
    );
  }
}
