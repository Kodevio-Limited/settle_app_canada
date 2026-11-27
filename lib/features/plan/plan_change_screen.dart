import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class PlanChangeScreen extends StatelessWidget {
  const PlanChangeScreen({super.key});

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
                'YOUR PLAN CHANGED',
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
                'You moved from Mississauga to Brampton',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  height: 1.12,
                  letterSpacing: -0.6,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                "Here's what we updated, and why.",
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14.5,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 20),

              // + 3 added Section
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '+ 3 added',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF248A3D),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildTaskItem(
                      'Update your address with the CRA',
                      'Benefits and tax mail go to your new home',
                    ),
                    const SizedBox(height: 12),
                    _buildTaskItem(
                      'Update address on health cards & licence',
                      'Ontario asks for address changes to be reported',
                    ),
                    const SizedBox(height: 12),
                    _buildTaskItem(
                      'Get a Brampton Library card',
                      'Your new local library',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // - 1 removed Section
              const FigmaSurfaceCard(
                radius: 16,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '− 1 removed',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Get a Mississauga Library card',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.mainFont,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'No longer your local library',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13,
                        color: AppColors.dark300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Unchanged Section
              const FigmaNoticeBanner(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unchanged',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'School steps stay the same — both cities are in Peel Region. Nearby offices now show around Brampton.',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13.5,
                        height: 1.45,
                        color: AppColors.mainFont,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              SettleButton(
                label: 'Looks right',
                onPressed: () => context.go('/home'),
              ),
              const SizedBox(height: 10),
              FigmaSoftOutlineButton(
                label: "Something's wrong — edit my answers",
                onPressed: () => context.push('/onboarding/destination'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
