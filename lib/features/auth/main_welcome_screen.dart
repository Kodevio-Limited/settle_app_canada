import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_decorations.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import '../auth/auth_provider.dart';
import '../debug/debug_menu.dart';

class MainWelcomeScreen extends ConsumerStatefulWidget {
  const MainWelcomeScreen({super.key});

  @override
  ConsumerState<MainWelcomeScreen> createState() => _MainWelcomeScreenState();
}

class _MainWelcomeScreenState extends ConsumerState<MainWelcomeScreen> {
  String _selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              // App Logo - left aligned (long press opens Debug Presets)
              GestureDetector(
                onLongPress: () => DebugMenuSheet.show(context),
                child: Image.asset(
                  'assets/images/07c6b61d7c458b0713169e060e736b9d.png',
                  width: 170,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Text(
                    'Settle\nCANADA',
                    style: TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Main Headline
              const Text(
                'Settle in Canada,\none clear step at a\ntime.',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w800,
                  fontSize: 34,
                  height: 1.15,
                  letterSpacing: -0.8,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              // Arabic subtitle - right aligned
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'استقرّ في كندا، خطوة واضحة في كل مرة',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: AppTypography.arabic(
                    fontSize: 17,
                    color: const Color(0xFF3B4747),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Journey illustration path - exact scale 340 x 140
              Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    width: 340,
                    height: 140,
                    child: CustomPaint(
                      size: const Size(340, 140),
                      painter: _JourneyCurvePainter(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Language Selector Pills
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _langChip('English'),
                  const SizedBox(width: AppSpacing.s8),
                  _langChip('العربية'),
                  const SizedBox(width: AppSpacing.s8),
                  _langChip('Français'),
                ],
              ),
              const SizedBox(height: 28),
              // Actions
              SettleButton(
                label: 'Get started',
                onPressed: () => context.push('/sign-up'),
              ),
              const SizedBox(height: AppSpacing.s10),
              SettleButton(
                label: 'I already have an account',
                variant: SettleButtonVariant.outline,
                onPressed: () => context.push('/sign-in'),
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () {
                    ref.read(authProvider.notifier).setGuest();
                    context.push('/guest-home');
                  },
                  child: Text(
                    'Explore without an account',
                    style: AppTypography.body2Bold.copyWith(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Disclaimer
              const Center(
                child: Text(
                  'Independent guide by Experiaco. Not affiliated with the\nGovernment of Canada.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 11,
                    color: Color(0xFF5A5F6B),
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _langChip(String lang) {
    final isSel = _selectedLang == lang;
    return InkWell(
      onTap: () => setState(() => _selectedLang = lang),
      borderRadius: AppRadii.border100,
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSel ? AppColors.softTeal : AppColors.white50,
          borderRadius: AppRadii.border100,
          border: Border.all(
            color: isSel ? AppColors.primary : AppColors.border,
            width: isSel ? 2.0 : 1.0,
          ),
        ),
        child: Text(
          lang,
          style: TextStyle(
            fontFamily: lang == 'العربية' ? AppTypography.fontArabic : AppTypography.fontBody,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}

class _JourneyCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    // The dotted path passes directly through the centers of all 4 milestone circles:
    // P1 Status (32, 102) -> P2 Paperwork (116, 44) -> P3 Housing (204, 98) -> P4 Schools (296, 38)
    final path = Path();
    path.moveTo(32, 102);
    path.cubicTo(60, 102, 80, 44, 116, 44);
    path.cubicTo(150, 44, 175, 98, 204, 98);
    path.cubicTo(225, 98, 235, 38, 296, 38);

    // Draw dashed path: stroke-dasharray="2 9"
    const dashWidth = 2.0;
    const dashSpace = 9.0;
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final extractPath = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extractPath, strokePaint);
        distance += dashWidth + dashSpace;
      }
    }

    // Node 1: Status (solid dark) at (32, 102), r=10
    canvas.drawCircle(const Offset(32, 102), 10, Paint()..color = AppColors.primary);
    _drawLabel(canvas, 'Status', const Offset(32, 118));

    // Node 2: Paperwork (solid dark) at (116, 44), r=10
    canvas.drawCircle(const Offset(116, 44), 10, Paint()..color = AppColors.primary);
    _drawLabel(canvas, 'Paperwork', const Offset(116, 18));

    // Node 3: Housing (white circle with dark stroke) directly pierced by the path at (204, 98), r=10
    final housingFill = Paint()..color = Colors.white;
    final housingStroke = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    canvas.drawCircle(const Offset(204, 98), 10, housingFill);
    canvas.drawCircle(const Offset(204, 98), 10, housingStroke);
    _drawLabel(canvas, 'Housing', const Offset(204, 118));

    // Node 4: Schools... (red marker) at (296, 38), r=12
    canvas.drawCircle(const Offset(296, 38), 12, Paint()..color = const Color(0xFFCA292E));
    // Label at (296, 58) has full clearance below the circle and curve (curve is at y<=42 in this x-range)
    _drawLabel(canvas, 'Schools…', const Offset(296, 58));
  }

  void _drawLabel(Canvas canvas, String text, Offset center) {
    final span = TextSpan(
      text: text,
      style: const TextStyle(
        fontFamily: AppTypography.fontBody,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFF3B4747),
      ),
    );
    final tp = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout();
    tp.paint(canvas, Offset(center.dx - (tp.width / 2), center.dy));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
