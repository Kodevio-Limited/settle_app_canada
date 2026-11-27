import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              color: AppColors.dark400,
              child: Row(
                children: [
                  const Icon(Icons.wifi_off_rounded, color: AppColors.white50, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "You're offline. Your plan and checklists still work. Last synced 10:24 am.",
                      style: AppTypography.body2.copyWith(
                        height: 1.35,
                        color: AppColors.white50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good morning, Layla',
                      style: AppTypography.h4.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 14),
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your next 3 actions',
                            style: AppTypography.body2Bold.copyWith(
                              fontSize: 17,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          _buildActionRow(
                            context,
                            title: 'Apply for your SIN',
                            subtitle: 'Available offline',
                            route: '/tasks/sin',
                            showBorder: true,
                          ),
                          _buildActionRow(
                            context,
                            title: 'Apply for Ontario health cards',
                            subtitle: 'Available offline',
                            route: '/checklist',
                            showBorder: true,
                          ),
                          _buildActionRow(
                            context,
                            title: 'Register Sami & Nour for school',
                            subtitle: 'Available offline',
                            route: '/tasks/school',
                            showBorder: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.dark50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Needs a connection',
                            style: AppTypography.body2Bold.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Maps, opening hours and official pages. Nearby lists show your last saved results.',
                            style: AppTypography.body2.copyWith(
                              height: 1.45,
                              color: AppColors.dark300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () => context.push('/crisis'),
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          'Crisis lines work offline — tap to see them',
                          style: AppTypography.body2Bold.copyWith(
                            color: AppColors.white50,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FigmaSoftOutlineButton(
                      label: 'Try again',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Checking connection...')),
                        );
                      },
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

  Widget _buildActionRow(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String route,
    required bool showBorder,
  }) {
    return InkWell(
      onTap: () => context.push(route),
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(bottom: BorderSide(color: AppColors.divider))
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.dark100, width: 2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.body2Bold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    subtitle,
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
    );
  }
}
