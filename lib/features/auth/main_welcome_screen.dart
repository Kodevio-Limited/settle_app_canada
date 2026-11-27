import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import '../auth/auth_provider.dart';
import '../debug/debug_menu.dart';

class MainWelcomeScreen extends ConsumerStatefulWidget {
  const MainWelcomeScreen({super.key});

  @override
  ConsumerState<MainWelcomeScreen> createState() => _MainWelcomeScreenState();
}

class _MainWelcomeScreenState extends ConsumerState<MainWelcomeScreen> {
  String _selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final illustrationMaxH = (constraints.maxHeight * 0.34).clamp(180.0, 300.0);
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: (constraints.maxHeight - 32).clamp(0.0, double.infinity),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top language switcher pill (long-press opens Debug Presets)
                    GestureDetector(
                      onLongPress: () => DebugMenuSheet.show(context),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAEAEA),
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _langTab('English'),
                              _langTab('العربية'),
                              _langTab('Français'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Figma Family Illustration (long-press also opens Debug Presets)
                    GestureDetector(
                      onLongPress: () => DebugMenuSheet.show(context),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: illustrationMaxH),
                        child: Image.asset(
                          'assets/images/onboarding_family.png',
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => const SizedBox(
                            height: 180,
                            child: Center(
                              child: Icon(
                                Icons.family_restroom_rounded,
                                size: 96,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Headline & Subtitle
                    Column(
                      children: [
                        const Text(
                          'Settle in Canada,\none clear step at a time.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                            height: 1.32,
                            color: AppColors.mainFont,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Your personal guide to the next steps for you and your family in Canada.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTypography.fontHeading,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.4,
                              color: AppColors.dark300,
                            ),
                          ),
                        ),
                        if (_selectedLang == 'العربية') ...[
                          const SizedBox(height: 8),
                          Text(
                            'استقرّ في كندا، خطوة واضحة في كل مرة',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: AppTypography.arabic(
                              fontSize: 16,
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Bottom Actions
                    Column(
                      children: [
                        SettleButton(
                          label: 'Get started',
                          onPressed: () => context.push('/sign-up'),
                        ),
                        const SizedBox(height: 12),
                        FigmaSoftOutlineButton(
                          label: 'I already have an account',
                          onPressed: () => context.push('/sign-in'),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            ref.read(authProvider.notifier).setGuest();
                            context.push('/guest-home');
                          },
                          child: const Text(
                            'Explore without an account',
                            style: TextStyle(
                              fontFamily: AppTypography.fontHeading,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Independent guide by Experiaco. Not affiliated with the Government of Canada.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 11,
                            color: AppColors.dark300,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _langTab(String lang) {
    final isSelected = _selectedLang == lang;
    return GestureDetector(
      onTap: () => setState(() => _selectedLang = lang),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white500 : Colors.transparent,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Text(
          lang,
          style: TextStyle(
            fontFamily:
                lang == 'العربية' ? AppTypography.fontArabic : AppTypography.fontBody,
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            color: isSelected ? AppColors.secondary : AppColors.dark300,
          ),
        ),
      ),
    );
  }
}
