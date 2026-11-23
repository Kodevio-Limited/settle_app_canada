import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trusted help',
                      style: const TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF123332),
                        letterSpacing: -0.6,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Danger / Crisis Card
                    InkWell(
                      onTap: () => context.push('/crisis'),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8E1C21),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.phone_outlined,
                              size: 24,
                              color: Colors.white,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'In danger? Call 911',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Crisis and support lines, 24/7',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFFF6D5D6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Section 1: Free newcomer services
                    const Text(
                      'Free newcomer services near you',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Government-funded. Who can use them depends on your status — they'll tell you.",
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: Color(0xFF5A5F6B),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildServiceItem(
                      title: 'Newcomer Centre of Peel',
                      subtitle: 'Settlement agency · [distance]',
                      onTap: () => context.push('/nearby'),
                    ),
                    const SizedBox(height: 8),
                    _buildServiceItem(
                      title: 'Peel Multicultural Council',
                      subtitle: 'Settlement agency · [distance]',
                      onTap: () => context.push('/nearby'),
                    ),
                    const SizedBox(height: 8),
                    _buildServiceItem(
                      title: '211 Ontario',
                      subtitle: 'Housing, food, community help · call or text 211',
                      onTap: () => context.push('/nearby'),
                    ),
                    const SizedBox(height: 20),

                    // Section 2: Questions about your own case
                    const Text(
                      'Questions about your own case',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Only licensed professionals can advise on immigration or legal matters.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: Color(0xFF5A5F6B),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                      ),
                      child: Column(
                        children: [
                          _buildLinkRow(
                            'Licensed immigration consultants (CICC)',
                            showBorder: true,
                            onTap: () => context.push('/help/how-guidance'),
                          ),
                          _buildLinkRow(
                            'Lawyers & paralegals (Law Society)',
                            showBorder: true,
                            onTap: () => context.push('/help/how-guidance'),
                          ),
                          _buildLinkRow(
                            'Community legal clinics',
                            showBorder: false,
                            onTap: () => context.push('/help/how-guidance'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Standalone Bottom Navigation Bar
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
                  _buildBottomItem(context, 'Help', _helpSvg, true, '/help'),
                  _buildBottomItem(context, 'Me', _meSvg, false, '/profile'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFDEDEE2)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
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
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: Color(0xFF7A7A83),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkRow(
    String title, {
    required bool showBorder,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(bottom: BorderSide(color: Color(0xFFEAEAEC)))
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF123332),
                ),
              ),
            ),
            const Text(
              '↗',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF123332),
              ),
            ),
          ],
        ),
      ),
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
