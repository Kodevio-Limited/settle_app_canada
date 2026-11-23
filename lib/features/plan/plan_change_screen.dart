import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class PlanChangeScreen extends StatelessWidget {
  const PlanChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Eyebrow
              const Text(
                'YOUR PLAN CHANGED',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: Color(0xFFA82227),
                ),
              ),
              const SizedBox(height: 6),

              // Title
              Text(
                'You moved from Mississauga to Brampton',
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                  letterSpacing: -0.6,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 6),

              // Subtitle
              const Text(
                "Here's what we updated, and why.",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 18),

              // + 3 added Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '+ 3 added',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2E6B4F),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildTaskItem(
                      'Update your address with the CRA',
                      'Benefits and tax mail go to your new home',
                    ),
                    const SizedBox(height: 8),
                    _buildTaskItem(
                      'Update address on health cards & licence',
                      'Ontario asks for address changes to be reported',
                    ),
                    const SizedBox(height: 8),
                    _buildTaskItem(
                      'Get a Brampton Library card',
                      'Your new local library',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // - 1 removed Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '− 1 removed',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFA3261C),
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get a Mississauga Library card',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xFF5A5F6B),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'No longer your local library',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF5A5F6B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Unchanged Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2ECEB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Unchanged',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'School steps stay the same — both cities are in Peel Region. Nearby offices now show around Brampton.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.45,
                        color: Color(0xFF123332),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Action buttons
              InkWell(
                onTap: () => context.go('/home'),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF123332),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Looks right',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Center(
                child: InkWell(
                  onTap: () => context.push('/onboarding/destination'),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Something's wrong — edit my answers",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF123332),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskItem(String title, String subtitle) {
    return Column(
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
    );
  }
}
