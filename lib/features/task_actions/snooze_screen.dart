import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class SnoozeScreen extends StatefulWidget {
  const SnoozeScreen({super.key});

  @override
  State<SnoozeScreen> createState() => _SnoozeScreenState();
}

class _SnoozeScreenState extends State<SnoozeScreen> {
  int _selectedOption = 0;
  bool _addToCalendar = false;

  final List<Map<String, String>> _options = [
    {'title': 'Tomorrow morning', 'sub': '9:00 am'},
    {'title': 'This weekend', 'sub': 'Sat'},
    {'title': 'Next week', 'sub': 'Mon'},
    {'title': 'Pick a date and time', 'sub': ''},
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
                          'Remind me…',
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
                  const SizedBox(height: 16),

                  // Option pills
                  ...List.generate(_options.length, (idx) {
                    final opt = _options[idx];
                    final isSelected = idx == _selectedOption;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedOption = idx;
                          });
                        },
                        borderRadius: BorderRadius.circular(55),
                        child: Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: AppColors.white500,
                            borderRadius: BorderRadius.circular(55),
                            boxShadow: isSelected ? kFigmaSelectedGlow : null,
                          ),
                          child: Row(
                            children: [
                              Text(
                                opt['title']!,
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 15.5,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: AppColors.mainFont,
                                ),
                              ),
                              if (opt['sub']!.isNotEmpty) ...[
                                const Text(
                                  ' · ',
                                  style: TextStyle(
                                    fontFamily: AppTypography.fontBody,
                                    fontSize: 15,
                                    color: AppColors.dark200,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    opt['sub']!,
                                    style: const TextStyle(
                                      fontFamily: AppTypography.fontBody,
                                      fontSize: 14,
                                      color: AppColors.dark200,
                                    ),
                                  ),
                                ),
                              ] else
                                const Spacer(),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? AppColors.primary
                                      : Colors.transparent,
                                  border: isSelected
                                      ? null
                                      : Border.all(
                                          color: AppColors.dark100,
                                          width: 1.5,
                                        ),
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        size: 15,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 6),

                  // Calendar Switch Card
                  FigmaSurfaceCard(
                    radius: 28,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Also add to my iPhone Calendar',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.mainFont,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Saved on your phone, not by Settle',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 12,
                                  color: AppColors.dark200,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: _addToCalendar,
                          activeColor: AppColors.secondary,
                          onChanged: (val) {
                            setState(() {
                              _addToCalendar = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  SettleButton(
                    label: 'Set reminder',
                    onPressed: () {
                      context.pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Reminder set! We'll notify you."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
