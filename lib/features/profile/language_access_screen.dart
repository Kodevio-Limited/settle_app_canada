import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class LanguageAccessScreen extends StatefulWidget {
  const LanguageAccessScreen({super.key});

  @override
  State<LanguageAccessScreen> createState() => _LanguageAccessScreenState();
}

class _LanguageAccessScreenState extends State<LanguageAccessScreen> {
  String _selectedLang = 'English';
  bool _officialEnglishTerms = true;
  bool _plainLanguageMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            FigmaSubPageHeader(
              title: 'Language & accessibility',
              onBack: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/settings');
                }
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildLangRadio(
                            title: 'English',
                            value: 'English',
                            showBorder: true,
                          ),
                          _buildLangRadio(
                            title: 'العربية',
                            sublabel: 'Arabic',
                            isArabic: true,
                            value: 'Arabic',
                            showBorder: true,
                          ),
                          _buildLangRadio(
                            title: 'Français',
                            value: 'French',
                            showBorder: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Also show official English terms',
                                        style: AppTypography.body2.copyWith(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'So you recognize them at the counter',
                                        style: AppTypography.caption1.copyWith(
                                          color: AppColors.dark200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  value: _officialEnglishTerms,
                                  activeColor: AppColors.success,
                                  onChanged: (val) =>
                                      setState(() => _officialEnglishTerms = val),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1, color: AppColors.divider),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Plain-language mode',
                                        style: AppTypography.body2.copyWith(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Shorter sentences, fewer terms',
                                        style: AppTypography.caption1.copyWith(
                                          color: AppColors.dark200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  value: _plainLanguageMode,
                                  activeColor: AppColors.success,
                                  onChanged: (val) =>
                                      setState(() => _plainLanguageMode = val),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 1, color: AppColors.divider),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Text size',
                                  style: AppTypography.body2.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                                Text(
                                  'Follows your iPhone',
                                  style: AppTypography.caption1.copyWith(
                                    color: AppColors.dark200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 6),
                      child: Text(
                        'PREVIEW',
                        style: AppTypography.caption1.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          color: AppColors.dark200,
                        ),
                      ),
                    ),
                    FigmaSurfaceCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'الأوراق الرسمية',
                            style: AppTypography.caption1.copyWith(
                              fontFamily: AppTypography.fontArabic,
                              fontWeight: FontWeight.w600,
                              color: AppColors.red,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'قدّم طلب رقم التأمين الاجتماعي',
                            style: AppTypography.body2Bold.copyWith(
                              fontFamily: AppTypography.fontArabic,
                              fontSize: 17,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Social Insurance Number (SIN)',
                            style: AppTypography.caption1.copyWith(
                              color: AppColors.dark200,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'لـ: ليلى، عمر · ٣ مكاتب قريبة',
                            style: AppTypography.body2.copyWith(
                              fontFamily: AppTypography.fontArabic,
                              color: AppColors.dark300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      children: [
                        Text(
                          'Translations are reviewed by people, not just machines, before release. ',
                          style: AppTypography.caption1.copyWith(
                            height: 1.45,
                            color: AppColors.dark200,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Suggest a language',
                            style: AppTypography.caption1.copyWith(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildLangRadio({
    required String title,
    String? sublabel,
    bool isArabic = false,
    required String value,
    required bool showBorder,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 50),
      decoration: BoxDecoration(
        border: showBorder
            ? const Border(bottom: BorderSide(color: AppColors.divider))
            : null,
      ),
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: _selectedLang,
            activeColor: AppColors.primary,
            onChanged: (val) {
              if (val != null) {
                setState(() => _selectedLang = val);
              }
            },
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: (_selectedLang == value
                    ? AppTypography.body2Bold
                    : AppTypography.body2)
                .copyWith(
              fontFamily:
                  isArabic ? AppTypography.fontArabic : AppTypography.fontBody,
              color: AppColors.primary,
            ),
          ),
          if (sublabel != null) ...[
            const SizedBox(width: 8),
            Text(
              sublabel,
              style: AppTypography.body2.copyWith(
                color: AppColors.dark200,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
