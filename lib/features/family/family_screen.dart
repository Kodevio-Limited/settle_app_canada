import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class FamilyMemberInfo {
  final String initial;
  final String name;
  final String role;
  final int progressPercent;
  final Color avatarColor;
  final String? avatarAsset;
  final String route;
  final bool hasBorder;

  const FamilyMemberInfo({
    required this.initial,
    required this.name,
    required this.role,
    required this.progressPercent,
    required this.avatarColor,
    this.avatarAsset,
    required this.route,
    this.hasBorder = false,
  });
}

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});

  static const List<FamilyMemberInfo> members = [
    FamilyMemberInfo(
      initial: 'L',
      name: 'Layla',
      role: 'You · 9 tasks',
      progressPercent: 33,
      avatarColor: Color(0xFF123332),
      avatarAsset: 'assets/images/avatar_layla.png',
      route: '/settings',
    ),
    FamilyMemberInfo(
      initial: 'O',
      name: 'Omar',
      role: 'Partner · 10 tasks',
      progressPercent: 20,
      avatarColor: Color(0xFF2E6B4F),
      avatarAsset: 'assets/images/avatar_omar.png',
      route: '/family/member-adult',
    ),
    FamilyMemberInfo(
      initial: 'Y',
      name: 'Yasmin',
      role: '18–21 · 9 tasks',
      progressPercent: 0,
      avatarColor: Color(0xFF4A6FA5),
      route: '/family/member-student',
    ),
    FamilyMemberInfo(
      initial: 'S',
      name: 'Sami',
      role: '6–9 · 4 tasks',
      progressPercent: 0,
      avatarColor: Color(0xFFCA292E),
      route: '/family/member-child',
    ),
    FamilyMemberInfo(
      initial: 'N',
      name: 'Nour',
      role: '12–14 · 5 tasks',
      progressPercent: 0,
      avatarColor: Color(0xFF6B4C8A),
      route: '/family/member-child',
      hasBorder: true,
    ),
  ];

  static const String _homeSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <path d="M3 10.5 12 3l9 7.5V20a1 1 0 0 1-1 1h-5v-6h-6v6H4a1 1 0 0 1-1-1z"></path>
</svg>''';

  static const String _journeySvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <circle cx="6" cy="19" r="2"></circle>
  <circle cx="18" cy="5" r="2"></circle>
  <path d="M8 19h8a3 3 0 0 0 0-6H8a3 3 0 0 1 0-6h8"></path>
</svg>''';

  static const String _exploreSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <circle cx="12" cy="12" r="9"></circle>
  <path d="M15.5 8.5l-2 5-5 2 2-5z"></path>
</svg>''';

  static const String _helpSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <circle cx="12" cy="12" r="9"></circle>
  <circle cx="12" cy="12" r="3.5"></circle>
  <path d="M5.6 5.6l3.9 3.9M14.5 14.5l3.9 3.9M18.4 5.6l-3.9 3.9M9.5 14.5l-3.9 3.9"></path>
</svg>''';

  static const String _meFilledSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
  <circle cx="12" cy="8" r="4"></circle>
  <path d="M4 21c0-4.4 3.6-8 8-8s8 3.6 8 8Z"></path>
</svg>''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Figma Top Header with Back and Add button
                    FigmaSubPageHeader(
                      title: 'Family',
                      onBack: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/settings');
                        }
                      },
                      trailing: FigmaCircleActionButton(
                        icon: const Icon(
                          Icons.add_rounded,
                          size: 22,
                          color: AppColors.primary,
                        ),
                        tooltip: 'Add family member',
                        onPressed: () => context.push('/onboarding/add-adult'),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "5 people · everyone's steps in one place",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13.5,
                        color: AppColors.dark300,
                      ),
                    ),
                    const SizedBox(height: 18),

                    // 3-column members grid
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final cardWidth = (constraints.maxWidth - 20) / 3;
                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: members.map((m) {
                            return SizedBox(
                              width: cardWidth,
                              child: InkWell(
                                onTap: () => context.pushSafe(m.route),
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: m.hasBorder
                                        ? Border.all(
                                            color: AppColors.primary,
                                            width: 1.5,
                                          )
                                        : null,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (m.avatarAsset != null)
                                        Container(
                                          width: 44,
                                          height: 44,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.dark50,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.asset(
                                            m.avatarAsset!,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      else
                                        Container(
                                          width: 44,
                                          height: 44,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: m.avatarColor,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            m.initial,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      const SizedBox(height: 10),
                                      Text(
                                        m.name,
                                        style: const TextStyle(
                                          fontFamily: AppTypography.fontBody,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.mainFont,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        m.role,
                                        style: const TextStyle(
                                          fontFamily: AppTypography.fontBody,
                                          fontSize: 11.5,
                                          color: AppColors.dark300,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 10),
                                      // Crisp Progress bar
                                      Container(
                                        height: 6,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(999),
                                          color: AppColors.dark50,
                                        ),
                                        child: FractionallySizedBox(
                                          alignment: Alignment.centerLeft,
                                          widthFactor: m.progressPercent > 0
                                              ? m.progressPercent / 100.0
                                              : 0.0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(999),
                                              color: const Color(0xFF28C740),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Shared household tasks header & card
                    const Text(
                      'Shared household tasks · 6',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    const SizedBox(height: 10),
                    FigmaSurfaceCard(
                      radius: 16,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSharedTaskRow(
                            'Ontario health cards',
                            'Everyone',
                          ),
                          const SizedBox(height: 10),
                          _buildSharedTaskRow(
                            'Sign a lease & know tenant rights',
                            'Layla, Omar',
                          ),
                          const SizedBox(height: 10),
                          _buildSharedTaskRow(
                            'Set up utilities & internet',
                            'Household',
                          ),
                          const SizedBox(height: 14),
                          InkWell(
                            onTap: () => context.go('/journey'),
                            child: const Text(
                              'See all shared tasks',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    FigmaDashedWideButton(
                      label: 'Add New member',
                      leadingIcon: Icons.add_rounded,
                      onTap: () => context.push('/onboarding/add-adult'),
                    ),
                    const SizedBox(height: 14),

                    const FigmaNoticeBanner(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      child: Text(
                        "Only you see this household. Other adults can have their own private account — nobody needs anyone else's permission to use the app.",
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          height: 1.45,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom nav bar matching BottomNavScaffold Figma spec
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 12,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                top: 8,
                bottom: MediaQuery.paddingOf(context).bottom > 0
                    ? MediaQuery.paddingOf(context).bottom + 4
                    : 14,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomItem(context, 'Home', _homeSvg, false, '/home'),
                  _buildBottomItem(
                    context,
                    'Journey',
                    _journeySvg,
                    false,
                    '/journey',
                  ),
                  _buildBottomItem(
                    context,
                    'Explore',
                    _exploreSvg,
                    false,
                    '/explore',
                  ),
                  _buildBottomItem(context, 'Help', _helpSvg, false, '/help'),
                  _buildBottomItem(
                    context,
                    'Me',
                    _meFilledSvg,
                    true,
                    '/settings',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSharedTaskRow(String title, String assigned) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 14,
              color: AppColors.mainFont,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          assigned,
          style: const TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 13,
            color: AppColors.dark200,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomItem(
    BuildContext context,
    String label,
    String svgSource,
    bool isActive,
    String route,
  ) {
    final color = isActive ? AppColors.primary : AppColors.dark200;
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: const BoxConstraints(minWidth: 54, minHeight: 46),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(
              svgSource,
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 11,
                height: 1.1,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
