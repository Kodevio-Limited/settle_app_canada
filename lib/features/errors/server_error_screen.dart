import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class ServerErrorScreen extends StatelessWidget {
  const ServerErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.red.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.error_outline_rounded,
                  size: 36,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Something went wrong on our side',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w400,
                  fontSize: 32,
                  height: 1.1,
                  letterSpacing: -0.5,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your plan is safe. Nothing you ticked was lost. Please try again in a moment.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 16,
                  height: 1.5,
                  color: AppColors.dark300,
                ),
              ),
              const Spacer(),
              SettleButton(
                label: 'Try again',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Retrying...')),
                  );
                },
              ),
              const SizedBox(height: 10),
              FigmaSoftOutlineButton(
                label: 'Use my saved plan',
                onPressed: () => context.go('/offline'),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: () => context.push('/crisis'),
                  child: Text(
                    'Get help now',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.red,
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
