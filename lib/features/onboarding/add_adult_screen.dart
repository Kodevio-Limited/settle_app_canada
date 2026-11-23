import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/user_profile.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class AddAdultScreen extends ConsumerStatefulWidget {
  final String initialType;
  const AddAdultScreen({super.key, this.initialType = 'Partner or spouse'});

  @override
  ConsumerState<AddAdultScreen> createState() => _AddAdultScreenState();
}

class _AddAdultScreenState extends ConsumerState<AddAdultScreen> {
  final _nameController = TextEditingController(text: 'Omar');
  late String _relationship;
  String _arrival = 'With me';
  bool _lookForWork = true;
  bool _plansToDrive = true;
  final _professionController = TextEditingController(text: 'Civil engineer');
  bool _sameStatusAsMe = true;

  @override
  void initState() {
    super.initState();
    _relationship = widget.initialType;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _professionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = _nameController.text.trim().isEmpty ? 'adult' : _nameController.text.trim();

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
                'Add an adult',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 14),
              // Fieldset 1: Who are they to you?
              const Text(
                'Who are they to you?',
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
                children: ['Partner or spouse', 'Parent', 'Adult child', 'Other adult'].map((rel) {
                  final isSel = _relationship == rel;
                  return _filterChip(rel, isSel, () => setState(() => _relationship = rel));
                }).toList(),
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
                  hintText: 'e.g. Omar',
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
              // Fieldset 2: Arriving
              const Text(
                'Arriving',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: ['With me', 'Later — pick month'].map((arr) {
                  final isSel = _arrival == arr;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: _filterChip(arr, isSel, () => setState(() => _arrival = arr)),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              // Fieldset 3: So we show the right tasks (all optional)
              const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  children: [
                    TextSpan(text: 'So we show the right tasks '),
                    TextSpan(
                      text: '(all optional)',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF5A5F6B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Checkboxes
              _checkboxRow('Will look for work', _lookForWork, (v) => setState(() => _lookForWork = v ?? true)),
              _checkboxRow('Plans to drive', _plansToDrive, (v) => setState(() => _plansToDrive = v ?? true)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Text(
                      'Profession',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _professionController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xFFC8C8CE)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xFFC8C8CE)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 4.0, bottom: 4.0),
                child: Text(
                  "If it needs a licence here, we'll show which one.",
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 12,
                    color: Color(0xFF5A5F6B),
                  ),
                ),
              ),
              _checkboxRow('Same status as me', _sameStatusAsMe, (v) => setState(() => _sameStatusAsMe = v ?? true)),
              const SizedBox(height: 24),
              SettleButton(
                label: 'Add $name',
                onPressed: () {
                  ref.read(onboardingProvider.notifier).addMember(
                        HouseholdMember(
                          id: 'adult_${DateTime.now().millisecondsSinceEpoch}',
                          name: name,
                          relationship: _relationship == 'Partner or spouse' ? 'partner' : 'adult',
                          age: 36,
                          profession: _professionController.text.trim(),
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

  Widget _checkboxRow(String label, bool value, ValueChanged<bool?> onChanged) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Checkbox(
              value: value,
              activeColor: AppColors.primary,
              onChanged: onChanged,
            ),
            Text(
              label,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 15,
                color: AppColors.primary,
              ),
            ),
          ],
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
        padding: const EdgeInsets.symmetric(horizontal: 14),
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
