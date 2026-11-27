import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class JustTodayScreen extends StatelessWidget {
  const JustTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 52,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'JUST TODAY',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                            color: AppColors.red,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "One thing today. That's enough.",
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            height: 1.1,
                            letterSpacing: -0.8,
                            color: AppColors.mainFont,
                          ),
                        ),
                        const SizedBox(height: 22),

                        FigmaSurfaceCard(
                          radius: 20,
                          padding: const EdgeInsets.all(22),
                          onTap: () => context.push('/checklists'),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PAPERWORK',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6,
                                  color: AppColors.red,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Put your SIN documents in one envelope',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontHeading,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  height: 1.25,
                                  color: AppColors.mainFont,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "About 10 minutes. Tomorrow's visit will feel easier.",
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 14.5,
                                  height: 1.45,
                                  color: AppColors.dark300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        SettleButton(
                          label: 'Done for today',
                          onPressed: () => context.push('/task-actions/done'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    Center(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => context.go('/home'),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Show my full plan',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => context.go('/home'),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Turn off "just today"',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.dark300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
