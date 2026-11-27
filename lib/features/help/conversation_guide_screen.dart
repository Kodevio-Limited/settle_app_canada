import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class ConversationGuideScreen extends StatefulWidget {
  const ConversationGuideScreen({super.key});

  @override
  State<ConversationGuideScreen> createState() =>
      _ConversationGuideScreenState();
}

class _ConversationGuideScreenState extends State<ConversationGuideScreen> {
  String _selectedLang = 'English';

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
              // Header with Figma back + pill language toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FigmaCircleBackButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/member-child');
                      }
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.dark50,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () =>
                              setState(() => _selectedLang = 'English'),
                          borderRadius: BorderRadius.circular(999),
                          child: Container(
                            height: 34,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: _selectedLang == 'English'
                                ? BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(999),
                                  )
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              'English',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 13,
                                fontWeight: _selectedLang == 'English'
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: _selectedLang == 'English'
                                    ? AppColors.primary
                                    : AppColors.dark300,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => setState(() => _selectedLang = 'Arabic'),
                          borderRadius: BorderRadius.circular(999),
                          child: Container(
                            height: 34,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: _selectedLang == 'Arabic'
                                ? BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(999),
                                  )
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              'العربية',
                              style: TextStyle(
                                fontFamily: AppTypography.fontArabic,
                                fontSize: 13,
                                fontWeight: _selectedLang == 'Arabic'
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: _selectedLang == 'Arabic'
                                    ? AppColors.primary
                                    : AppColors.dark300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Text(
                'FOR PARENTS OF TEENS · 5 MIN READ',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 6),

              const Text(
                'Talking with your teen about the move',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  height: 1.12,
                  letterSpacing: -0.6,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                'Teens often lose the most in a move — friends, routines, being good at things. Short, low-pressure talks help more than one big conversation.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14.5,
                  height: 1.5,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 18),

              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Try asking, in the car or over food',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _buildQuoteRow(
                      "What's one thing you miss, and one thing you're curious about here?",
                    ),
                    const SizedBox(height: 12),
                    _buildQuoteRow(
                      'Who at school do you sit with at lunch?',
                    ),
                    const SizedBox(height: 12),
                    _buildQuoteRow(
                      "What's something here that surprised you?",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              FigmaNoticeBanner(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "If you're worried",
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Talk to your teen's school guidance counsellor or your family doctor. If you think they're in danger, call 911 or Kids Help Phone.",
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        height: 1.45,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () => context.push('/crisis'),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'See support lines',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Center(
                child: Text(
                  'General parenting information, not professional advice. Reviewed by [settlement or youth-support partner].',
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

  Widget _buildQuoteRow(String text) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Color(0xFFCA292E),
            width: 3,
          ),
        ),
      ),
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        '"$text"',
        style: const TextStyle(
          fontFamily: AppTypography.fontBody,
          fontSize: 14.5,
          height: 1.45,
          color: AppColors.mainFont,
        ),
      ),
    );
  }
}
