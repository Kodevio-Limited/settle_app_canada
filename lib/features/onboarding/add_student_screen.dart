import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/user_profile.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'onboarding_provider.dart';

class AddStudentScreen extends ConsumerStatefulWidget {
  const AddStudentScreen({super.key});

  @override
  ConsumerState<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends ConsumerState<AddStudentScreen> {
  static const bool _isDemo = bool.fromEnvironment('DEMO', defaultValue: false);
  late final TextEditingController _nameController;
  String _ageGroup = '18–21';
  String _studyLevel = 'University';
  String _admitStatus = 'Not yet';
  bool _sameStatusAsMe = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _isDemo ? 'Yasmin' : '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name =
        _nameController.text.trim().isEmpty ? 'Yasmin' : _nameController.text.trim();

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
                              'Add an adult child',
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
                        decoration: figmaPillInputDecoration(hintText: 'e.g. Yasmin'),
                      ),
                      const SizedBox(height: 18),
                      const FigmaInputLabel('Age range', fontSize: 16),
                      const SizedBox(height: 10),
                      Row(
                        children: ['18–21', '22–25', '26+'].map((ag) {
                          final isLast = ag == '26+';
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: isLast ? 0 : 10),
                              child: FigmaChoiceChip(
                                label: ag,
                                isSelected: _ageGroup == ag,
                                onTap: () => setState(() => _ageGroup = ag),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),
                      const FigmaInputLabel('Studying in Canada?', fontSize: 16),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children:
                            ['University', 'College', 'Not sure yet', 'Not studying']
                                .map((ed) {
                          return FigmaChoiceChip(
                            label: ed,
                            isSelected: _studyLevel == ed,
                            onTap: () => setState(() => _studyLevel = ed),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),
                      const FigmaInputLabel('Where are they with applying?',
                          fontSize: 16),
                      const SizedBox(height: 10),
                      Row(
                        children: ['Accepted', 'Applying', 'Not yet'].map((as) {
                          final isLast = as == 'Not yet';
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: isLast ? 0 : 10),
                              child: FigmaChoiceChip(
                                label: as,
                                isSelected: _admitStatus == as,
                                onTap: () => setState(() => _admitStatus = as),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      FigmaCheckRow(
                        label: 'Same status as me',
                        value: _sameStatusAsMe,
                        onTap: () =>
                            setState(() => _sameStatusAsMe = !_sameStatusAsMe),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'On their own study permit? Their path is different — they should create their own Settle account.',
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
                            id: 'student_${DateTime.now().millisecondsSinceEpoch}',
                            name: name,
                            relationship: 'adultChild',
                            age: _ageGroup == '18–21'
                                ? 20
                                : _ageGroup == '22–25'
                                    ? 23
                                    : 27,
                            isStudent: _studyLevel != 'Not studying',
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
