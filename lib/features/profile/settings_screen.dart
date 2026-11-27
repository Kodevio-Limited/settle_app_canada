import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Me',
                      style: AppTypography.h4.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 14),
                    FigmaSurfaceCard(
                      onTap: () => context.push('/edit-profile'),
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'L',
                              style: AppTypography.h5.copyWith(
                                color: AppColors.white50,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Layla',
                                  style: AppTypography.body2Bold.copyWith(
                                    fontSize: 17,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Signed in with Apple · private relay email',
                                  style: AppTypography.caption1.copyWith(
                                    color: AppColors.dark200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () => context.push('/family'),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.softTeal,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.people_alt_outlined,
                              size: 24,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'My family',
                                    style: AppTypography.body2Bold.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "5 people · each person's tasks and progress",
                                    style: AppTypography.caption1.copyWith(
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
                      ),
                    ),
                    const SizedBox(height: 18),
                    _buildSectionHeader('My plan'),
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildNavRow(
                            'Edit my answers',
                            trailingText: 'Mississauga · PR',
                            showBorder: true,
                            onTap: () => context.push('/onboarding/destination'),
                          ),
                          _buildNavRow(
                            'Family members',
                            trailingText: '5',
                            showBorder: true,
                            onTap: () => context.push('/family'),
                          ),
                          _buildNavRow(
                            'Something changed?',
                            trailingText: 'Move, job, baby…',
                            showBorder: false,
                            onTap: () => context.push('/life-event'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    _buildSectionHeader('App'),
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildNavRow(
                            'Reminders & quiet hours',
                            trailingText: 'On',
                            showBorder: true,
                            onTap: () => context.push('/notification-settings'),
                          ),
                          _buildNavRow(
                            'Language & accessibility',
                            trailingText: 'English',
                            showBorder: true,
                            onTap: () => context.push('/language-access'),
                          ),
                          _buildNavRow(
                            'Privacy & my data',
                            trailingText: '›',
                            showBorder: false,
                            onTap: () => context.push('/privacy-data'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    _buildSectionHeader('About'),
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildNavRow(
                            'How our guidance works',
                            trailingText: '›',
                            showBorder: true,
                            onTap: () => context.push('/how-guidance'),
                          ),
                          _buildNavRow(
                            'Terms & Privacy Policy',
                            trailingText: '›',
                            showBorder: false,
                            onTap: () => context.push('/privacy-policy'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => context.push('/sign-out-confirm'),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Sign out',
                                style: AppTypography.body2Bold.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => context.push('/deactivate'),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Pause or delete account',
                                style: AppTypography.body2Bold.copyWith(
                                  color: AppColors.error,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 6),
      child: Text(
        title.toUpperCase(),
        style: AppTypography.caption1.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: AppColors.dark200,
        ),
      ),
    );
  }

  Widget _buildNavRow(
    String label, {
    required String trailingText,
    required bool showBorder,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        padding: const EdgeInsets.symmetric(vertical: 12),
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
                label,
                style: AppTypography.body2.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            Text(
              trailingText,
              style: AppTypography.body2.copyWith(
                color: AppColors.dark200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
