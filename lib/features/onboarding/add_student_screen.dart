import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/user_profile.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class AddStudentScreen extends ConsumerStatefulWidget {
  const AddStudentScreen({super.key});

  @override
  ConsumerState<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends ConsumerState<AddStudentScreen> {
  final _nameController = TextEditingController(text: 'Yasmin');
  String _ageGroup = '18–21';
  String _studyLevel = 'University';
  String _admitStatus = 'Not yet';
  bool _sameStatusAsMe = true;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = _nameController.text.trim().isEmpty ? 'adult child' : _nameController.text.trim();

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: AppColors.primary, onPressed: () => context.pop()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add an adult child',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 14),
              // Name or nickname
              const Text(
                'Name or nickname',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _nameController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'e.g. Yasmin',
                  filled: true,
                  fillColor: AppColors.white50,
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
              // Age range
              const Text(
                'Age range',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: ['18–21', '22–25', '26+'].map((ag) {
                  final isSel = _ageGroup == ag;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: _filterChip(ag, isSel, () => setState(() => _ageGroup = ag)),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),
              // Studying in Canada?
              const Text(
                'Studying in Canada?',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['University', 'College', 'Not sure yet', 'Not studying'].map((ed) {
                  final isSel = _studyLevel == ed;
                  return _filterChip(ed, isSel, () => setState(() => _studyLevel = ed));
                }).toList(),
              ),
              const SizedBox(height: 14),
              // Where are they with applying?
              const Text(
                'Where are they with applying?',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: ['Accepted', 'Applying', 'Not yet'].map((as) {
                  final isSel = _admitStatus == as;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: _filterChip(as, isSel, () => setState(() => _admitStatus = as)),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),
              // Same status as me checkbox
              InkWell(
                onTap: () => setState(() => _sameStatusAsMe = !_sameStatusAsMe),
                child: Row(
                  children: [
                    Checkbox(
                      value: _sameStatusAsMe,
                      activeColor: AppColors.primary,
                      onChanged: (v) => setState(() => _sameStatusAsMe = v ?? true),
                    ),
                    const Text(
                      'Same status as me',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'On their own study permit? Their path is different — they should create their own Settle account.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12,
                  height: 1.45,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 24),
              SettleButton(
                label: 'Add $name',
                onPressed: () {
                  ref.read(onboardingProvider.notifier).addMember(
                        HouseholdMember(
                          id: 'student_${DateTime.now().millisecondsSinceEpoch}',
                          name: name,
                          relationship: 'adultChild',
                          age: _ageGroup == '18–21' ? 20 : _ageGroup == '22–25' ? 23 : 27,
                          isStudent: _studyLevel != 'Not studying',
                        ),
                      );
                  context.pop();
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterChip(String label, bool isSel, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSel ? const Color(0xFFE2ECEB) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSel ? AppColors.primary : const Color(0xFFC8C8CE),
            width: isSel ? 2.0 : 1.0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 14,
            fontWeight: isSel ? FontWeight.w600 : FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
