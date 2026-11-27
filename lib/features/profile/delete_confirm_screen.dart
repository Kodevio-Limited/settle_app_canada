import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class DeleteConfirmScreen extends StatefulWidget {
  const DeleteConfirmScreen({super.key});

  @override
  State<DeleteConfirmScreen> createState() => _DeleteConfirmScreenState();
}

class _DeleteConfirmScreenState extends State<DeleteConfirmScreen> {
  final Set<String> _selectedReasons = {};

  final List<String> _reasons = [
    "I've settled in",
    'Not useful',
    'Too many reminders',
    'Privacy',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            FigmaSubPageHeader(
              title: 'Delete your account?',
              onBack: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/deactivate');
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
                            'This deletes',
                            style: AppTypography.body2Bold.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildBullet('Your account and sign-in'),
                          _buildBullet('Your household (5 people)'),
                          _buildBullet('Task progress, checklists and reminders'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    FigmaNoticeBanner(
                      child: Text(
                        "You signed in with Apple, so we'll also disconnect this app from your Apple ID. [Anything kept for legal reasons, and for how long — wording from privacy counsel.]",
                        style: AppTypography.caption1.copyWith(
                          height: 1.45,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Why are you leaving? (optional)',
                      style: AppTypography.body2Bold.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _reasons.map((reason) {
                        final isSelected = _selectedReasons.contains(reason);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedReasons.remove(reason);
                              } else {
                                _selectedReasons.add(reason);
                              }
                            });
                          },
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.softTeal
                                  : AppColors.white50,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.border,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  size: 18,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.dark200,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  reason,
                                  style: (isSelected
                                          ? AppTypography.body2Bold
                                          : AppTypography.body2)
                                      .copyWith(color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),
                    FigmaDangerButton(
                      label: 'Delete permanently',
                      onPressed: () => context.push('/deleted'),
                    ),
                    const SizedBox(height: 8),
                    FigmaSoftOutlineButton(
                      label: 'Keep my account',
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/settings');
                        }
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

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: AppTypography.body2.copyWith(color: AppColors.dark300),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTypography.body2.copyWith(
                height: 1.5,
                color: AppColors.dark300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
