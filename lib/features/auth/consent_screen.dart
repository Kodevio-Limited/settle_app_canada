import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'auth_provider.dart';

class ConsentScreen extends ConsumerStatefulWidget {
  const ConsentScreen({super.key});

  @override
  ConsumerState<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends ConsumerState<ConsentScreen> {
  bool _emailConsent = true;
  bool _answersConsent = true;
  bool _remindersEnabled = true;
  bool _locationEnabled = true;
  bool _analyticsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white600,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FigmaCircleBackButton(onPressed: () => context.pop()),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your privacy, in plain words',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w500,
                  fontSize: 31,
                  height: 1.25,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'You decide what to share. You can change any of this later in Settings.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 15,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 22),
              // Section 1: Needed to make your plan
              _cardSection(
                title: 'NEEDED TO MAKE YOUR PLAN',
                children: [
                  _switchRow(
                    text: 'Your email, to sign in',
                    value: _emailConsent,
                    enabled: true,
                    showDivider: true,
                    onChanged: (v) => setState(() => _emailConsent = v),
                  ),
                  _switchRow(
                    text: 'Answers you choose to give — stage,\ncity, household',
                    value: _answersConsent,
                    enabled: true,
                    showDivider: false,
                    onChanged: (v) => setState(() => _answersConsent = v),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Section 2: Optional
              _cardSection(
                title: 'OPTIONAL',
                children: [
                  _switchRow(
                    text: 'Reminders about your tasks',
                    value: _remindersEnabled,
                    enabled: true,
                    showDivider: true,
                    onChanged: (v) => setState(() => _remindersEnabled = v),
                  ),
                  _switchRow(
                    text: 'Show services near me, using\napproximate location',
                    value: _locationEnabled,
                    enabled: true,
                    showDivider: true,
                    onChanged: (v) => setState(() => _locationEnabled = v),
                  ),
                  _switchRow(
                    text: 'Help improve the app with\nanonymous usage stats',
                    value: _analyticsEnabled,
                    enabled: true,
                    showDivider: false,
                    onChanged: (v) => setState(() => _analyticsEnabled = v),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Section 3: We never collect
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.alertSurface,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'We never collect',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7A1A1E),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Document uploads or photos of ID · passport, UCI, SIN or file numbers · exact birthdates · medical records',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13.5,
                        height: 1.45,
                        color: Color(0xFF5C1518),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              SettleButton(
                label: 'Agree and continue',
                onPressed: () {
                  ref.read(authProvider.notifier).setConsent(true);
                  ref.read(authProvider.notifier).setNotifications(_remindersEnabled);
                  ref.read(authProvider.notifier).setLocation(_locationEnabled);
                  context.push('/notif-permission');
                },
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () => context.push('/privacy-policy'),
                  child: const Text(
                    'Read the full Privacy Policy',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardSection({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white500,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: AppColors.dark300,
            ),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }

  Widget _switchRow({
    required String text,
    required bool value,
    required bool enabled,
    required bool showDivider,
    ValueChanged<bool>? onChanged,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 14,
                    height: 1.35,
                    color: AppColors.mainFont,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: enabled && onChanged != null ? () => onChanged(!value) : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 50,
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: value ? AppColors.secondary : AppColors.white700,
                  ),
                  child: Align(
                    alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.divider,
          ),
      ],
    );
  }
}
