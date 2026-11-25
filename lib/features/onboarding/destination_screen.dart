import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
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
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: AppColors.primary,
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/stage');
            }
          },
        ),
        title: const Text(
          'Step 2 of 5',
          style: TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5A5F6B),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => context.push('/status'),
            child: const Text('Skip', style: AppTypography.body2Bold),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar: 40%
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFDEDEE2),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Where are you settling?',
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
                "Rules and offices differ by province and city. We'll show the ones that apply to you.",
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 15,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 16),
              // Field 1: Province or territory
              const Text(
                'Province or territory',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFC8C8CE)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _province,
                    isExpanded: true,
                    items: ['Ontario', 'British Columbia', 'Alberta', 'Quebec', 'Other…']
                        .map((it) => DropdownMenuItem(
                              value: it,
                              child: Text(
                                it,
                                style: const TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 16,
                                  color: AppColors.primary,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (v) => setState(() => _province = v ?? _province),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Field 2: City or region
              const Text(
                'City or region',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _cityController,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 16,
                  color: AppColors.primary,
                ),
                decoration: InputDecoration(
                  hintText: 'e.g. Mississauga (Peel Region)',
                  hintStyle: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 16,
                    color: Color(0xFF8A8A93),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFC8C8CE)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFC8C8CE)),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Field 3: When did you arrive? Month is enough
              const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  children: [
                    TextSpan(text: 'When did you arrive? '),
                    TextSpan(
                      text: 'Month is enough',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF5A5F6B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _arrivalController,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 16,
                  color: AppColors.primary,
                ),
                decoration: InputDecoration(
                  hintText: 'e.g. Mississauga (Peel Region)',
                  hintStyle: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 16,
                    color: Color(0xFF8A8A93),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFC8C8CE)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFC8C8CE)),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Field 4: Everyone arrived together switch
              InkWell(
                onTap: () => setState(() => _everyoneTogether = !_everyoneTogether),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFDEDEE2)),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Everyone arrived together',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 15,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      Switch(
                        value: _everyoneTogether,
                        activeColor: const Color(0xFF2E6B4F),
                        onChanged: (val) => setState(() => _everyoneTogether = val),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Field 5: Informational banner
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2ECEB),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: AppColors.primary, size: 20),
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
              const SizedBox(height: 28),
              SettleButton(
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
