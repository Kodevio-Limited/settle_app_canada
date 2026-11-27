import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';

class DeletedScreen extends StatelessWidget {
  const DeletedScreen({super.key});

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
                decoration: const BoxDecoration(
                  color: AppColors.softTeal,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.check,
                  size: 36,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your account has been deleted',
                style: AppTypography.h4.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Thank you for letting us walk with you through your first steps in Canada. We've emailed you a confirmation.",
                style: AppTypography.body2.copyWith(
                  height: 1.5,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'بالتوفيق في رحلتك',
                  textDirection: TextDirection.rtl,
                  style: AppTypography.body2.copyWith(
                    fontFamily: AppTypography.fontArabic,
                    fontSize: 18,
                    color: AppColors.dark300,
                  ),
                ),
              ),
              const Spacer(),
              SettleButton(
                label: 'Done',
                onPressed: () => context.go('/'),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'You can start fresh with a new account anytime.',
                  style: AppTypography.caption1.copyWith(
                    color: AppColors.dark200,
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
