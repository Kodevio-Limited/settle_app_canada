import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Trusted help',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainFont,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 18),

              // Danger / Crisis Hero Banner
              InkWell(
                onTap: () => context.push('/crisis'),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.phone_in_talk_rounded,
                        size: 24,
                        color: Colors.white,
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'In danger? Call 911',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Crisis and support lines, 24/7',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 13,
                                color: Color(0xFFF6D5D6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22),

              // Section 1: Free newcomer services
              const Text(
                'Free newcomer services near you',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Government-funded. Who can use them depends on your status — they'll tell you.",
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 12),

              _buildServiceItem(
                title: 'Newcomer Centre of Peel',
                subtitle: 'Settlement agency · [distance]',
                onTap: () => context.push('/nearby'),
              ),
              const SizedBox(height: 10),
              _buildServiceItem(
                title: 'Peel Multicultural Council',
                subtitle: 'Settlement agency · [distance]',
                onTap: () => context.push('/nearby'),
              ),
              const SizedBox(height: 10),
              _buildServiceItem(
                title: '211 Ontario',
                subtitle: 'Housing, food, community help · call or text 211',
                onTap: () => context.push('/nearby'),
              ),
              const SizedBox(height: 22),

              // Section 2: Questions about your own case
              const Text(
                'Questions about your own case',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Only licensed professionals can advise on immigration or legal matters.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 12),

              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildLinkRow(
                      'Licensed immigration consultants (CICC)',
                      showBorder: true,
                      onTap: () => context.push('/help/how-guidance'),
                    ),
                    _buildLinkRow(
                      'Lawyers & paralegals (Law Society)',
                      showBorder: true,
                      onTap: () => context.push('/help/how-guidance'),
                    ),
                    _buildLinkRow(
                      'Community legal clinics',
                      showBorder: false,
                      onTap: () => context.push('/help/how-guidance'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return FigmaSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      onTap: onTap,
      child: Row(
        children: [
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
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    color: AppColors.dark300,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: AppColors.dark200,
          ),
        ],
      ),
    );
  }

  Widget _buildLinkRow(
    String title, {
    required bool showBorder,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(bottom: BorderSide(color: AppColors.divider))
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainFont,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: AppColors.dark200,
            ),
          ],
        ),
      ),
    );
  }
}
