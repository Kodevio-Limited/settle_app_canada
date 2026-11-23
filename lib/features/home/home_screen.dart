import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../onboarding/onboarding_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const String _bellSvg = '''
<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <path d="M6 16V11a6 6 0 0 1 12 0v5l1.5 2h-15z"></path>
  <path d="M10 20a2 2 0 0 0 4 0"></path>
</svg>''';

  static const String _pinSvg = '''
<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#123332" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <path d="M12 21s-7-6.1-7-11.5A7 7 0 0 1 19 9.5C19 14.9 12 21 12 21z"></path>
  <circle cx="12" cy="9.5" r="2.5"></circle>
</svg>''';

  static const String _heartSvg = '''
<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#A82227" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <path d="M12 20s-7-4.4-7-10a4 4 0 0 1 7-2.6A4 4 0 0 1 19 10c0 5.6-7 10-7 10z"></path>
</svg>''';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingProvider);
    final primaryName = onboardingState.members.isNotEmpty
        ? onboardingState.members.first.name
        : 'Layla';

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'DAY 12 IN CANADA',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                            color: Color(0xFFA82227),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Good morning, $primaryName',
                          style: const TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.6,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      // Reminders
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Reminders (2 new)')),
                      );
                    },
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.string(
                            _bellSvg,
                            width: 22,
                            height: 22,
                            colorFilter: const ColorFilter.mode(
                              AppColors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 9,
                            child: Container(
                              width: 9,
                              height: 9,
                              decoration: BoxDecoration(
                                color: const Color(0xFFCA292E),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Section: Your next 3 actions
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Expanded(
                          child: Text(
                            'Your next 3 actions',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => context.go('/journey'),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              'All tasks',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    _buildActionItem(
                      context,
                      category: 'PAPERWORK',
                      categoryColor: const Color(0xFFA82227),
                      title: 'Apply for your SIN',
                      subtitle: 'Layla, Omar, Yasmin · This week · 3 nearby',
                      hasDivider: true,
                      onTap: () => context.push('/stages/2'),
                    ),
                    _buildActionItem(
                      context,
                      category: 'PAPERWORK',
                      categoryColor: const Color(0xFFA82227),
                      title: 'Apply for Ontario health cards',
                      subtitle: 'Everyone · ServiceOntario · 2 nearby',
                      hasDivider: true,
                      onTap: () => context.push('/stages/2'),
                    ),
                    _buildActionItem(
                      context,
                      category: 'SCHOOLS',
                      categoryColor: AppColors.primary,
                      title: 'Register Sami & Nour for school',
                      subtitle: 'Sami, Nour · Peel school boards',
                      hasDivider: false,
                      onTap: () => context.push('/stages/4'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Section: Stage card (Dark Teal)
              InkWell(
                onTap: () => context.go('/journey'),
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Stage 2 of 10',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13,
                              color: Color(0xFFCFE3E1),
                            ),
                          ),
                          Text(
                            '5 of 40 done',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13,
                              color: Color(0xFFCFE3E1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Paperwork',
                        style: TextStyle(
                          fontFamily: AppTypography.fontHeading,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // 10 segment progress bar
                      Row(
                        children: [
                          _buildSegment(const Color(0xFF7FC1A0)), // 1 Done
                          const SizedBox(width: 4),
                          _buildSegment(const Color(0xFFE8898C)), // 2 In progress
                          const SizedBox(width: 4),
                          _buildSegment(const Color(0xFF2B5251)), // 3
                          const SizedBox(width: 4),
                          _buildSegment(const Color(0xFF2B5251)), // 4
                          const SizedBox(width: 4),
                          _buildSegment(const Color(0xFF2B5251)), // 5
                          const SizedBox(width: 4),
                          _buildSegment(const Color(0xFF2B5251)), // 6
                          const SizedBox(width: 4),
                          _buildSegment(const Color(0xFF2B5251)), // 7
                          const SizedBox(width: 4),
                          _buildSegment(const Color(0xFF2B5251)), // 8
                          const SizedBox(width: 4),
                          _buildSegment(const Color(0xFF2B5251)), // 9
                          const SizedBox(width: 4),
                          _buildSegment(const Color(0xFF2B5251)), // 10
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Next: Housing · Schools · Car · Insurance',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          color: Color(0xFFCFE3E1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 2 Quick action cards
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Near you offices')),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFFDEDEE2)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.string(_pinSvg, width: 22, height: 22),
                            const SizedBox(height: 6),
                            const Text(
                              'Near you',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              "Offices for this week's tasks",
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 13,
                                height: 1.35,
                                color: Color(0xFF5A5F6B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("How's this week check-in")),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7E4E5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.string(_heartSvg, width: 22, height: 22),
                            const SizedBox(height: 6),
                            const Text(
                              "How's this week?",
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'A 30-second check-in',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 13,
                                height: 1.35,
                                color: Color(0xFF5C1518),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSegment(Color color) {
    return Expanded(
      child: Container(
        height: 6,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }

  Widget _buildActionItem(
    BuildContext context, {
    required String category,
    required Color categoryColor,
    required String title,
    required String subtitle,
    required bool hasDivider,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: hasDivider
              ? const Border(
                  bottom: BorderSide(color: Color(0xFFEAEAEC), width: 1),
                )
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
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
                    category,
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
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
                      fontFamily: AppTypography.fontBody,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13,
                      color: Color(0xFF5A5F6B),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: Color(0xFF7A7A83),
            ),
          ],
        ),
      ),
    );
  }
}
