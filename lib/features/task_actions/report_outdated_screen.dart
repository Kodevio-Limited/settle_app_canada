import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class ReportOutdatedScreen extends StatefulWidget {
  final String taskTitle;

  const ReportOutdatedScreen({
    super.key,
    this.taskTitle = 'Apply for your SIN',
  });

  @override
  State<ReportOutdatedScreen> createState() => _ReportOutdatedScreenState();
}

class _ReportOutdatedScreenState extends State<ReportOutdatedScreen> {
  int _selectedReason = 0;
  final TextEditingController _noteController = TextEditingController();

  final List<String> _reasons = [
    'A link is broken',
    'Steps or documents have changed',
    "An office's hours or address is wrong",
    'Something else',
  ];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Figma Sub-Page Header
              FigmaSubPageHeader(
                title: 'Report outdated info',
                onBack: () => context.pop(),
              ),
              const SizedBox(height: 16),

              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'About: ',
                      style: TextStyle(color: AppColors.dark300),
                    ),
                    TextSpan(
                      text: widget.taskTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                  ],
                ),
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14.5,
                ),
              ),
              const SizedBox(height: 18),

              const FigmaInputLabel('What looks wrong?'),
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),

              const Row(
                children: [
                  Text(
                    'Tell us more ',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainFont,
                    ),
                  ),
                  Text(
                    '(optional)',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 14,
                      color: AppColors.dark200,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _noteController,
                  maxLines: 4,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 14.5,
                    color: AppColors.mainFont,
                  ),
                  decoration: const InputDecoration(
                    hintText:
                        "What did you see? Please don't include personal details.",
                    hintStyle: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 14,
                      color: AppColors.dark200,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              const Text(
                'Our content team checks the official source before changing anything. We\'ll mark the task "under review" meanwhile.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12.5,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 24),

              SettleButton(
                label: 'Send report',
                onPressed: () {
                  context.pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Thank you! Report received and under review.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
