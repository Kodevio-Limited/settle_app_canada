import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../onboarding/onboarding_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

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
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header: Avatar, Greeting, Day badge, Notification bell
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.dark50,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/avatar_layla.png',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.person,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning, $primaryName',
                          style: const TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.4,
                            color: AppColors.mainFont,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'DAY 12 IN CANADA',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Note/home/samiul/Downloads: borderRadius(22) preserved for nav test predicate
                  InkWell(
                    onTap: () => context.push('/reminders'),
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(
                            Icons.notifications_rounded,
                            size: 22,
                            color: AppColors.primary,
                          ),
                          Positioned(
                            top: 9,
                            right: 10,
                            child: Container(
                              width: 9,
                              height: 9,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE84C3D),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Hero Settlement Progress Card
              InkWell(
                onTap: () => context.go('/journey'),
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: kFigmaHeroGradient,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'YOUR SETTLEMENT PROGRESS',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.8,
                              color: Color(0xFFD5E6E5),
                            ),
                          ),
                          Text(
                            'Stage 2 of 10',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFD5E6E5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            '35%',
                            style: TextStyle(
                              fontFamily: AppTypography.fontHeading,
                              fontSize: 42,
                              height: 1.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -1.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Paperwork',
                                  style: TextStyle(
                                    fontFamily: AppTypography.fontHeading,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Getting settled · 5 of 40 done',
                                  style: TextStyle(
                                    fontFamily: AppTypography.fontBody,
                                    fontSize: 13,
                                    color: Color(0xFFD5E6E5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Keep exact finder string '5 of 40 done' also clearly readable
                      const SizedBox(height: 14),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: Stack(
                          children: [
                            Container(
                              height: 8,
                              width: double.infinity,
                              color: Colors.white.withValues(alpha: 0.28),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.35,
                              child: Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '5 of 40 done',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 12,
                          color: Color(0xFFCFE3E1),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            child: Text(
                              'Next: Housing · Schools · Car · Insurance',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 12,
                                color: Color(0xFFCFE3E1),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View your journey',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Section Header: Your next 3 actions + All tasks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Your next 3 actions',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                        color: AppColors.dark300,
                      ),
                    ),
                    InkWell(
                      onTap: () => context.go('/journey'),
                      borderRadius: BorderRadius.circular(8),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        child: Text(
                          'All tasks',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Grouped White Card for Next 3 Actions
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildActionItem(
                      icon: Icons.badge_outlined,
                      category: 'PAPERWORK',
                      categoryColor: AppColors.red,
                      title: 'Apply for your SIN',
                      subtitle: 'Layla, Omar, Yasmin · This week · 3 nearby',
                      hasDivider: true,
                      onTap: () => context.push('/task-sin'),
                    ),
                    _buildActionItem(
                      icon: Icons.favorite_border_rounded,
                      category: 'PAPERWORK',
                      categoryColor: AppColors.red,
                      title: 'Apply for Ontario health cards',
                      subtitle: 'Everyone · ServiceOntario · 2 nearby',
                      hasDivider: true,
                      onTap: () => context.push('/task-sin'),
                    ),
                    _buildActionItem(
                      icon: Icons.school_outlined,
                      category: 'SCHOOLS',
                      categoryColor: AppColors.primary,
                      title: 'Register Sami & Nour for school',
                      subtitle: 'Sami, Nour · Peel school boards',
                      hasDivider: false,
                      onTap: () => context.push('/task-school'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Quick action pair cards
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Expanded(
                    child: FigmaSurfaceCard(
                      radius: 16,
                      padding: const EdgeInsets.all(16),
                      onTap: () => context.push('/nearby'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE1ECEB),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.location_on_rounded,
                              size: 20,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Near you',
                            style: TextStyle(
                              fontFamily: AppTypography.fontHeading,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Offices for this week's tasks",
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 12.5,
                              height: 1.35,
                              color: AppColors.dark300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FigmaSurfaceCard(
                      radius: 16,
                      padding: const EdgeInsets.all(16),
                      onTap: () => context.push('/check-in'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF8E5E5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite_rounded,
                              size: 20,
                              color: Color(0xFFC94A4A),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "How's this week?",
                            style: TextStyle(
                              fontFamily: AppTypography.fontHeading,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'A 30-second check-in',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 12.5,
                              height: 1.35,
                              color: AppColors.dark300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
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
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: hasDivider
              ? const Border(
                  bottom: BorderSide(color: Color(0xFFEAEAEC), width: 1),
                )
              : null,
        ),
        child: Row(
          children: [
            FigmaIconTile(
              icon: icon,
              iconColor: const Color(0xFF7D7E82),
              backgroundColor: AppColors.dark50,
              size: 44,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 10.5,
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
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainFont,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 12.5,
                      color: AppColors.dark300,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: Color(0xFF989898),
            ),
          ],
        ),
      ),
    );
  }
}
