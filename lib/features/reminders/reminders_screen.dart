import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              // Segmented Tabs: Upcoming (Active) / Calendar
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6E6E9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
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
                          'Upcoming',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () =>
                            context.pushReplacement('/reminders/calendar'),
                        borderRadius: BorderRadius.circular(9),
                        child: Container(
                          height: 38,
                          alignment: Alignment.center,
                          child: const Text(
                            'Calendar',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3B4747),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // TODAY Section
              _buildSectionHeader('Today', const Color(0xFFA82227)),
              const SizedBox(height: 8),
              _buildReminderCard(
                barColor: const Color(0xFFCA292E),
                title: 'Gather documents for SIN',
                subtitle: 'Layla, Omar · 1 of 3 ready',
                onTap: () => context.push('/checklists'),
              ),
              const SizedBox(height: 16),

              // TOMORROW Section
              _buildSectionHeader('Tomorrow', const Color(0xFF5A5F6B)),
              const SizedBox(height: 8),
              _buildReminderCard(
                barColor: const Color(0xFF123332),
                title: 'Visit Service Canada',
                subtitle: 'Mississauga centre · 2.1 km · you planned this',
                onTap: () => context.push('/task-actions/location-detail'),
              ),
              const SizedBox(height: 16),

              // THIS WEEK Section
              _buildSectionHeader('This week', const Color(0xFF5A5F6B)),
              const SizedBox(height: 8),
              _buildReminderCard(
                barColor: const Color(0xFF123332),
                title: 'Book school registration',
                subtitle: 'Sami, Nour',
                onTap: () => context.push('/family/member-child'),
              ),
              const SizedBox(height: 8),
              _buildReminderCard(
                barColor: const Color(0xFF123332),
                title: 'Health cards at ServiceOntario',
                subtitle: 'Everyone',
                onTap: () => context.push('/checklists'),
              ),
              const SizedBox(height: 16),

              // LATER Section
              _buildSectionHeader('Later', const Color(0xFF5A5F6B)),
              const SizedBox(height: 8),
              _buildReminderCard(
                barColor: const Color(0xFF8A8A93),
                title: 'Your first Canadian tax return',
                subtitle: "Spring 2027 · we'll remind you in time",
                onTap: () => context.go('/journey'),
              ),
              const SizedBox(height: 28),

              // Footer Quiet hours
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Quiet hours 9 pm – 8 am · ',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF5A5F6B),
                      ),
                    ),
                    InkWell(
                      onTap: () => context.push('/reminders/settings'),
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF123332),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: color,
      ),
    );
  }

  Widget _buildReminderCard({
    required Color barColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
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
                  color: barColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
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
    );
  }
}
