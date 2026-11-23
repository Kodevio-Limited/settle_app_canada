import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                    const Text(
                      'Me',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF123332),
                        letterSpacing: -0.6,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // User Profile Card
                    InkWell(
                      onTap: () => context.push('/edit-profile'),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFDEDEE2)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF123332),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'L',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Layla',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF123332),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Signed in with Apple · private relay email',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF5A5F6B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // My Family Card
                    InkWell(
                      onTap: () => context.push('/family'),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2ECEB),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.people_alt_outlined,
                              size: 24,
                              color: Color(0xFF123332),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'My family',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF123332),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "5 people · each person's tasks and progress",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF3B4747),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 20,
                              color: Color(0xFF7A7A83),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Section: MY PLAN
                    _buildSectionHeader('My plan'),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildNavRow(
                            'Edit my answers',
                            trailingText: 'Mississauga · PR',
                            showBorder: true,
                            onTap: () => context.push('/onboarding/destination'),
                          ),
                          _buildNavRow(
                            'Family members',
                            trailingText: '5',
                            showBorder: true,
                            onTap: () => context.push('/family'),
                          ),
                          _buildNavRow(
                            'Something changed?',
                            trailingText: 'Move, job, baby…',
                            showBorder: false,
                            onTap: () => context.push('/life-event'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Section: APP
                    _buildSectionHeader('App'),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildNavRow(
                            'Reminders & quiet hours',
                            trailingText: 'On',
                            showBorder: true,
                            onTap: () => context.push('/notification-settings'),
                          ),
                          _buildNavRow(
                            'Language & accessibility',
                            trailingText: 'English',
                            showBorder: true,
                            onTap: () => context.push('/language-access'),
                          ),
                          _buildNavRow(
                            'Privacy & my data',
                            trailingText: '›',
                            showBorder: false,
                            onTap: () => context.push('/privacy-data'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Section: ABOUT
                    _buildSectionHeader('About'),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildNavRow(
                            'How our guidance works',
                            trailingText: '›',
                            showBorder: true,
                            onTap: () => context.push('/how-guidance'),
                          ),
                          _buildNavRow(
                            'Terms & Privacy Policy',
                            trailingText: '›',
                            showBorder: false,
                            onTap: () => context.push('/privacy-policy'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Bottom Links: Sign Out & Pause/Delete
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => context.push('/sign-out-confirm'),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Sign out',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF123332),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => context.push('/deactivate'),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Pause or delete account',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFA3261C),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 6),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: Color(0xFF5A5F6B),
        ),
      ),
    );
  }

  Widget _buildNavRow(
    String label, {
    required String trailingText,
    required bool showBorder,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
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
                label,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF123332),
                ),
              ),
            ),
            Text(
              trailingText,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF5A5F6B),
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
