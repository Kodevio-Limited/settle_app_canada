import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class OnboardingPrioritiesScreen extends ConsumerStatefulWidget {
  const OnboardingPrioritiesScreen({super.key});

  @override
  ConsumerState<OnboardingPrioritiesScreen> createState() =>
      _OnboardingPrioritiesScreenState();
}

class _OnboardingPrioritiesScreenState
    extends ConsumerState<OnboardingPrioritiesScreen> {
  final List<String> _priorities = [
    'Paperwork & IDs',
    'Finding a home',
    "Kids' school",
    'Driving',
    'Insurance',
    'Health coverage',
    'Money & banking',
    'Finding work',
    'Feeling at home',
  ];

  late Set<String> _selected;
  bool _stepByStep = true;

  @override
  void initState() {
    super.initState();
    _selected = {'Paperwork & IDs', 'Finding a home', "Kids' school"};
  }

  void _toggle(String p) {
    setState(() {
      if (_selected.contains(p)) {
        _selected.remove(p);
      } else {
        if (_selected.length < 3) {
          _selected.add(p);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: AppColors.primary,
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Step 5 of 5',
          style: TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5A5F6B),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFDEDEE2),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'What matters most right now?',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  height: 1.1,
                  letterSpacing: -0.6,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Pick up to 3. We'll put these first — everything else stays in your plan.",
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 15,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 18),
              // Priorities chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _priorities.map((item) {
                  final isSel = _selected.contains(item);
                  return InkWell(
                    onTap: () => _toggle(item),
                    borderRadius: BorderRadius.circular(23),
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: isSel ? const Color(0xFFE2ECEB) : Colors.white,
                        borderRadius: BorderRadius.circular(23),
                        border: Border.all(
                          color: isSel ? AppColors.primary : const Color(0xFFC8C8CE),
                          width: isSel ? 2.0 : 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isSel ? Icons.check_box : Icons.check_box_outline_blank,
                            size: 18,
                            color: isSel ? AppColors.primary : const Color(0xFF5A5F6B),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item,
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              fontWeight: isSel ? FontWeight.w600 : FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              // Fieldset: How would you like to go?
              const Text(
                'How would you like to go?',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              _paceOption(
                title: 'Step by step',
                subtitle: 'Show me 3 things at a time',
                isSelected: _stepByStep,
                onTap: () => setState(() => _stepByStep = true),
              ),
              const SizedBox(height: 8),
              _paceOption(
                title: 'Everything',
                subtitle: 'Show the whole plan at once',
                isSelected: !_stepByStep,
                onTap: () => setState(() => _stepByStep = false),
              ),
              const SizedBox(height: 28),
              SettleButton(
                label: 'Build my plan',
                onPressed: () {
                  ref.read(onboardingProvider.notifier).setDisplayMode(_stepByStep);
                  context.push('/plan-ready');
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paceOption({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEAF2F1) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFDEDEE2),
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? AppColors.primary : const Color(0xFF5A5F6B),
              size: 22,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 14,
                    color: Color(0xFF3B4747),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
