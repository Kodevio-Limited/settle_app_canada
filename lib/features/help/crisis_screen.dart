import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class CrisisScreen extends StatelessWidget {
  const CrisisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Close and Leave Quickly
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
                          context.go('/help');
                        }
                      },
                      borderRadius: BorderRadius.circular(22),
                      child: const SizedBox(
                        width: 44,
                        height: 44,
                        child: Center(
                          child: Icon(
                            Icons.close_rounded,
                            size: 24,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // "Leave quickly" clears nav stack and navigates to safe neutral screen (/home)
                      context.go('/home');
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF123332),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Leave quickly',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              Text(
                'Get help now',
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Showing lines for Ontario · free · work without internet in the app',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 16),

              // 911 Emergency Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF8E1C21),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 72,
                      child: Text(
                        '911',
                        style: TextStyle(
                          fontFamily: AppTypography.fontHeading,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Emergency',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Police, fire, ambulance',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFFF6D5D6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // 988 Suicide Crisis Helpline
              _buildNumberCard(
                number: '988',
                title: 'Suicide Crisis Helpline',
                subtitle: 'Call or text, 24/7',
              ),
              const SizedBox(height: 10),

              // 211 Ontario
              _buildNumberCard(
                number: '211',
                title: '211 Ontario',
                subtitle: 'Shelter, food, urgent community help',
              ),
              const SizedBox(height: 10),

              // Kids Help Phone
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kids Help Phone',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1-800-668-6868 · text CONNECT to 686868',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Assaulted Women's Helpline
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assaulted Women's Helpline",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1-866-863-0511 · many languages',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Footer Note
              const Center(
                child: Text(
                  '"Leave quickly" closes this screen and opens a neutral page. Numbers to be re-verified before each release.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.45,
                    color: Color(0xFF5A5F6B),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberCard({
    required String number,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDEDEE2)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            child: Text(
              number,
              style: const TextStyle(
                fontFamily: AppTypography.fontHeading,
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF123332),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
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
    );
  }
}
