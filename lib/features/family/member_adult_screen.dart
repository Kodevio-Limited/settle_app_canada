import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class MemberAdultScreen extends StatelessWidget {
  const MemberAdultScreen({super.key});

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
                      color: Color(0xFF2E6B4F),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'O',
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
                          'Omar',
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF123332),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Partner · looking for work · drives',
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
              const SizedBox(height: 14),

              // Progress bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '2 of 10 tasks done',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF5A5F6B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: const Color(0xFFDEDEE2),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xFF2E6B4F),
                        ),
                      ),
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
                      title: 'Apply for your SIN',
                      isLast: false,
                      onTap: () => context.push('/tasks/sin'),
                    ),
                    _buildTaskItem(
                      category: 'Car & driving',
                      title: 'Exchange or start your licence',
                      isLast: false,
                      onTap: () => context.push('/tasks/licence'),
                    ),
                    _buildTaskItem(
                      category: 'Work',
                      title: 'Connect with employment services',
                      isLast: false,
                      onTap: () => context.push('/tasks/work'),
                    ),
                    _buildTaskItem(
                      category: 'Work · licence',
                      title: 'Get licensed as an engineer (P.Eng.)',
                      isLast: true,
                      onTap: () => context.push('/occupations/pathway'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Invite card
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2ECEB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Invite Omar to his own account',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Optional. He'll see his own tasks and the household's shared ones. Neither of you sees the other's check-ins or private notes.",
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invite link copied to clipboard')),
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
                          'Send an invite link',
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

              // Remove member link
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => context.push('/family/remove-member?name=Omar'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Remove Omar from household',
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
    required String title,
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
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: Color(0xFFA82227),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
