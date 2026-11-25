import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/user_profile.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class OnboardingHouseholdScreen extends ConsumerWidget {
  const OnboardingHouseholdScreen({super.key});

  String _subtitleFor(HouseholdMember m) {
    if (m.relationship == 'self') return 'Adult';
    if (m.relationship == 'partner') return 'Partner · Adult';
    if (m.relationship == 'adultChild') return 'Adult child · 18–21 · University';
    if (m.name == 'Sami') return 'Child · 6–9 · Elementary school';
    if (m.name == 'Nour') return 'Child · 12–14 · Secondary school';
    if (m.relationship == 'child') {
      if (m.age <= 5) return 'Child · Under 6 · Childcare';
      if (m.age <= 11) return 'Child · 6–11 · Elementary school';
      return 'Child · 12–17 · Secondary school';
    }
    return 'Adult';
  }

  void _onEdit(BuildContext context, HouseholdMember m) {
    if (m.relationship == 'self') {
      context.push('/edit-profile');
    } else if (m.relationship == 'partner') {
      context.push('/add-adult?type=Partner or spouse');
    } else if (m.relationship == 'adultChild') {
      context.push('/add-student');
    } else {
      context.push('/add-child');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);

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
              context.go('/status');
            }
          },
        ),
        title: const Text(
          'Step 4 of 5',
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
            onPressed: () => context.push('/priorities'),
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
              // Progress bar
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFDEDEE2),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.8,
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
                "Who's settling with you?",
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
                "Each person gets their own tasks, so nobody's steps get lost.",
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 15,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 18),
              // Members list
              ...state.members.map((member) {
                final isSelf = member.relationship == 'self';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.white50,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFDEDEE2)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEAF2F1),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            member.name.isNotEmpty ? member.name[0] : '?',
                            style: const TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    member.name,
                                    style: const TextStyle(
                                      fontFamily: AppTypography.fontBody,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  if (isSelf)
                                    const Text(
                                      ' (you)',
                                      style: TextStyle(
                                        fontFamily: AppTypography.fontBody,
                                        fontSize: 13,
                                        color: Color(0xFF5A5F6B),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _subtitleFor(member),
                                style: const TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 13,
                                  color: Color(0xFF5A5F6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => _onEdit(context, member),
                          borderRadius: BorderRadius.circular(6),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 12),
              // Add Member Buttons
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _actionChip(
                    context,
                    '+ Partner',
                    () => context.push('/add-adult?type=Partner or spouse'),
                  ),
                  _actionChip(
                    context,
                    '+ Child',
                    () => context.push('/add-child'),
                  ),
                  _actionChip(
                    context,
                    '+ Parent or other',
                    () => context.push('/add-adult?type=Parent'),
                  ),
                  _actionChip(
                    context,
                    '+ Adult child',
                    () => context.push('/add-student'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Preserved pre-continue text from Household.dc.html
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    height: 1.45,
                    color: Color(0xFF5A5F6B),
                  ),
                  children: [
                    const TextSpan(
                      text: 'We only ask a nickname and an age range — never a birthdate. ',
                    ),
                    TextSpan(
                      text: '+ Adult child',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push('/add-student'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SettleButton(
                label: 'Continue',
                onPressed: () => context.push('/priorities'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionChip(BuildContext context, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: AppColors.primary,
            style: BorderStyle.solid,
          ),
          color: Colors.transparent,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
