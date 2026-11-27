import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

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
              // Header preserving Back + 'Settings' pill
              FigmaSubPageHeader(
                title: 'Reminders',
                onBack: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/home');
                  }
                },
                trailing: InkWell(
                  onTap: () => context.push('/reminders/settings'),
                  borderRadius: BorderRadius.circular(999),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: AppColors.dark50,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Settings',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainFont,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Pill Segmented Tabs: Upcoming / Calendar
              FigmaSegmentedTabs(
                leftLabel: 'Upcoming',
                rightLabel: 'Calendar',
                isLeftSelected: true,
                onLeftTap: () {},
                onRightTap: () =>
                    context.pushReplacement('/reminders/calendar'),
              ),
              const SizedBox(height: 20),

              _buildSectionHeader('Today', AppColors.red),
              const SizedBox(height: 8),
              _buildReminderCard(
                barColor: const Color(0xFFCA292E),
                title: 'Gather documents for SIN',
                subtitle: 'Layla, Omar · 1 of 3 ready',
                onTap: () => context.push('/checklists'),
              ),
              const SizedBox(height: 18),

              _buildSectionHeader('Tomorrow', AppColors.dark300),
              const SizedBox(height: 8),
              _buildReminderCard(
                barColor: AppColors.primary,
                title: 'Visit Service Canada',
                subtitle: 'Mississauga centre · 2.1 km · you planned this',
                onTap: () => context.push('/task-actions/location-detail'),
              ),
              const SizedBox(height: 18),

              _buildSectionHeader('This week', AppColors.dark300),
              const SizedBox(height: 8),
              _buildReminderCard(
                barColor: AppColors.primary,
                title: 'Book school registration',
                subtitle: 'Sami, Nour',
                onTap: () => context.push('/family/member-child'),
              ),
              const SizedBox(height: 10),
              _buildReminderCard(
                barColor: AppColors.primary,
                title: 'Health cards at ServiceOntario',
                subtitle: 'Everyone',
                onTap: () => context.push('/checklists'),
              ),
              const SizedBox(height: 18),

              _buildSectionHeader('Later', AppColors.dark300),
              const SizedBox(height: 8),
              _buildReminderCard(
                barColor: AppColors.dark200,
                title: 'Your first Canadian tax return',
                subtitle: "Spring 2027 · we'll remind you in time",
                onTap: () => context.go('/journey'),
              ),
              const SizedBox(height: 28),

              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Quiet hours 9 pm – 8 am · ',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13,
                        color: AppColors.dark300,
                      ),
                    ),
                    InkWell(
                      onTap: () => context.push('/reminders/settings'),
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontFamily: AppTypography.fontBody,
        fontSize: 12.5,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.6,
        color: color,
      ),
    );
  }

  Widget _buildReminderCard({
    required Color barColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return FigmaSurfaceCard(
      radius: 14,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 3.5,
              decoration: BoxDecoration(
                color: barColor,
                borderRadius: BorderRadius.circular(2),
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
                      color: AppColors.mainFont,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13,
                      color: AppColors.dark200,
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
}
