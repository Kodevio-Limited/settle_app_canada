import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const greenDotDays = {16, 17, 18, 20};
    const todayDay = 28;
    const selectedDay = 29;
    const plannedDays = {30};

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FigmaSubPageHeader(
                title: 'Reminders',
                onBack: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/home');
                  }
                },
                trailing: InkWell(
                  onTap: () => context.push('/reminders/settings'),
                  borderRadius: BorderRadius.circular(999),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: AppColors.dark50,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Settings',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainFont,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              FigmaSegmentedTabs(
                leftLabel: 'Upcoming',
                rightLabel: 'Calendar',
                isLeftSelected: false,
                onLeftTap: () => context.pushReplacement('/reminders'),
                onRightTap: () {},
              ),
              const SizedBox(height: 18),

              // Borderless Calendar Card
              FigmaSurfaceCard(
                radius: 18,
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(22),
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Icon(
                                Icons.chevron_left_rounded,
                                size: 22,
                                color: AppColors.mainFont,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'September 2026',
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainFont,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(22),
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Icon(
                                Icons.chevron_right_rounded,
                                size: 22,
                                color: AppColors.mainFont,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((day) {
                        return SizedBox(
                          width: 36,
                          child: Text(
                            day,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.dark200,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 32,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index) {
                        if (index < 2) {
                          return const SizedBox();
                        }
                        final dayNum = index - 1;
                        final isSelected = dayNum == selectedDay;
                        final isToday = dayNum == todayDay;
                        final hasGreenDot = greenDotDays.contains(dayNum);
                        final hasPlannedDot = plannedDays.contains(dayNum);

                        return Container(
                          decoration: isSelected
                              ? const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                )
                              : null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$dayNum',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 14,
                                  fontWeight: (isSelected || isToday)
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? Colors.white
                                      : isToday
                                          ? AppColors.red
                                          : AppColors.mainFont,
                                ),
                              ),
                              const SizedBox(height: 2),
                              if (isSelected)
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                )
                              else if (isToday)
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.red,
                                  ),
                                )
                              else if (hasGreenDot)
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.secondary,
                                  ),
                                )
                              else if (hasPlannedDot)
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primary,
                                  ),
                                )
                              else
                                const SizedBox(height: 4),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              const Text(
                'Tuesday, September 29',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 8),

              FigmaSurfaceCard(
                radius: 14,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                onTap: () => context.push('/task-actions/location-detail'),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 3.5,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Visit Service Canada · SIN',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainFont,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Layla, Omar · 10:00 am · in iPhone Calendar',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 13,
                                color: AppColors.dark200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  _buildLegendItem(AppColors.secondary, 'Done'),
                  const SizedBox(width: 16),
                  _buildLegendItem(AppColors.red, 'Today'),
                  const SizedBox(width: 16),
                  _buildLegendItem(AppColors.primary, 'Planned'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color dotColor, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotColor,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 12,
            color: AppColors.dark300,
          ),
        ),
      ],
    );
  }
}
