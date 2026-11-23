import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class HowGuidanceScreen extends StatelessWidget {
  const HowGuidanceScreen({super.key});

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
              // Back button
              Transform.translate(
                offset: const Offset(-10, 0),
                child: InkWell(
                  onTap: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/profile');
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
              const SizedBox(height: 4),

              Text(
                "How Settle's guidance works",
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF123332),
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 16),

              // Item 1
              _buildStepCard(
                stepNumber: '1',
                title: 'From official sources',
                description:
                    'Every step links to the government or service page it comes from, with the date our team last checked it.',
                isAlert: false,
              ),
              const SizedBox(height: 12),

              // Item 2
              _buildStepCard(
                stepNumber: '2',
                title: 'Personalized by clear rules',
                description:
                    'Your plan comes from your answers using written rules, not AI. Each task shows why you\'re seeing it.',
                isAlert: false,
              ),
              const SizedBox(height: 12),

              // Item 3
              _buildStepCard(
                stepNumber: '3',
                title: 'What Settle is not',
                description:
                    'Not the government. Not immigration, legal, tax, insurance or medical advice. We never submit anything for you.',
                isAlert: false,
              ),
              const SizedBox(height: 12),

              // Item 4 (Alert Card)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E4E5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '4',
                        style: TextStyle(
                          color: Color(0xFFA82227),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'When to get a professional',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5C1518),
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 14,
                                height: 1.45,
                                color: Color(0xFF5C1518),
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      'Anything about your own immigration case, a legal dispute or your health. ',
                                ),
                                WidgetSpan(
                                  child: InkWell(
                                    onTap: () => context.push('/help'),
                                    child: const Text(
                                      'Find qualified help',
                                      style: TextStyle(
                                        color: Color(0xFF8E1C21),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                                const TextSpan(text: '.'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Footer Note & Support contact
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Settle is made by Experiaco in Mississauga, Ontario.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF5A5F6B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Support email: support@settleapp.ca')),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Contact support · [support email]',
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard({
    required String stepNumber,
    required String title,
    required String description,
    required bool isAlert,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDEDEE2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE2ECEB),
            ),
            alignment: Alignment.center,
            child: Text(
              stepNumber,
              style: const TextStyle(
                color: Color(0xFF123332),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
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
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF123332),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.45,
                    color: Color(0xFF3B4747),
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
