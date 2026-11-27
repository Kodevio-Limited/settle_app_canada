import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class CrisisScreen extends StatelessWidget {
  const CrisisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with Close Circle Button & Leave Quickly Pill
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FigmaCircleActionButton(
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 22,
                      color: AppColors.mainFont,
                    ),
                    tooltip: 'Close',
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/help');
                      }
                    },
                  ),
                  InkWell(
                    onTap: () => context.go('/home'),
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Leave quickly',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          color: Colors.white,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Text(
                'Get help now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.6,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Showing lines for Ontario · free · work without internet in the app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13.5,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 18),

              // 911 Emergency Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 72,
                      child: Text(
                        '911',
                        style: TextStyle(
                          fontFamily: AppTypography.fontHeading,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
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
                              fontFamily: AppTypography.fontBody,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Police, fire, ambulance',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
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

              _buildNumberCard(
                number: '988',
                title: 'Suicide Crisis Helpline',
                subtitle: 'Call or text, 24/7',
              ),
              const SizedBox(height: 10),

              _buildNumberCard(
                number: '211',
                title: '211 Ontario',
                subtitle: 'Shelter, food, urgent community help',
              ),
              const SizedBox(height: 10),

              const FigmaSurfaceCard(
                radius: 16,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kids Help Phone',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1-800-668-6868 · text CONNECT to 686868',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13.5,
                        color: AppColors.dark300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              const FigmaSurfaceCard(
                radius: 16,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assaulted Women's Helpline",
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1-866-863-0511 · many languages',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13.5,
                        color: AppColors.dark300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Center(
                child: Text(
                  '"Leave quickly" closes this screen and opens a neutral page. Numbers to be re-verified before each release.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 12,
                    height: 1.45,
                    color: AppColors.dark300,
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
    return FigmaSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            child: Text(
              number,
              style: const TextStyle(
                fontFamily: AppTypography.fontHeading,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.mainFont,
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
                    fontFamily: AppTypography.fontBody,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    color: AppColors.dark300,
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
