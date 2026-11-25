import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: InkWell(
                      onTap: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/settings');
                        }
                      },
                      borderRadius: BorderRadius.circular(22),
                      child: const SizedBox(
                        width: 44,
                        height: 44,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Language & accessibility',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF123332),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // App language radio options
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
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

              // Switches Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Also show official English terms',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF123332),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'So you recognize them at the counter',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF5A5F6B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            value: _officialEnglishTerms,
                            activeColor: const Color(0xFF2E6B4F),
                            onChanged: (val) => setState(() => _officialEnglishTerms = val),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFEAEAEC)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Plain-language mode',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF123332),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Shorter sentences, fewer terms',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF5A5F6B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            value: _plainLanguageMode,
                            activeColor: const Color(0xFF2E6B4F),
                            onChanged: (val) => setState(() => _plainLanguageMode = val),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFEAEAEC)),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Text size',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF123332),
                            ),
                          ),
                          Text(
                            'Follows your iPhone',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF5A5F6B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Preview Section
              const Padding(
                padding: EdgeInsets.only(left: 4, bottom: 6),
                child: Text(
                  'PREVIEW',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Color(0xFF5A5F6B),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'الأوراق الرسمية',
                      style: TextStyle(
                        fontFamily: AppTypography.fontArabic,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFA82227),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'قدّم طلب رقم التأمين الاجتماعي',
                      style: TextStyle(
                        fontFamily: AppTypography.fontArabic,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Social Insurance Number (SIN)',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF5A5F6B),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'لـ: ليلى، عمر · ٣ مكاتب قريبة',
                      style: TextStyle(
                        fontFamily: AppTypography.fontArabic,
                        fontSize: 14,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Footer Note
              Wrap(
                children: [
                  const Text(
                    'Translations are reviewed by people, not just machines, before release. ',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.45,
                      color: Color(0xFF5A5F6B),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Suggest a language',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF123332),
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
            ? const Border(bottom: BorderSide(color: Color(0xFFEAEAEC)))
            : null,
      ),
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: _selectedLang,
            activeColor: const Color(0xFF123332),
            onChanged: (val) {
              if (val != null) {
                setState(() => _selectedLang = val);
              }
            },
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontFamily: isArabic ? AppTypography.fontArabic : AppTypography.fontBody,
              fontSize: 15,
              fontWeight: _selectedLang == value ? FontWeight.w600 : FontWeight.w400,
              color: const Color(0xFF123332),
            ),
          ),
          if (sublabel != null) ...[
            const SizedBox(width: 8),
            Text(
              sublabel,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF5A5F6B),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
