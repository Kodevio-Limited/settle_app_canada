import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/user_profile.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class AddChildScreen extends ConsumerStatefulWidget {
  const AddChildScreen({super.key});

  @override
  ConsumerState<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends ConsumerState<AddChildScreen> {
  static const bool _isDemo = bool.fromEnvironment('DEMO', defaultValue: false);
  late final TextEditingController _nameController;
  String _ageGroup = '12–14';
  String _needs = 'School';
  String _schoolRecordsReady = 'Some';
  String _englishSupport = 'Not sure';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _isDemo ? 'Nour' : '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name =
        _nameController.text.trim().isEmpty ? 'Nour' : _nameController.text.trim();

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
                              'Add a child',
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
                      const FigmaInputLabel('Nickname', fontSize: 16),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _nameController,
                        onChanged: (_) => setState(() {}),
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 16,
                          color: AppColors.mainFont,
                        ),
                        decoration: figmaPillInputDecoration(hintText: 'e.g. Nour'),
                      ),
                      const SizedBox(height: 18),
                      const FigmaInputLabel('Age range', fontSize: 16),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children:
                            ['Under 4', '4–5', '6–9', '10–11', '12–14', '15–17']
                                .map((ag) {
                          return FigmaChoiceChip(
                            label: ag,
                            isSelected: _ageGroup == ag,
                            onTap: () => setState(() => _ageGroup = ag),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),
                      const FigmaInputLabel('Needs', fontSize: 16),
                      const SizedBox(height: 10),
                      Row(
                        children: ['School', 'Childcare', 'Neither'].map((nd) {
                          final isLast = nd == 'Neither';
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: isLast ? 0 : 10),
                              child: FigmaChoiceChip(
                                label: nd,
                                isSelected: _needs == nd,
                                onTap: () => setState(() => _needs = nd),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),
                      const FigmaInputLabel('Are school records ready?', fontSize: 16),
                      const SizedBox(height: 10),
                      Row(
                        children: ['Yes', 'Some', 'Not yet'].map((rec) {
                          final isLast = rec == 'Not yet';
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: isLast ? 0 : 10),
                              child: FigmaChoiceChip(
                                label: rec,
                                isSelected: _schoolRecordsReady == rec,
                                onTap: () =>
                                    setState(() => _schoolRecordsReady = rec),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),
                      const FigmaInputLabel('Might English support help?',
                          fontSize: 16),
                      const SizedBox(height: 10),
                      Row(
                        children: ['Yes', 'No', 'Not sure'].map((es) {
                          final isLast = es == 'Not sure';
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: isLast ? 0 : 10),
                              child: FigmaChoiceChip(
                                label: es,
                                isSelected: _englishSupport == es,
                                onTap: () => setState(() => _englishSupport = es),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'No birthdate, no medical details. Just enough to show the right school steps.',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 12.5,
                          height: 1.45,
                          color: AppColors.dark300,
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
