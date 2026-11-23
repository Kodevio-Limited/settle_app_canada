import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class MemberStudentScreen extends StatelessWidget {
  const MemberStudentScreen({super.key});

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
                    onTap: () => context.push('/onboarding/add-adult'),
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
                      color: Color(0xFF4A6FA5),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Y',
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
                          'Yasmin',
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF123332),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Adult child · 18–21 · planning university',
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
                      category: 'Paperwork · Next',
                      categoryColor: const Color(0xFFA82227),
                      title: 'Apply for her own SIN',
                      isLast: false,
                      onTap: () => context.push('/tasks/sin'),
                    ),
                    _buildTaskItem(
                      category: 'University stream',
                      categoryColor: const Color(0xFF123332),
                      title: 'Apply to university or college',
                      isLast: false,
                      onTap: () => context.push('/stages/stage-university'),
                    ),
                    _buildTaskItem(
                      category: 'University stream',
                      categoryColor: const Color(0xFF123332),
                      title: 'Apply for OSAP',
                      tag: 'Needs her SIN',
                      isLast: false,
                      onTap: () => context.push('/stages/stage-university'),
                    ),
                    _buildTaskItem(
                      category: 'Paperwork · shared',
                      categoryColor: const Color(0xFFA82227),
                      title: 'Ontario health card',
                      isLast: true,
                      onTap: () => context.push('/checklists'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // University stream link card
              InkWell(
                onTap: () => context.push('/stages/stage-university'),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2ECEB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Her university & college stream',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF123332),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '6 steps · 3 campuses nearby',
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
              const SizedBox(height: 14),

              // Yasmin is an adult card
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Yasmin is an adult',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'She can have her own private Settle account. Her check-ins and notes stay hers.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invite link copied for Yasmin')),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 46,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF123332),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Send Yasmin an invite',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Remove link
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => context.push('/family/remove-member?name=Yasmin'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Remove Yasmin',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFA3261C),
                      ),
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

  Widget _buildTaskItem({
    required String category,
    required Color categoryColor,
    required String title,
    String? tag,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFABABB3), width: 2),
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
                  if (tag != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      tag,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFA82227),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
