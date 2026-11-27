import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class DonePickerScreen extends StatefulWidget {
  final String taskTitle;

  const DonePickerScreen({
    super.key,
    this.taskTitle = 'Apply for your SIN',
  });

  @override
  State<DonePickerScreen> createState() => _DonePickerScreenState();
}

class _DonePickerScreenState extends State<DonePickerScreen> {
  final Set<String> _selectedPeople = {'Layla'};
  String _selectedWhen = 'Today';
  final List<String> _whenOptions = [
    'Today',
    'Yesterday',
    'Before we arrived',
    'Pick a date…',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A4D55),
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FigmaSheetHandle(),
                  const SizedBox(height: 14),

                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 40),
                      const Expanded(
                        child: Text(
                          'Who has done this?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainFont,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 22,
                          color: AppColors.mainFont,
                        ),
                        onPressed: () => context.pop(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 40,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.taskTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13.5,
                      color: AppColors.dark300,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // People pill tiles
                  _buildPersonRow('Layla', 'L', AppColors.primary),
                  const SizedBox(height: 10),
                  _buildPersonRow('Omar', 'O', AppColors.secondary),
                  const SizedBox(height: 10),
                  _buildPersonRow('Yasmin', 'Y', const Color(0xFF4A6FA5)),
                  const SizedBox(height: 16),

                  // When Dropdown
                  const FigmaInputLabel('When'),
                  const SizedBox(height: 6),
                  Container(
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColors.dark50,
                      borderRadius: BorderRadius.circular(55),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedWhen,
                        isExpanded: true,
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.dark300,
                        ),
                        items: _whenOptions.map((opt) {
                          return DropdownMenuItem<String>(
                            value: opt,
                            child: Text(
                              opt,
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 15.5,
                                color: AppColors.mainFont,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _selectedWhen = val;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  const Text(
                    'This only updates your checklist. Nothing is sent to Service Canada or anyone else.',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 12.5,
                      height: 1.45,
                      color: AppColors.dark200,
                    ),
                  ),
                  const SizedBox(height: 20),

                  SettleButton(
                    label: 'Save',
                    onPressed: () => context.push('/task-done'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPersonRow(String name, String initial, Color bg) {
    final isChecked = _selectedPeople.contains(name);
    return InkWell(
      onTap: () {
        setState(() {
          if (isChecked) {
            _selectedPeople.remove(name);
          } else {
            _selectedPeople.add(name);
          }
        });
      },
      borderRadius: BorderRadius.circular(55),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.white500,
          borderRadius: BorderRadius.circular(55),
          boxShadow: isChecked ? kFigmaSelectedGlow : null,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: bg,
              child: Text(
                initial,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 15.5,
                  fontWeight: isChecked ? FontWeight.w600 : FontWeight.w500,
                  color: AppColors.mainFont,
                ),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked ? AppColors.primary : Colors.transparent,
                border: isChecked
                    ? null
                    : Border.all(color: AppColors.dark100, width: 1.5),
              ),
              child: isChecked
                  ? const Icon(Icons.check, size: 15, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
