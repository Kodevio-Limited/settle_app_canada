import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class SignOutConfirmScreen extends StatelessWidget {
  const SignOutConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark400,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: FigmaSurfaceCard(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign out of Settle?',
                    textAlign: TextAlign.center,
                    style: AppTypography.h5.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your plan stays saved. Reminders on this iPhone will stop until you sign in again.',
                    textAlign: TextAlign.center,
                    style: AppTypography.body2.copyWith(
                      height: 1.45,
                      color: AppColors.dark300,
                    ),
                  ),
                  const SizedBox(height: 18),
                  SettleButton(
                    label: 'Sign out',
                    onPressed: () => context.go('/'),
                  ),
                  const SizedBox(height: 8),
                  FigmaSoftOutlineButton(
                    label: 'Cancel',
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
        ),
      ),
    );
  }
}
