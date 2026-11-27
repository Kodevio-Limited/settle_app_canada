import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class BottomNavScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavScaffold({
    super.key,
    required this.navigationShell,
  });

  static const String _homeOutlineSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <path d="M3 10.5 12 3l9 7.5V20a1 1 0 0 1-1 1h-5v-6h-6v6H4a1 1 0 0 1-1-1z"></path>
</svg>''';

  static const String _homeFilledSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
  <path d="M11.37 3.22a1 1 0 0 1 1.26 0l8 6.5A1 1 0 0 1 21 10.5V20a1.5 1.5 0 0 1-1.5 1.5h-15A1.5 1.5 0 0 1 3 20v-9.5a1 1 0 0 1 .37-.78l8-6.5zM9 17a1 1 0 1 0 0 2h6a1 1 0 1 0 0-2H9z"/>
</svg>''';

  static const String _journeySvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round">
  <circle cx="6" cy="19" r="2.2"></circle>
  <circle cx="18" cy="5" r="2.2"></circle>
  <path d="M8.2 19h7.8a3 3 0 0 0 0-6H8a3 3 0 0 1 0-6h7.8"></path>
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

  static const String _meOutlineSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <circle cx="12" cy="8" r="4"></circle>
  <path d="M4 21c0-4.4 3.6-8 8-8s8 3.6 8 8"></path>
</svg>''';

  static const String _meFilledSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
  <circle cx="12" cy="7.5" r="4.2"/>
  <path d="M4.5 20.5c0-4.1 3.36-7 7.5-7s7.5 2.9 7.5 7a1 1 0 0 1-1 1h-13a1 1 0 0 1-1-1z"/>
</svg>''';

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.white500,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              offset: Offset(0, -2),
              blurRadius: 12,
            ),
          ],
        ),
        padding: EdgeInsets.only(
          top: 8,
          bottom: MediaQuery.paddingOf(context).bottom > 0
              ? MediaQuery.paddingOf(context).bottom + 4
              : 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              0,
              'Home',
              currentIndex == 0 ? _homeFilledSvg : _homeOutlineSvg,
              currentIndex == 0,
            ),
            _buildNavItem(1, 'Journey', _journeySvg, currentIndex == 1),
            _buildNavItem(2, 'Explore', _exploreSvg, currentIndex == 2),
            _buildNavItem(3, 'Help', _helpSvg, currentIndex == 3),
            _buildNavItem(
              4,
              'Me',
              currentIndex == 4 ? _meFilledSvg : _meOutlineSvg,
              currentIndex == 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      int index, String label, String svgSource, bool isActive) {
    final color = isActive ? AppColors.primary : AppColors.dark200;

    return InkWell(
      onTap: () => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      ),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        constraints: const BoxConstraints(minWidth: 54, minHeight: 48),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(
              svgSource,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 11,
                height: 1.15,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive ? AppColors.primary : AppColors.dark300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
