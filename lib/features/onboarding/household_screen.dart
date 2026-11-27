import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/user_profile.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
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
                      stepLabel: 'Step 4 of 5',
                      progress: 0.8,
                      onBack: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/status');
                        }
                      },
                      onSkip: () => context.push('/priorities'),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      "Who's settling with you?",
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
                      "Each person gets their own tasks, so nobody's steps get lost.",
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.4,
                        color: AppColors.dark300,
                      ),
                    ),
                    const SizedBox(height: 22),
                    ...state.members.map((member) {
                      final isSelf = member.relationship == 'self';
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 74),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 14),
                          decoration: BoxDecoration(
                            color: AppColors.white500,
                            borderRadius: BorderRadius.circular(11),
                            border: isSelf
                                ? Border.all(color: AppColors.primary, width: 1.0)
                                : null,
                            boxShadow: isSelf ? kFigmaSelectedGlow : null,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            member.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontFamily: AppTypography.fontBody,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ),
                                        if (isSelf)
                                          const Text(
                                            ' (you)',
                                            style: TextStyle(
                                              fontFamily: AppTypography.fontBody,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _subtitleFor(member),
                                      style: const TextStyle(
                                        fontFamily: AppTypography.fontBody,
                                        fontSize: 13,
                                        color: AppColors.dark300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => _onEdit(context, member),
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/edit_square.svg',
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 6),
                                      const Text(
                                        'Edit',
                                        style: TextStyle(
                                          fontFamily: AppTypography.fontBody,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        FigmaDashedActionPill(
                          label: '+ Child',
                          onTap: () => context.push('/add-child'),
                        ),
                        FigmaDashedActionPill(
                          label: '+ Partner',
                          onTap: () => context.push('/add-adult?type=Partner or spouse'),
                        ),
                        FigmaDashedActionPill(
                          label: '+ Parent or other',
                          onTap: () => context.push('/add-adult?type=Parent'),
                        ),
                        FigmaDashedActionPill(
                          label: '+ Adult child',
                          onTap: () => context.push('/add-student'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          height: 1.45,
                          color: AppColors.dark300,
                        ),
                        children: [
                          const TextSpan(
                            text:
                                'We only ask a nickname and an age range — never a birthdate. ',
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
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
              child: SettleButton(
                label: 'Continue',
                onPressed: () => context.push('/priorities'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
