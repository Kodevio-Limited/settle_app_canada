import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_decorations.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'auth_provider.dart';

class NotifPermissionScreen extends ConsumerWidget {
  const NotifPermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white600,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: (constraints.maxHeight - 28).clamp(0.0, double.infinity),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: FigmaCircleBackButton(onPressed: () => context.pop()),
                        ),
                        const SizedBox(height: 8),
                        // Large Figma yellow reminder bell illustration
                        SvgPicture.asset(
                          'assets/images/reminder_bell.svg',
                          height: 196,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Never miss an important step',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontWeight: FontWeight.w500,
                            fontSize: 31,
                            height: 1.25,
                            color: AppColors.mainFont,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "We'll remind you before things like a school registration or an appointment you planned. You choose how often, and set quiet hours.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTypography.fontHeading,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.45,
                              color: AppColors.dark300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Sample notification card preview
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white500,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColors.softTeal,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.hexagon,
                                    size: 24,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.s12),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tomorrow · Service Canada',
                                      style: TextStyle(
                                        fontFamily: AppTypography.fontBody,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Bring your original status documents to apply for your SIN — Layla & Omar.',
                                      style: TextStyle(
                                        fontFamily: AppTypography.fontBody,
                                        fontSize: 13.5,
                                        height: 1.4,
                                        color: AppColors.dark300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        SettleButton(
                          label: 'Turn on reminders',
                          onPressed: () {
                            ref.read(authProvider.notifier).setNotifications(true);
                            context.push('/location-permission');
                          },
                        ),
                        const SizedBox(height: 14),
                        FigmaSoftOutlineButton(
                          label: 'Not now',
                          onPressed: () {
                            ref.read(authProvider.notifier).setNotifications(false);
                            context.push('/location-permission');
                          },
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Your phone will ask next. You can change this anytime.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 13,
                            color: AppColors.dark300,
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
