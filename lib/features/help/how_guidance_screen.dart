import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class HowGuidanceScreen extends StatelessWidget {
  const HowGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: FigmaCircleBackButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/settings');
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                "How Settle's guidance works",
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainFont,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 18),

              _buildStepCard(
                stepNumber: '1',
                title: 'From official sources',
                description:
                    'Every step links to the government or service page it comes from, with the date our team last checked it.',
              ),
              const SizedBox(height: 12),

              _buildStepCard(
                stepNumber: '2',
                title: 'Personalized by clear rules',
                description:
                    'Your plan comes from your answers using written rules, not AI. Each task shows why you\'re seeing it.',
              ),
              const SizedBox(height: 12),

              _buildStepCard(
                stepNumber: '3',
                title: 'What Settle is not',
                description:
                    'Not the government. Not immigration, legal, tax, insurance or medical advice. We never submit anything for you.',
              ),
              const SizedBox(height: 12),

              // Item 4 Warm Alert Card
              FigmaNoticeBanner(
                isWarmAlert: true,
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '4',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          color: AppColors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'When to get a professional',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF5C1518),
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 13.5,
                                height: 1.45,
                                color: Color(0xFF5C1518),
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      'Anything about your own immigration case, a legal dispute or your health. ',
                                ),
                                WidgetSpan(
                                  child: InkWell(
                                    onTap: () => context.pushSafe('/help'),
                                    child: const Text(
                                      'Find qualified help',
                                      style: TextStyle(
                                        color: AppColors.red,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                                const TextSpan(text: '.'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              const Text(
                'Settle is made by Experiaco in Mississauga, Ontario.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 6),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Support email: support@settleapp.ca'),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Contact support · [support email]',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard({
    required String stepNumber,
    required String title,
    required String description,
  }) {
    return FigmaSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondary,
            ),
            alignment: Alignment.center,
            child: Text(
              stepNumber,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
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
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13.5,
                    height: 1.45,
                    color: AppColors.dark300,
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
