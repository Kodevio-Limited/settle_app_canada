import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class MemberStudentScreen extends StatelessWidget {
  const MemberStudentScreen({super.key});

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
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FigmaCircleBackButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/family');
                      }
                    },
                  ),
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF4A6FA5),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Y',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FigmaCircleActionButton(
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 20,
                      color: AppColors.mainFont,
                    ),
                    tooltip: 'Edit',
                    onPressed: () => context.push('/onboarding/add-adult'),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              const Text(
                'Yasmin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Adult child · 18–21 · planning university',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13.5,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 18),

              // Tasks Card
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Column(
                  children: [
                    _buildTaskItem(
                      category: 'Paperwork · Next',
                      categoryColor: AppColors.red,
                      title: 'Apply for her own SIN',
                      isLast: false,
                      onTap: () => context.push('/tasks/sin'),
                    ),
                    _buildTaskItem(
                      category: 'University stream',
                      categoryColor: AppColors.primary,
                      title: 'Apply to university or college',
                      isLast: false,
                      onTap: () => context.push('/stages/stage-university'),
                    ),
                    _buildTaskItem(
                      category: 'University stream',
                      categoryColor: AppColors.primary,
                      title: 'Apply for OSAP',
                      tag: 'Needs her SIN',
                      isLast: false,
                      onTap: () => context.push('/stages/stage-university'),
                    ),
                    _buildTaskItem(
                      category: 'Paperwork · shared',
                      categoryColor: AppColors.red,
                      title: 'Ontario health card',
                      isLast: true,
                      onTap: () => context.push('/checklists'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // University stream link card
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.all(14),
                onTap: () => context.push('/stages/stage-university'),
                child: const Row(
                  children: [
                    FigmaIconTile(
                      icon: Icons.school_outlined,
                      iconColor: AppColors.primary,
                      backgroundColor: AppColors.dark50,
                      size: 42,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Her university & college stream',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '6 steps · 3 campuses nearby',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13,
                              color: AppColors.dark300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: AppColors.dark200,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Yasmin is an adult banner
              const FigmaNoticeBanner(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yasmin is an adult',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'She can have her own private Settle account. Her check-ins and notes stay hers.',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13,
                        height: 1.45,
                        color: AppColors.dark300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),

              SettleButton(
                label: 'Send Yasmin an invite',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invite link copied for Yasmin'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              FigmaDangerButton(
                label: 'Remove Yasmin',
                onPressed: () =>
                    context.push('/family/remove-member?name=Yasmin'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskItem({
    required String category,
    required Color categoryColor,
    required String title,
    String? tag,
    required bool isLast,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(
                  bottom: BorderSide(color: AppColors.divider),
                ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.dark100, width: 1.5),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.toUpperCase(),
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: categoryColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainFont,
                    ),
                  ),
                  if (tag != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      tag,
                      style: const TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 12,
                        color: AppColors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: AppColors.dark200,
            ),
          ],
        ),
      ),
    );
  }
}
