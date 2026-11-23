import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class FamilyMemberInfo {
  final String initial;
  final String name;
  final String role;
  final int progressPercent;
  final Color avatarColor;
  final String route;
  final bool hasBorder;

  const FamilyMemberInfo({
    required this.initial,
    required this.name,
    required this.role,
    required this.progressPercent,
    required this.avatarColor,
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
      route: '/profile',
    ),
    FamilyMemberInfo(
      initial: 'O',
      name: 'Omar',
      role: 'Partner · 10 tasks',
      progressPercent: 20,
      avatarColor: Color(0xFF2E6B4F),
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

  static const String _meSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <circle cx="12" cy="8" r="4"></circle>
  <path d="M4 21c0-4.4 3.6-8 8-8s8 3.6 8 8"></path>
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button to Settings/Me
                    Row(
                      children: [
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
                      ],
                    ),

                    // Header row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Family',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontHeading,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF123332),
                                  letterSpacing: -0.6,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "5 people · everyone's steps in one place",
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 14,
                                  color: Color(0xFF5A5F6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => context.push('/onboarding/add-adult'),
                          borderRadius: BorderRadius.circular(22),
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF123332),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // 3-column members grid
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final cardWidth = (constraints.maxWidth - 16) / 3;
                        return Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: members.map((m) {
                            return SizedBox(
                              width: cardWidth,
                              child: InkWell(
                                onTap: () => context.push(m.route),
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: m.hasBorder
                                          ? const Color(0xFF123332)
                                          : const Color(0xFFDEDEE2),
                                      width: m.hasBorder ? 2 : 1,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 38,
                                        height: 38,
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
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        m.name,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF123332),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        m.role,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF5A5F6B),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 6),
                                      // Progress bar
                                      Container(
                                        height: 5,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: const Color(0xFFDEDEE2),
                                        ),
                                        child: FractionallySizedBox(
                                          alignment: Alignment.centerLeft,
                                          widthFactor: m.progressPercent > 0
                                              ? m.progressPercent / 100.0
                                              : 0.0,
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
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    // Shared household tasks section
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
                            'Shared household tasks · 6',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF123332),
                            ),
                          ),
                          const SizedBox(height: 10),
                          _buildSharedTaskRow('Ontario health cards', 'Everyone'),
                          const SizedBox(height: 8),
                          _buildSharedTaskRow('Sign a lease & know tenant rights', 'Layla, Omar'),
                          const SizedBox(height: 8),
                          _buildSharedTaskRow('Set up utilities & internet', 'Household'),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () => context.go('/journey'),
                            child: const Text(
                              'See all shared tasks',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF123332),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Notice box
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2ECEB),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Text(
                        "Only you see this household. Other adults can have their own private account — nobody needs anyone else's permission to use the app.",
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.45,
                          color: Color(0xFF123332),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom nav bar
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFDEDEE2), width: 1),
                ),
              ),
              padding: EdgeInsets.only(
                top: 6,
                bottom: MediaQuery.paddingOf(context).bottom > 0
                    ? MediaQuery.paddingOf(context).bottom + 4
                    : 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomItem(context, 'Home', _homeSvg, false, '/home'),
                  _buildBottomItem(context, 'Journey', _journeySvg, false, '/journey'),
                  _buildBottomItem(context, 'Explore', _exploreSvg, false, '/explore'),
                  _buildBottomItem(context, 'Help', _helpSvg, false, '/help'),
                  _buildBottomItem(context, 'Me', _meSvg, true, '/profile'),
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
              fontSize: 14,
              color: Color(0xFF123332),
            ),
          ),
        ),
        Text(
          assigned,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF5A5F6B),
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
    final color = isActive ? const Color(0xFF123332) : const Color(0xFF5A5F6B);
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        constraints: const BoxConstraints(minWidth: 54, minHeight: 48),
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
            const SizedBox(height: 2),
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
