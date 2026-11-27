import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Layla');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _goBack() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/settings');
    }
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
              FigmaSubPageHeader(
                title: 'Profile',
                onBack: _goBack,
                trailing: TextButton(
                  onPressed: _goBack,
                  child: Text(
                    'Save',
                    style: AppTypography.body2Bold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What should we call you?',
                        style: AppTypography.body2Bold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.white50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.border),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: TextField(
                          controller: _nameController,
                          style: AppTypography.body2.copyWith(
                            color: AppColors.primary,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Email',
                        style: AppTypography.body2Bold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.dark50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hidden by Apple (private relay)',
                          style: AppTypography.body2.copyWith(
                            color: AppColors.dark300,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Signed in with Apple. Manage it in iPhone Settings → Apple ID.',
                        style: AppTypography.caption1.copyWith(
                          color: AppColors.dark200,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Sign-in method',
                        style: AppTypography.body2Bold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      FigmaSurfaceCard(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Apple',
                                style: AppTypography.body2.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            Text(
                              'Connected',
                              style: AppTypography.caption1.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.success,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      FigmaSurfaceCard(
                        onTap: () => context.push('/language-access'),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Language',
                              style: AppTypography.body2.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              'English ›',
                              style: AppTypography.body2.copyWith(
                                color: AppColors.dark200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: Text(
                          'Your household answers are edited in My plan, not here.',
                          style: AppTypography.caption1.copyWith(
                            height: 1.45,
                            color: AppColors.dark200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
