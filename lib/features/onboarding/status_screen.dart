import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class OnboardingStatusScreen extends ConsumerStatefulWidget {
  const OnboardingStatusScreen({super.key});

  @override
  ConsumerState<OnboardingStatusScreen> createState() =>
      _OnboardingStatusScreenState();
}

class _OnboardingStatusScreenState
    extends ConsumerState<OnboardingStatusScreen> {
  String _selectedStatus = 'Permanent resident';

  final List<String> statuses = [
    'Permanent resident',
    'Work permit',
    'Study permit',
    'Protected person',
    'Canadian citizen',
    'Something else / not sure',
    'Prefer not to say',
  ];

  @override
  Widget build(BuildContext context) {
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
                      stepLabel: 'Step 3 of 5 · Optional',
                      progress: 0.6,
                      onBack: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/destination');
                        }
                      },
                      onSkip: () => context.push('/household'),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Your status in Canada',
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
                      'Only used to show the official steps that usually apply. We never decide eligibility.',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.4,
                        color: AppColors.dark300,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ...statuses.map((st) {
                      final isSelected = _selectedStatus == st;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: FigmaPillOptionTile(
                          title: st,
                          isSelected: isSelected,
                          onTap: () => setState(() => _selectedStatus = st),
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          height: 1.45,
                          color: AppColors.dark300,
                        ),
                        children: [
                          const TextSpan(
                            text:
                                'Not sure? Check your own documents, or ask a licensed immigration consultant or lawyer — find them in ',
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: GestureDetector(
                              onTap: () => context.pushSafe('/help'),
                              child: const Text(
                                'Trusted help',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const TextSpan(
                            text: '. You can change or remove this anytime.',
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
              child: SettleButton(
                label: 'Continue',
                onPressed: () {
                  ref.read(onboardingProvider.notifier).setStatus(_selectedStatus);
                  context.push('/household');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
