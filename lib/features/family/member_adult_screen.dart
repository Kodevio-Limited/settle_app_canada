import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class MemberAdultScreen extends StatelessWidget {
  const MemberAdultScreen({super.key});

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
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.dark50,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/avatar_omar.png',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Center(
                        child: Text(
                          'O',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
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

              // Profile Info
              const Text(
                'Omar',
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
                'Partner · looking for work · drives',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13.5,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 18),

              // Progress bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '2 of 10 tasks done',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13,
                      color: AppColors.dark300,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: AppColors.dark50,
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.25,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Borderless Tasks Card
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
                      title: 'Apply for your SIN',
                      isDone: true,
                      isLast: false,
                      onTap: () => context.push('/tasks/sin'),
                    ),
                    _buildTaskItem(
                      category: 'Car & driving',
                      title: 'Exchange or start your licence',
                      isDone: true,
                      isLast: false,
                      onTap: () => context.push('/tasks/licence'),
                    ),
                    _buildTaskItem(
                      category: 'Work',
                      title: 'Connect with employment services',
                      isDone: false,
                      isLast: false,
                      onTap: () => context.push('/tasks/work'),
                    ),
                    _buildTaskItem(
                      category: 'Work · licence',
                      title: 'Get licensed as an engineer (P.Eng.)',
                      isDone: false,
                      isLast: true,
                      onTap: () => context.push('/occupations/pathway'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Invite notice banner
              const FigmaNoticeBanner(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invite Omar to his own account',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Optional. He'll see his own tasks and the household's shared ones. Neither of you sees the other's check-ins or private notes.",
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
              const SizedBox(height: 24),

              // Action Buttons
              SettleButton(
                label: 'Send an invite link',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invite link copied to clipboard'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              FigmaDangerButton(
                label: 'Remove Omar from household',
                onPressed: () =>
                    context.push('/family/remove-member?name=Omar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskItem({
    required String category,
    required String title,
    required bool isDone,
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
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDone ? AppColors.secondary : Colors.transparent,
                border: isDone
                    ? null
                    : Border.all(color: AppColors.dark100, width: 1.5),
              ),
              child: isDone
                  ? const Icon(Icons.check, size: 15, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: AppColors.red,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainFont,
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'View',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: 2),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
