import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class DismissScreen extends StatefulWidget {
  const DismissScreen({super.key});

  @override
  State<DismissScreen> createState() => _DismissScreenState();
}

class _DismissScreenState extends State<DismissScreen> {
  int _selectedReason = 0;

  final List<String> _reasons = [
    'We did this before arriving',
    "It doesn't apply to us",
    'Someone is already helping us with it',
    'Just hide it for now',
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
                          'Not for you?',
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
                  const SizedBox(height: 4),
                  const Text(
                    'Tell us why, so the rest of your plan stays right.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13.5,
                      color: AppColors.dark300,
                    ),
                  ),
                  const SizedBox(height: 18),

                  ...List.generate(_reasons.length, (idx) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: FigmaPillOptionTile(
                        title: _reasons[idx],
                        isSelected: idx == _selectedReason,
                        onTap: () {
                          setState(() {
                            _selectedReason = idx;
                          });
                        },
                      ),
                    );
                  }),
                  const SizedBox(height: 6),

                  const Text(
                    "If it doesn't apply, we may ask one question to fix your answers. Hidden tasks stay in Settings → My plan.",
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 12.5,
                      height: 1.45,
                      color: AppColors.dark200,
                    ),
                  ),
                  const SizedBox(height: 20),

                  SettleButton(
                    label: 'Update my plan',
                    onPressed: () {
                      context.go('/home');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Plan updated! Task has been removed.'),
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
