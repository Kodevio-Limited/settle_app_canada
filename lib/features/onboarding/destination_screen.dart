import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class OnboardingDestinationScreen extends ConsumerStatefulWidget {
  const OnboardingDestinationScreen({super.key});

  @override
  ConsumerState<OnboardingDestinationScreen> createState() =>
      _OnboardingDestinationScreenState();
}

class _OnboardingDestinationScreenState
    extends ConsumerState<OnboardingDestinationScreen> {
  static const bool _isDemo = bool.fromEnvironment('DEMO', defaultValue: false);
  String _province = 'Ontario';
  late final TextEditingController _cityController;
  late final TextEditingController _arrivalController;
  bool _everyoneTogether = true;

  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController(
      text: _isDemo ? 'Mississauga (Peel Region)' : '',
    );
    _arrivalController = TextEditingController(
      text: _isDemo ? 'September 2026' : '',
    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    _arrivalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                        stepLabel: 'Step 2 of 5',
                        progress: 0.4,
                        onBack: () {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.go('/stage');
                          }
                        },
                        onSkip: () => context.push('/status'),
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        'Where are you settling?',
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
                        "Rules and offices differ by province and city. We'll show the ones that apply to you.",
                        style: TextStyle(
                          fontFamily: AppTypography.fontHeading,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.4,
                          color: AppColors.dark300,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Field 1: Province or territory
                      const FigmaInputLabel('Province or territory'),
                      const SizedBox(height: 8),
                      Container(
                        height: 58,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          color: AppColors.dark50,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _province,
                            isExpanded: true,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.dark300,
                            ),
                            dropdownColor: AppColors.white500,
                            items: [
                              'Ontario',
                              'British Columbia',
                              'Alberta',
                              'Quebec',
                              'Other…',
                            ]
                                .map((it) => DropdownMenuItem(
                                      value: it,
                                      child: Text(
                                        it,
                                        style: const TextStyle(
                                          fontFamily: AppTypography.fontBody,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.mainFont,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (v) =>
                                setState(() => _province = v ?? _province),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Field 2: City or region
                      const FigmaInputLabel('City or region'),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _cityController,
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 16,
                          color: AppColors.mainFont,
                        ),
                        decoration: figmaPillInputDecoration(
                          hintText: 'e.g. Mississauga (Peel Region)',
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Field 3: When did you arrive?
                      const FigmaInputLabel(
                        'When did you arrive?',
                        trailingHint: 'Month is enough',
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _arrivalController,
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 16,
                          color: AppColors.mainFont,
                        ),
                        decoration: figmaPillInputDecoration(
                          hintText: 'e.g. September 2026',
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Field 4: Everyone arrived together switch card
                      InkWell(
                        onTap: () =>
                            setState(() => _everyoneTogether = !_everyoneTogether),
                        borderRadius: BorderRadius.circular(55),
                        child: Container(
                          height: 58,
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: BoxDecoration(
                            color: AppColors.white500,
                            borderRadius: BorderRadius.circular(55),
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Everyone arrived together',
                                  style: TextStyle(
                                    fontFamily: AppTypography.fontBody,
                                    fontSize: 16,
                                    color: AppColors.dark300,
                                  ),
                                ),
                              ),
                              Switch(
                                value: _everyoneTogether,
                                activeColor: AppColors.white500,
                                activeTrackColor: AppColors.secondary,
                                onChanged: (val) =>
                                    setState(() => _everyoneTogether = val),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Field 5: Informational banner
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.softTeal,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info_outline,
                                color: AppColors.primary, size: 20),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Most detailed today: Ontario, especially Peel and the GTA. Elsewhere you'll get federal steps now and local steps as we add them.",
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
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
                child: SettleButton(
                  label: 'Continue',
                  onPressed: () {
                    ref.read(onboardingProvider.notifier).setDestination(
                          province: _province,
                          city: _cityController.text.trim(),
                          arrivalMonth: _arrivalController.text.trim(),
                          everyoneTogether: _everyoneTogether,
                        );
                    context.push('/status');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
