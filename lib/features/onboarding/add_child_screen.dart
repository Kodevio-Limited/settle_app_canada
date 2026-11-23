import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/user_profile.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class AddChildScreen extends ConsumerStatefulWidget {
  const AddChildScreen({super.key});

  @override
  ConsumerState<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends ConsumerState<AddChildScreen> {
  final _nameController = TextEditingController(text: 'Nour');
  String _ageGroup = '12–14';
  String _needs = 'School';
  String _schoolRecordsReady = 'Some';
  String _englishSupport = 'Not sure';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = _nameController.text.trim().isEmpty ? 'child' : _nameController.text.trim();

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
                'Add a child',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 14),
              // Nickname
              const Text(
                'Nickname',
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
                  hintText: 'e.g. Nour',
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
              // Filter heading 1: Age range
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
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['Under 4', '4–5', '6–9', '10–11', '12–14', '15–17'].map((ag) {
                  final isSel = _ageGroup == ag;
                  return _filterChip(ag, isSel, () => setState(() => _ageGroup = ag));
                }).toList(),
              ),
              const SizedBox(height: 14),
              // Filter heading 2: Needs
              const Text(
                'Needs',
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
                children: ['School', 'Childcare', 'Neither'].map((nd) {
                  final isSel = _needs == nd;
                  return _filterChip(nd, isSel, () => setState(() => _needs = nd));
                }).toList(),
              ),
              const SizedBox(height: 14),
              // Filter heading 3: Are school records ready?
              const Text(
                'Are school records ready?',
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
                children: ['Yes', 'Some', 'Not yet'].map((rec) {
                  final isSel = _schoolRecordsReady == rec;
                  return _filterChip(rec, isSel, () => setState(() => _schoolRecordsReady = rec));
                }).toList(),
              ),
              const SizedBox(height: 14),
              // Filter heading 4: Might English support help?
              const Text(
                'Might English support help?',
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
                children: ['Yes', 'No', 'Not sure'].map((es) {
                  final isSel = _englishSupport == es;
                  return _filterChip(es, isSel, () => setState(() => _englishSupport = es));
                }).toList(),
              ),
              const SizedBox(height: 16),
              // Explanatory note
              const Text(
                'No birthdate, no medical details. Just enough to show the right school steps.',
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
                          id: 'child_${DateTime.now().millisecondsSinceEpoch}',
                          name: name,
                          relationship: 'child',
                          age: _ageGroup == 'Under 4'
                              ? 3
                              : _ageGroup == '4–5'
                                  ? 5
                                  : _ageGroup == '6–9'
                                      ? 8
                                      : _ageGroup == '10–11'
                                          ? 11
                                          : _ageGroup == '12–14'
                                              ? 13
                                              : 16,
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            fontSize: 15,
            fontWeight: isSel ? FontWeight.w600 : FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
