import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class PlanReadyScreen extends ConsumerWidget {
  const PlanReadyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    final primaryName = state.members
        .firstWhere((m) => m.relationship == 'self',
            orElse: () => state.members.first)
        .name;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),
                    // Large scalloped green checkmark badge matching Figma Plan Ready
                    SvgPicture.asset(
                      'assets/images/plan_ready_badge.svg',
                      width: 196,
                      height: 196,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Your plan is ready, $primaryName',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontWeight: FontWeight.w500,
                        fontSize: 31,
                        height: 1.25,
                        color: AppColors.mainFont,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Built from what you told us: arrived in ${state.arrivalMonth}, settling in ${state.city}, ${state.members.length} people, and you care most about paperwork, a home and school.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: AppTypography.fontHeading,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1.45,
                          color: AppColors.dark300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // White card: Start with these three
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppColors.white500,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Start with these three',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 14),
                          _taskRow(
                            number: '1',
                            title: 'Apply for your SIN',
                            subtitle: 'Layla, Omar, Yasmin · Paperwork',
                          ),
                          const SizedBox(height: 16),
                          _taskRow(
                            number: '2',
                            title: 'Apply for Ontario health cards',
                            subtitle: 'Everyone · Paperwork',
                          ),
                          const SizedBox(height: 16),
                          _taskRow(
                            number: '3',
                            title: 'Register Sami & Nour for school',
                            subtitle: 'Sami, Nour · Schools',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
              child: Column(
                children: [
                  SettleButton(
                    label: 'Go to my plan',
                    onPressed: () => context.go('/home'),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Change any answer later — your plan updates with it.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 12.5,
                      color: AppColors.dark300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _taskRow({
    required String number,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 27,
          height: 27,
          margin: const EdgeInsets.only(top: 2),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: const TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12,
                  color: AppColors.dark300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
