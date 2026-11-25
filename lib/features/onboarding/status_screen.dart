import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class OnboardingStatusScreen extends ConsumerStatefulWidget {
  const OnboardingStatusScreen({super.key});

  @override
  ConsumerState<OnboardingStatusScreen> createState() => _OnboardingStatusScreenState();
}

class _OnboardingStatusScreenState extends ConsumerState<OnboardingStatusScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: AppColors.primary,
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/destination');
            }
          },
        ),
        title: const Text(
          'Step 3 of 5 · Optional',
          style: TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5A5F6B),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => context.push('/household'),
            child: const Text('Skip', style: AppTypography.body2Bold),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFDEDEE2),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Your status in Canada',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  height: 1.1,
                  letterSpacing: -0.6,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Only used to show the official steps that usually apply. We never decide eligibility.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 15,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 18),
              // Status Options
              ...statuses.map((st) {
                final isSelected = _selectedStatus == st;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: () => setState(() => _selectedStatus = st),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFEAF2F1) : AppColors.white50,
                        border: Border.all(
                          color: isSelected ? AppColors.primary : const Color(0xFFDEDEE2),
                          width: isSelected ? 2.0 : 1.0,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                            color: isSelected ? AppColors.primary : const Color(0xFF5A5F6B),
                            size: 22,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              st,
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 16,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 16),
              // Verbatim paragraph from Status.dc.html
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    height: 1.45,
                    color: Color(0xFF3B4747),
                  ),
                  children: [
                    const TextSpan(
                      text: 'Not sure? Check your own documents, or ask a licensed immigration consultant or lawyer — find them in ',
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        onTap: () => context.push('/help'),
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
              const SizedBox(height: 24),
              SettleButton(
                label: 'Continue',
                onPressed: () {
                  ref.read(onboardingProvider.notifier).setStatus(_selectedStatus);
                  context.push('/household');
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
