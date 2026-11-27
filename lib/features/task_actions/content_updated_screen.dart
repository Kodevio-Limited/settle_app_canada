import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class ContentUpdatedScreen extends StatelessWidget {
  const ContentUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: FigmaCircleBackButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/home');
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'UPDATE · VERIFIED [DATE]',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "A step you're working on changed",
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.6,
                  height: 1.12,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Service Canada updated its page for Apply for your SIN. We checked the change and updated your task.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14.5,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'What changed',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 10),

              // What changed white borderless card
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 68,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAD2CF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Before',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFD93025),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            '[Previous wording from the official page]',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              height: 1.4,
                              color: AppColors.dark200,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 68,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFCCF6D8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Now',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F6E3D),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            '[Updated wording from the official page]',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              height: 1.4,
                              color: AppColors.mainFont,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // What this means for you banner
              const FigmaNoticeBanner(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What this means for you',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'One item was added to your "What to bring" list. Your earlier ticks are kept.',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13.5,
                        height: 1.45,
                        color: AppColors.dark300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              SettleButton(
                label: 'Review the task',
                onPressed: () => context.push('/task-sin'),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: () => context.push('/notification-settings'),
                  child: const Text(
                    'Change update alerts',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
