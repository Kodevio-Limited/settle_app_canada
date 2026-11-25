import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Days representation for September 2026: starts on Tuesday (offset 2 empty spaces)
    // 30 days total
    const greenDotDays = {16, 17, 18, 20};
    const todayDay = 28;
    const selectedDay = 29;
    const plannedDays = {30};

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: InkWell(
                      onTap: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/home');
                        }
                      },
                      borderRadius: BorderRadius.circular(22),
                      child: const SizedBox(
                        width: 44,
                        height: 44,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => context.push('/reminders/settings'),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF123332),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),

              Text(
                'Reminders',
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF123332),
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 12),

              // Segmented Tabs: Upcoming / Calendar (Active)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6E6E9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => context.pushReplacement('/reminders'),
                        borderRadius: BorderRadius.circular(9),
                        child: Container(
                          height: 38,
                          alignment: Alignment.center,
                          child: const Text(
                            'Upcoming',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3B4747),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Calendar',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Calendar Card
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: Column(
                  children: [
                    // Month Navigation Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(22),
                          child: const SizedBox(
                            width: 44,
                            height: 44,
                            child: Center(
                              child: Icon(
                                Icons.chevron_left_rounded,
                                size: 24,
                                color: Color(0xFF123332),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'September 2026',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF123332),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(22),
                          child: const SizedBox(
                            width: 44,
                            height: 44,
                            child: Center(
                              child: Icon(
                                Icons.chevron_right_rounded,
                                size: 24,
                                color: Color(0xFF123332),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Day Header labels S M T W T F S
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((day) {
                        return SizedBox(
                          width: 40,
                          child: Text(
                            day,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF5A5F6B),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 6),

                    // 7-column Calendar Grid (32 items: 2 offsets + 30 days)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 32,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index) {
                        if (index < 2) {
                          return const SizedBox();
                        }
                        final dayNum = index - 1; // 1 to 30

                        final isSelected = dayNum == selectedDay;
                        final isToday = dayNum == todayDay;
                        final hasGreenDot = greenDotDays.contains(dayNum);
                        final hasPlannedDot = plannedDays.contains(dayNum);

                        return Container(
                          decoration: isSelected
                              ? BoxDecoration(
                                  color: const Color(0xFF123332),
                                  borderRadius: BorderRadius.circular(12),
                                )
                              : null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$dayNum',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: (isSelected || isToday)
                                      ? FontWeight.w700
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? Colors.white
                                      : isToday
                                          ? const Color(0xFFA82227)
                                          : const Color(0xFF123332),
                                ),
                              ),
                              const SizedBox(height: 2),
                              if (isSelected)
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                )
                              else if (isToday)
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFCA292E),
                                  ),
                                )
                              else if (hasGreenDot)
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF2E6B4F),
                                  ),
                                )
                              else if (hasPlannedDot)
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF123332),
                                  ),
                                )
                              else
                                const SizedBox(height: 5),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Selected Date Event Section
              const Text(
                'Tuesday, September 29',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 8),

              // Event Card
              InkWell(
                onTap: () => context.push('/task-actions/location-detail'),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFDEDEE2)),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFF123332),
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF123332),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Layla, Omar · 10:00 am · in iPhone Calendar',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF5A5F6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Legend
              Row(
                children: [
                  _buildLegendItem(const Color(0xFF2E6B4F), 'Done'),
                  const SizedBox(width: 14),
                  _buildLegendItem(const Color(0xFFCA292E), 'Today'),
                  const SizedBox(width: 14),
                  _buildLegendItem(const Color(0xFF123332), 'Planned'),
                ],
              ),
              const SizedBox(height: 16),
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
            fontSize: 12,
            color: Color(0xFF5A5F6B),
          ),
        ),
      ],
    );
  }
}
