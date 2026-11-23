import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
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
      backgroundColor: const Color(0xFF123332), // Dark teal canonical background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // Red checkmark badge (64x64, radius 32, #CA292E)
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFFCA292E),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              const SizedBox(height: 18),
              // Main title
              Text(
                'Your plan is ready, $primaryName',
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w800,
                  fontSize: 34,
                  height: 1.05,
                  letterSpacing: -0.8,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              // Subtitle
              Text(
                'Built from what you told us: arrived in ${state.arrivalMonth}, settling in ${state.city}, ${state.members.length} people, and you care most about paperwork, a home and school.',
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 15,
                  height: 1.5,
                  color: Color(0xFFCFE3E1),
                ),
              ),
              const SizedBox(height: 20),
              // 3 Stat Cards Grid
              Row(
                children: [
                  _statCard('10', 'stages'),
                  const SizedBox(width: 8),
                  _statCard('40', 'tasks'),
                  const SizedBox(width: 8),
                  _statCard('${state.members.length}', 'people'),
                ],
              ),
              const SizedBox(height: 20),
              // White Card: Start with these three
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Start with these three',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
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
                    const SizedBox(height: 12),
                    _taskRow(
                      number: '2',
                      title: 'Apply for Ontario health cards',
                      subtitle: 'Everyone · Paperwork',
                    ),
                    const SizedBox(height: 12),
                    _taskRow(
                      number: '3',
                      title: 'Register Sami & Nour for school',
                      subtitle: 'Sami, Nour · Schools',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Footer Button: White button
              InkWell(
                onTap: () => context.go('/home'),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: double.infinity,
                  height: 54,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'Go to my plan',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Change any answer later — your plan updates with it.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    color: Color(0xFFCFE3E1),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String count, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF346767),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              count,
              style: const TextStyle(
                fontFamily: AppTypography.fontHeading,
                fontWeight: FontWeight.w800,
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 13,
                color: Color(0xFFCFE3E1),
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
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Color(0xFFE2ECEB),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: const TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
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
                  fontFamily: AppTypography.fontBody,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13,
                  color: Color(0xFF5A5F6B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
