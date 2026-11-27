import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FigmaOnboardingHeader(
                      stepLabel: 'Step 5 of 5',
                      progress: 1.0,
                      onBack: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/household');
                        }
                      },
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'What matters most right now?',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        height: 1.3,
                        color: AppColors.mainFont,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Pick up to 3. We'll put these first — everything else stays in your plan.",
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.4,
                        color: AppColors.dark300,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Wrap(
                      spacing: 8,
                      runSpacing: 12,
                      children: _priorities.map((item) {
                        final isSel = _selected.contains(item);
                        return FigmaChoiceChip(
                          label: item,
                          isSelected: isSel,
                          onTap: () => _toggle(item),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 28),
                    const FigmaInputLabel('How would you like to go?', fontSize: 16),
                    const SizedBox(height: 12),
                    FigmaPillOptionTile(
                      title: 'Step by step',
                      subtitle: 'Show me 3 things at a time',
                      isSelected: _stepByStep,
                      onTap: () => setState(() => _stepByStep = true),
                    ),
                    const SizedBox(height: 14),
                    FigmaPillOptionTile(
                      title: 'Everything',
                      subtitle: 'Show the whole plan at once',
                      isSelected: !_stepByStep,
                      onTap: () => setState(() => _stepByStep = false),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
              child: SettleButton(
                label: 'Build my plan',
                onPressed: () {
                  ref.read(onboardingProvider.notifier).setDisplayMode(_stepByStep);
                  context.push('/plan-ready');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
