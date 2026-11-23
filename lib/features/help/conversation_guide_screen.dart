import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class ConversationGuideScreen extends StatefulWidget {
  const ConversationGuideScreen({super.key});

  @override
  State<ConversationGuideScreen> createState() => _ConversationGuideScreenState();
}

class _ConversationGuideScreenState extends State<ConversationGuideScreen> {
  String _selectedLang = 'English';

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
                          context.go('/member-child');
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

                  // Language Switcher Toggle
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6E6E9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => setState(() => _selectedLang = 'English'),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 34,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: _selectedLang == 'English'
                                ? BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  )
                                : null,
                            alignment: Alignment.center,
                            child: const Text(
                              'English',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF123332),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => setState(() => _selectedLang = 'Arabic'),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 34,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: _selectedLang == 'Arabic'
                                ? BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  )
                                : null,
                            alignment: Alignment.center,
                            child: const Text(
                              'العربية',
                              style: TextStyle(
                                fontFamily: AppTypography.fontArabic,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF3B4747),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // Eyebrow
              const Text(
                'FOR PARENTS OF TEENS · 5 MIN READ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: Color(0xFFA82227),
                ),
              ),
              const SizedBox(height: 4),

              // Title
              Text(
                'Talking with your teen about the move',
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                  letterSpacing: -0.6,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 8),

              // Paragraph
              const Text(
                'Teens often lose the most in a move — friends, routines, being good at things. Short, low-pressure talks help more than one big conversation.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 16),

              // Card: Try asking
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
                      'Try asking, in the car or over food',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildQuoteRow("What's one thing you miss, and one thing you're curious about here?"),
                    const SizedBox(height: 10),
                    _buildQuoteRow("Who at school do you sit with at lunch?"),
                    const SizedBox(height: 10),
                    _buildQuoteRow("What's something here that surprised you?"),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Card: If you're worried
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
                      "If you're worried",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Talk to your teen's school guidance counsellor or your family doctor. If you think they're in danger, call 911 or Kids Help Phone.",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.45,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => context.push('/crisis'),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'See support lines',
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
              const SizedBox(height: 24),

              // Footer Note
              const Center(
                child: Text(
                  'General parenting information, not professional advice. Reviewed by [settlement or youth-support partner].',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.45,
                    color: Color(0xFF5A5F6B),
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
          fontSize: 15,
          height: 1.45,
          color: Color(0xFF123332),
        ),
      ),
    );
  }
}
