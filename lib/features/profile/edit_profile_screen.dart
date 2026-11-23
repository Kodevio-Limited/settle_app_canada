import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/user_profile.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_decorations.dart';
import '../../core/theme/app_typography.dart';
import '../onboarding/onboarding_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    final self = ref.read(onboardingProvider).members.firstWhere(
          (m) => m.relationship == 'self',
          orElse: () => ref.read(onboardingProvider).members.first,
        );
    _nameController = TextEditingController(text: self.name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _save() {
    final self = ref.read(onboardingProvider).members.firstWhere(
          (m) => m.relationship == 'self',
          orElse: () => ref.read(onboardingProvider).members.first,
        );
    final updated = HouseholdMember(
      id: self.id,
      name: _nameController.text.trim().isEmpty ? self.name : _nameController.text.trim(),
      relationship: 'self',
      age: self.age,
      isStudent: self.isStudent,
      profession: self.profession,
    );
    ref.read(onboardingProvider.notifier).updateMember(updated);
    context.pop();
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
        actions: [
          TextButton(
            onPressed: _save,
            child: const Text('Save', style: AppTypography.body2Bold),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Profile', style: AppTypography.h3),
              const SizedBox(height: AppSpacing.s20),
              const Text('What should we call you?', style: AppTypography.body2Bold),
              const SizedBox(height: AppSpacing.s8),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white50,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: AppRadii.border13,
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: AppRadii.border13,
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.s20),
              const Text('Email', style: AppTypography.body2Bold),
              const SizedBox(height: AppSpacing.s8),
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEC),
                  borderRadius: AppRadii.border13,
                ),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Hidden by Apple (private relay)',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    color: Color(0xFF3B4747),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Signed in with Apple. Manage it in iPhone Settings → Apple ID.',
                style: AppTypography.caption2,
              ),
              const SizedBox(height: AppSpacing.s20),
              const Text('Sign-in method', style: AppTypography.body2Bold),
              const SizedBox(height: AppSpacing.s8),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.white50,
                  borderRadius: AppRadii.border13,
                  border: Border.all(color: AppColors.border),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text('Apple', style: AppTypography.body2),
                    ),
                    Text(
                      'Connected',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2E6B4F),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.s16),
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.white50,
                  borderRadius: AppRadii.border13,
                  border: Border.all(color: AppColors.border),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Language', style: AppTypography.body2),
                    Text('English ›', style: AppTypography.caption1),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.s32),
              const Text(
                'Your household answers are edited in My plan, not here.',
                style: AppTypography.caption2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
