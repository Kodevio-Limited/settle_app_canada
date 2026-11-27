import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class MemberChildScreen extends StatelessWidget {
  const MemberChildScreen({super.key});

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
                      color: Color(0xFF6B4C8A),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'N',
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
                    onPressed: () => context.push('/onboarding/add-child'),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              const Text(
                'Nour',
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
                '12–14 · Secondary school · English support: yes',
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
                      category: 'Schools · Next',
                      categoryColor: AppColors.primary,
                      title: 'Register with your school board',
                      subtitle: 'Peel District or Dufferin-Peel Catholic',
                      isLast: false,
                      onTap: () => context.push('/tasks/school'),
                    ),
                    _buildTaskItem(
                      category: 'Schools',
                      categoryColor: AppColors.primary,
                      title: 'Check school immunization records',
                      subtitle: 'Peel Public Health · records you already have',
                      isLast: false,
                      onTap: () => context.push('/tasks/immunization'),
                    ),
                    _buildTaskItem(
                      category: 'Schools',
                      categoryColor: AppColors.primary,
                      title: 'English language support assessment',
                      subtitle: 'Arranged by the school board',
                      isLast: false,
                      onTap: () => context.push('/tasks/esl'),
                    ),
                    _buildTaskItem(
                      category: 'Paperwork · shared',
                      categoryColor: AppColors.red,
                      title: 'Ontario health card',
                      subtitle: 'Done together with the family',
                      isLast: true,
                      onTap: () => context.push('/tasks/sin'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Nearby link card
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.all(14),
                onTap: () => context.push('/task-actions/nearby'),
                child: const Row(
                  children: [
                    FigmaIconTile(
                      icon: Icons.location_on_rounded,
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
                            'Newcomer school registration near you',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'School board offices · 3.4 km',
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
              const SizedBox(height: 10),

              // Conversation Guide link card
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.all(14),
                color: const Color(0xFFEBD4D6),
                onTap: () {},
                child: const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Talking with Nour about the move',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'A short conversation guide for parents of teens',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13,
                              color: Color(0xFF5C1518),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: AppColors.red,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              const Text(
                'Stored: nickname and age range only.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 14),

              FigmaDangerButton(
                label: 'Remove Nour',
                onPressed: () =>
                    context.push('/family/remove-member?name=Nour'),
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
    required String subtitle,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.dark100, width: 1.5),
                ),
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
          ],
        ),
      ),
    );
  }
}
