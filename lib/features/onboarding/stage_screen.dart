import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/user_profile.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class OnboardingStageScreen extends ConsumerWidget {
  const OnboardingStageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);

    final stages = [
      (MoveStage.exploring, 'Still exploring Canada'),
      (MoveStage.waiting, 'Applied — waiting for a decision'),
      (MoveStage.approved, 'Approved — getting ready to move'),
      (MoveStage.arrivedUnder3Months, 'Arrived in the last 3 months'),
      (MoveStage.settled3Plus, 'In Canada for more than 3 months'),
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FigmaOnboardingHeader(
                      stepLabel: 'Step 1 of 5',
                      progress: 0.2,
                      onBack: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/location-permission');
                        }
                      },
                      onSkip: () => context.push('/destination'),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Where are you in your move?',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        height: 1.3,
                        color: AppColors.mainFont,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'This decides which steps come first in your plan.',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.4,
                        color: AppColors.dark300,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ...stages.map((st) {
                      final isSelected = state.moveStage == st.$1;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14.0),
                        child: FigmaPillOptionTile(
                          title: st.$2,
                          isSelected: isSelected,
                          onTap: () => notifier.setMoveStage(st.$1),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
              child: SettleButton(
                label: 'Continue',
                onPressed: () => context.push('/destination'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
