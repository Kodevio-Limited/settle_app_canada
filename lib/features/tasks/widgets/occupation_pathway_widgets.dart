import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/figma_onboarding_widgets.dart';
import '../models/occupation_data.dart';

class PathwayTimelineCard extends StatelessWidget {
  final List<PathwayStep> steps;
  final int activeStep;
  final ValueChanged<int> onSelectStep;

  const PathwayTimelineCard({
    super.key,
    required this.steps,
    required this.activeStep,
    required this.onSelectStep,
  });

  @override
  Widget build(BuildContext context) {
    return FigmaSurfaceCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < steps.length; i++) ...[
            if (i > 0)
              const Divider(height: 20, thickness: 1, color: AppColors.divider),
            InkWell(
              onTap: () => onSelectStep(steps[i].number),
              borderRadius: BorderRadius.circular(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: activeStep == steps[i].number
                          ? AppColors.primary
                          : AppColors.dark50,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${steps[i].number}',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: activeStep == steps[i].number
                            ? Colors.white
                            : AppColors.mainFont,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                steps[i].title,
                                style: const TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainFont,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              steps[i].duration,
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          steps[i].description,
                          style: const TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 13,
                            height: 1.45,
                            color: AppColors.dark300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class PathwayHelpCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String badge;
  final IconData icon;

  const PathwayHelpCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FigmaSurfaceCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          FigmaIconTile(icon: icon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 12.5,
                    color: AppColors.dark300,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.dark50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              badge,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
