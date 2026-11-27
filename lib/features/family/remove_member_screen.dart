import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class RemoveMemberScreen extends StatelessWidget {
  final String memberName;

  const RemoveMemberScreen({
    super.key,
    this.memberName = 'Nour',
  });

  @override
  Widget build(BuildContext context) {
    final initial = memberName.isNotEmpty ? memberName[0].toUpperCase() : 'N';
    final isOmar = memberName.toLowerCase() == 'omar';
    final isLayla = memberName.toLowerCase() == 'layla';

    return Scaffold(
      backgroundColor: const Color(0xFF4A4D55),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 22,
                        color: AppColors.dark200,
                      ),
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/family');
                        }
                      },
                    ),
                  ),
                  if (isOmar || isLayla)
                    Container(
                      width: 84,
                      height: 84,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.dark50,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        isOmar
                            ? 'assets/images/avatar_omar.png'
                            : 'assets/images/avatar_layla.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  else
                    Container(
                      width: 72,
                      height: 72,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF6B4C8A),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        initial,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),

                  Text(
                    'Remove $memberName from your household?',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainFont,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "$memberName's tasks, ticks and reminders will be deleted. Your plan updates to match. This can't be undone.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 14,
                      height: 1.45,
                      color: AppColors.dark200,
                    ),
                  ),
                  const SizedBox(height: 22),

                  FigmaDangerButton(
                    label: 'Remove $memberName',
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/family');
                      }
                    },
                  ),
                  const SizedBox(height: 8),

                  TextButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/family');
                      }
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
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
