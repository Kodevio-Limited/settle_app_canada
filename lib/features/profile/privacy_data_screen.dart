import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class PrivacyDataScreen extends StatefulWidget {
  const PrivacyDataScreen({super.key});

  @override
  State<PrivacyDataScreen> createState() => _PrivacyDataScreenState();
}

class _PrivacyDataScreenState extends State<PrivacyDataScreen> {
  bool _nearbyServices = true;
  bool _anonymousStats = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            FigmaSubPageHeader(
              title: 'Privacy & my data',
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
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 6),
                      child: Text(
                        'WHAT WE KEEP',
                        style: AppTypography.caption1.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          color: AppColors.dark200,
                        ),
                      ),
                    ),
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildDataRow('Email for sign-in', showBorder: true),
                          _buildDataRow(
                            'City, stage, arrival month',
                            actionLabel: 'Edit',
                            onActionTap: () =>
                                context.push('/onboarding/destination'),
                            showBorder: true,
                          ),
                          _buildDataRow(
                            'Status category',
                            actionLabel: 'Remove',
                            onActionTap: () => context.push('/status'),
                            showBorder: true,
                          ),
                          _buildDataRow(
                            'Family nicknames & age ranges',
                            actionLabel: 'Edit',
                            onActionTap: () => context.push('/family'),
                            showBorder: true,
                          ),
                          _buildDataRow('Task ticks & reminders',
                              showBorder: false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.alertSurface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Never collected',
                            style: AppTypography.body2Bold.copyWith(
                              color: AppColors.red,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Documents or photos · passport, UCI, SIN or file numbers · birthdates · medical records · precise location',
                            style: AppTypography.caption1.copyWith(
                              height: 1.5,
                              color: AppColors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nearby services',
                                        style: AppTypography.body2.copyWith(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Approximate, only while app is open',
                                        style: AppTypography.caption1.copyWith(
                                          color: AppColors.dark200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  value: _nearbyServices,
                                  activeColor: AppColors.success,
                                  onChanged: (val) =>
                                      setState(() => _nearbyServices = val),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1, color: AppColors.divider),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Anonymous usage stats',
                                        style: AppTypography.body2.copyWith(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'No tracking, no ads, ever',
                                        style: AppTypography.caption1.copyWith(
                                          color: AppColors.dark200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  value: _anonymousStats,
                                  activeColor: AppColors.success,
                                  onChanged: (val) =>
                                      setState(() => _anonymousStats = val),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    FigmaSoftOutlineButton(
                      label: 'Download a copy of my data',
                      onPressed: () => context.push('/data-export'),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      children: [
                        Text(
                          'Stored in Canada [confirm with hosting provider]. ',
                          style: AppTypography.caption1.copyWith(
                            color: AppColors.dark200,
                          ),
                        ),
                        InkWell(
                          onTap: () => context.push('/deactivate'),
                          child: Text(
                            'Delete my account',
                            style: AppTypography.caption1.copyWith(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'No app? Delete on the web',
                        style: AppTypography.body2Bold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(
    String label, {
    String? actionLabel,
    VoidCallback? onActionTap,
    required bool showBorder,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 48),
      padding: const EdgeInsets.symmetric(vertical: 10),
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
          if (actionLabel != null && onActionTap != null)
            InkWell(
              onTap: onActionTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  actionLabel,
                  style: AppTypography.body2Bold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
