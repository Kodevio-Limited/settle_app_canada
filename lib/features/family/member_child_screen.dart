import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class MemberChildScreen extends StatelessWidget {
  const MemberChildScreen({super.key});

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
                          context.go('/family');
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
                    onTap: () => context.push('/onboarding/add-child'),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Edit',
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
              const SizedBox(height: 4),

              // Avatar & Profile Info
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF6B4C8A),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'N',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Nour',
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF123332),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '12–14 · Secondary school · English support: yes',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF5A5F6B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Tasks Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Column(
                  children: [
                    _buildTaskItem(
                      category: 'Schools · Next',
                      categoryColor: const Color(0xFF123332),
                      title: 'Register with your school board',
                      subtitle: 'Peel District or Dufferin-Peel Catholic',
                      isLast: false,
                      onTap: () => context.push('/tasks/school'),
                    ),
                    _buildTaskItem(
                      category: 'Schools',
                      categoryColor: const Color(0xFF123332),
                      title: 'Check school immunization records',
                      subtitle: 'Peel Public Health · records you already have',
                      isLast: false,
                      onTap: () => context.push('/tasks/immunization'),
                    ),
                    _buildTaskItem(
                      category: 'Schools',
                      categoryColor: const Color(0xFF123332),
                      title: 'English language support assessment',
                      subtitle: 'Arranged by the school board',
                      isLast: false,
                      onTap: () => context.push('/tasks/esl'),
                    ),
                    _buildTaskItem(
                      category: 'Paperwork · shared',
                      categoryColor: const Color(0xFFA82227),
                      title: 'Ontario health card',
                      subtitle: 'Done together with the family',
                      isLast: true,
                      onTap: () => context.push('/tasks/sin'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Nearby link card
              InkWell(
                onTap: () => context.push('/task-actions/nearby'),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2ECEB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 24,
                        color: Color(0xFF123332),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Newcomer school registration near you',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF123332),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'School board offices · 3.4 km',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF3B4747),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 20,
                        color: Color(0xFF123332),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Conversation Guide link card
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7E4E5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Talking with Nour about the move',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF123332),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'A short conversation guide for parents of teens',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF5C1518),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 20,
                        color: Color(0xFFA82227),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Footer row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Stored: nickname and age range only.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF5A5F6B),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => context.push('/family/remove-member?name=Nour'),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Remove Nour',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA3261C),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskItem({
    required String category,
    required Color categoryColor,
    required String title,
    required String subtitle,
    required bool isLast,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(
                  bottom: BorderSide(color: Color(0xFFEAEAEC)),
                ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFABABB3), width: 2),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: categoryColor,
                    ),
                  ),
                  const SizedBox(height: 2),
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
    );
  }
}
