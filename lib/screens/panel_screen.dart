import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// S2 · Panel de servicios.
///
/// Sólo interfaz: los datos (servicio asignado, activos, recientes)
/// son fijos, no vienen de ninguna base de datos ni API.
class PanelScreen extends StatelessWidget {
  const PanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            const _TopBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const Text(
                    'JS. Juan González · Unidad BYP-01',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'SERVICIO ASIGNADO',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.muted,
                          letterSpacing: .5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const _AssignedServiceCard(),
                  const SizedBox(height: 20),
                  const _SectionLabel('SERVICIOS ACTIVOS'),
                  const SizedBox(height: 10),
                  const _ServiceRow(
                    dot: AppColors.amber,
                    title: '0154 · Accidente vehicular',
                    subtitle: 'En atención',
                    subtitleColor: AppColors.amberDark,
                  ),
                  const SizedBox(height: 10),
                  const _ServiceRow(
                    dot: AppColors.blue,
                    title: '0153 · Traslado programado',
                    subtitle: 'En camino',
                    subtitleColor: AppColors.blue,
                  ),
                  const SizedBox(height: 20),
                  const _SectionLabel('RECIENTES'),
                  const SizedBox(height: 10),
                  const _ServiceRow(
                    icon: Icons.check_circle,
                    iconColor: AppColors.green,
                    title: '0152 · Incendio forestal',
                    subtitle: 'Reporte enviado',
                    subtitleColor: AppColors.green,
                  ),
                  const SizedBox(height: 24),
                  const _NewAlertButton(),
                ],
              ),
            ),
            const _BottomTabs(),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.navy,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Panel de servicios',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.greenLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  'En línea',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AssignedServiceCard extends StatelessWidget {
  const _AssignedServiceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.redLight,
        border: Border.all(color: AppColors.red, width: 2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Accidente vehicular',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                ),
              ),
              Icon(Icons.chevron_right, color: AppColors.muted),
            ],
          ),
          SizedBox(height: 4),
          Text(
            'Carretera SMA–Dolores, km 12',
            style: TextStyle(fontSize: 14, color: AppColors.ink),
          ),
          SizedBox(height: 6),
          Text(
            'Alerta 14:32 · Prioridad alta',
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.bold,
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.muted,
        letterSpacing: .5,
      ),
    );
  }
}

class _ServiceRow extends StatelessWidget {
  final Color? dot;
  final IconData? icon;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final Color subtitleColor;

  const _ServiceRow({
    this.dot,
    this.icon,
    this.iconColor,
    required this.title,
    required this.subtitle,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (dot != null)
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
            )
          else
            Icon(icon, color: iconColor, size: 18),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 13, color: subtitleColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NewAlertButton extends StatelessWidget {
  const _NewAlertButton();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () {},
            child: const Text(
              '+ NUEVA ALERTA',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomTabs extends StatelessWidget {
  const _BottomTabs();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.line, width: 2)),
      ),
      child: const Row(
        children: [
          _TabItem(label: 'Servicios', active: true),
          _TabItem(label: 'Reportes', active: false),
          _TabItem(label: 'Sincronizar', active: false),
        ],
      ),
    );
  }
}
//Hola
class _TabItem extends StatelessWidget {
  final String label;
  final bool active;
  const _TabItem({required this.label, required this.active});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: active ? AppColors.navy : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
            color: active ? AppColors.navy : AppColors.muted,
          ),
        ),
      ),
    );
  }
}
