import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class DeactivateScreen extends StatelessWidget {
  const DeactivateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            FigmaSubPageHeader(
              title: 'Pause or delete your account',
              onBack: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/settings');
                }
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pause',
                            style: AppTypography.body2Bold.copyWith(
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Stop reminders and hide your plan. Your answers stay saved, so you can pick up where you left off by signing in again.',
                            style: AppTypography.body2.copyWith(
                              height: 1.5,
                              color: AppColors.dark300,
                            ),
                          ),
                          const SizedBox(height: 16),
                          FigmaSoftOutlineButton(
                            label: 'Pause my account',
                            onPressed: () => context.push('/paused'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delete',
                            style: AppTypography.body2Bold.copyWith(
                              fontSize: 18,
                              color: AppColors.error,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Permanently delete your account, household answers, tasks, checklists and reminders. This can't be undone.",
                            style: AppTypography.body2.copyWith(
                              height: 1.5,
                              color: AppColors.dark300,
                            ),
                          ),
                          const SizedBox(height: 16),
                          FigmaDangerButton(
                            label: 'Delete my account…',
                            onPressed: () => context.push('/delete-confirm'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => context.push('/data-export'),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Download a copy of my data first',
                          style: AppTypography.body2Bold.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.push('/notification-settings'),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Just want fewer reminders?',
                          style: AppTypography.body2Bold.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
