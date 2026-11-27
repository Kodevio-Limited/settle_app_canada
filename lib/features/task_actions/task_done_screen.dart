import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class TaskDoneScreen extends StatelessWidget {
  final String personName;
  final String taskName;

  const TaskDoneScreen({
    super.key,
    this.personName = 'Layla',
    this.taskName = 'SIN',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 56,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Centered Figma Seal Badge
                        Center(
                          child: SvgPicture.asset(
                            'assets/images/plan_ready_badge.svg',
                            width: 92,
                            height: 92,
                          ),
                        ),
                        const SizedBox(height: 22),

                        Text(
                          '$taskName marked as done for $personName',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.6,
                            height: 1.15,
                            color: AppColors.mainFont,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "We've noted it in your plan. We don't send anything to Service Canada for you — this is just your checklist.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 14.5,
                            height: 1.45,
                            color: AppColors.dark300,
                          ),
                        ),
                        const SizedBox(height: 22),

                        // Still open for Omar card
                        FigmaSurfaceCard(
                          radius: 16,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          onTap: () => context.push('/task-sin'),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 16,
                                backgroundColor: AppColors.secondary,
                                child: Text(
                                  'O',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Still open for '),
                                      TextSpan(
                                        text: 'Omar',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(
                                    fontFamily: AppTypography.fontBody,
                                    fontSize: 14,
                                    color: AppColors.mainFont,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => context.push('/task-sin'),
                                child: const Text(
                                  'Mark for Omar',
                                  style: TextStyle(
                                    fontFamily: AppTypography.fontBody,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Now unlocked
                        const Text(
                          'Now unlocked',
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainFont,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildUnlockedCard(
                          category: 'MONEY & BENEFITS',
                          title: 'Apply for the Canada Child Benefit',
                          sub: 'For Sami & Nour · uses your SIN',
                          onTap: () => context.push('/task-ccb'),
                        ),
                        const SizedBox(height: 10),
                        _buildUnlockedCard(
                          category: 'PAPERWORK',
                          title: 'Set up your CRA My Account',
                          sub: 'For Layla · online',
                          onTap: () => context.pushSafe('/journey'),
                        ),
                        const SizedBox(height: 16),

                        // Progress banner
                        const FigmaNoticeBanner(
                          isWarmAlert: true,
                          padding: EdgeInsets.all(14),
                          child: Text(
                            "12 days in and 6 of 40 steps done. That's real progress.",
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              height: 1.45,
                              color: Color(0xFF5C1518),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),

                    // Bottom Actions
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SettleButton(
                          label: 'Back to my plan',
                          onPressed: () => context.go('/home'),
                        ),
                        const SizedBox(height: 6),
                        Center(
                          child: TextButton(
                            onPressed: () => context.pop(),
                            child: const Text(
                              'Undo',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildUnlockedCard({
    required String category,
    required String title,
    required String sub,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFDCE5E5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: AppColors.primary,
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
                    sub,
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
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
