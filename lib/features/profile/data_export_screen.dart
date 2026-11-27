import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';

class DataExportScreen extends StatefulWidget {
  const DataExportScreen({super.key});

  @override
  State<DataExportScreen> createState() => _DataExportScreenState();
}

class _DataExportScreenState extends State<DataExportScreen> {
  bool _pdfFormat = true;
  bool _jsonFormat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            FigmaSubPageHeader(
              title: 'Download your data',
              onBack: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/privacy-data');
                }
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Everything Settle keeps about you and your household, in two formats.',
                      style: AppTypography.body2.copyWith(
                        height: 1.45,
                        color: AppColors.dark300,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildFormatOption(
                            title: 'Easy-to-read PDF',
                            subtitle: 'Your plan, household and checklists',
                            value: _pdfFormat,
                            showBorder: true,
                            onChanged: (val) =>
                                setState(() => _pdfFormat = val ?? false),
                          ),
                          _buildFormatOption(
                            title: 'Machine-readable file (JSON)',
                            subtitle:
                                'Every field we store, plus your consent history',
                            value: _jsonFormat,
                            showBorder: false,
                            onChanged: (val) =>
                                setState(() => _jsonFormat = val ?? false),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.successSurface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.success,
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.check_rounded,
                              size: 20,
                              color: AppColors.white50,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your files are ready',
                                  style: AppTypography.body2Bold.copyWith(
                                    color: AppColors.success,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'settle-data-2026-09-28.zip · 84 KB',
                                  style: AppTypography.caption1.copyWith(
                                    color: AppColors.success,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SettleButton(
                      label: 'Save or share',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Opening share sheet...')),
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    Text(
                      "Opens your iPhone's share sheet — save to Files or send to yourself. The file is made fresh and not kept on our servers after you download it.",
                      style: AppTypography.caption1.copyWith(
                        height: 1.45,
                        color: AppColors.dark200,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormatOption({
    required String title,
    required String subtitle,
    required bool value,
    required bool showBorder,
    required ValueChanged<bool?> onChanged,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 60),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: showBorder
            ? const Border(bottom: BorderSide(color: AppColors.divider))
            : null,
      ),
      child: Row(
        children: [
          Checkbox(
            value: value,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.body2Bold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTypography.caption1.copyWith(
                    color: AppColors.dark200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
