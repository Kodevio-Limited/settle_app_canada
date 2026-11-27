import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/user_profile.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class AddAdultScreen extends ConsumerStatefulWidget {
  final String initialType;
  const AddAdultScreen({super.key, this.initialType = 'Partner or spouse'});

  @override
  ConsumerState<AddAdultScreen> createState() => _AddAdultScreenState();
}

class _AddAdultScreenState extends ConsumerState<AddAdultScreen> {
  static const bool _isDemo = bool.fromEnvironment('DEMO', defaultValue: false);
  late final TextEditingController _nameController;
  late String _relationship;
  String _arrival = 'With me';
  bool _lookForWork = true;
  bool _plansToDrive = true;
  late final TextEditingController _professionController;
  bool _sameStatusAsMe = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _isDemo ? 'Omar' : '');
    _professionController =
        TextEditingController(text: _isDemo ? 'Civil engineer' : '');
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
    final name =
        _nameController.text.trim().isEmpty ? 'Omar' : _nameController.text.trim();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FigmaSheetHandle(),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          FigmaCircleBackButton(
                            onPressed: () {
                              if (context.canPop()) {
                                context.pop();
                              } else {
                                context.go('/household');
                              }
                            },
                          ),
                          const Expanded(
                            child: Text(
                              'Add an adult',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTypography.fontHeading,
                                fontWeight: FontWeight.w500,
                                fontSize: 23,
                                color: AppColors.mainFont,
                              ),
                            ),
                          ),
                          const SizedBox(width: 50),
                        ],
                      ),
                      const SizedBox(height: 22),
                      const FigmaInputLabel('Who are they to you?', fontSize: 16),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children:
                            ['Partner or spouse', 'Parent', 'Adult child', 'Other adult']
                                .map((rel) {
                          return FigmaChoiceChip(
                            label: rel,
                            isSelected: _relationship == rel,
                            onTap: () => setState(() => _relationship = rel),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),
                      const FigmaInputLabel('Name or nickname', fontSize: 16),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _nameController,
                        onChanged: (_) => setState(() {}),
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 16,
                          color: AppColors.mainFont,
                        ),
                        decoration: figmaPillInputDecoration(hintText: 'e.g. Omar'),
                      ),
                      const SizedBox(height: 18),
                      const FigmaInputLabel('Arriving', fontSize: 16),
                      const SizedBox(height: 10),
                      Row(
                        children: ['With me', 'Later — pick month'].map((arr) {
                          final isLast = arr == 'Later — pick month';
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: isLast ? 0 : 10),
                              child: FigmaChoiceChip(
                                label: arr,
                                isSelected: _arrival == arr,
                                onTap: () => setState(() => _arrival = arr),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),
                      const FigmaInputLabel('Profession', fontSize: 16),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _professionController,
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 16,
                          color: AppColors.mainFont,
                        ),
                        decoration: figmaPillInputDecoration(
                            hintText: 'e.g. Civil engineer'),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "If it needs a licence here, we'll show which one.",
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 12.5,
                          color: AppColors.dark300,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const FigmaInputLabel(
                        'So we show the right tasks',
                        trailingHint: '(all optional)',
                        fontSize: 16,
                      ),
                      const SizedBox(height: 6),
                      FigmaCheckRow(
                        label: 'Will look for work',
                        value: _lookForWork,
                        onTap: () => setState(() => _lookForWork = !_lookForWork),
                      ),
                      FigmaCheckRow(
                        label: 'Plans to drive',
                        value: _plansToDrive,
                        onTap: () =>
                            setState(() => _plansToDrive = !_plansToDrive),
                      ),
                      FigmaCheckRow(
                        label: 'Same status as me',
                        value: _sameStatusAsMe,
                        onTap: () =>
                            setState(() => _sameStatusAsMe = !_sameStatusAsMe),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
                child: SettleButton(
                  label: 'Add $name',
                  onPressed: () {
                    ref.read(onboardingProvider.notifier).addMember(
                          HouseholdMember(
                            id: 'adult_${DateTime.now().millisecondsSinceEpoch}',
                            name: name,
                            relationship: _relationship == 'Partner or spouse'
                                ? 'partner'
                                : 'adult',
                            age: 36,
                            profession: _professionController.text.trim(),
                          ),
                        );
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/household');
                    }
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
