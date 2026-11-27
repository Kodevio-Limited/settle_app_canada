import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class OccupationSearchScreen extends StatefulWidget {
  const OccupationSearchScreen({super.key});

  @override
  State<OccupationSearchScreen> createState() => _OccupationSearchScreenState();
}

class _OccupationSearchScreenState extends State<OccupationSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FigmaCircleBackButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/stage-work');
                      }
                    },
                  ),
                  FigmaCircleActionButton(
                    icon: const Icon(
                      Icons.error_outline_rounded,
                      size: 21,
                      color: AppColors.mainFont,
                    ),
                    tooltip: 'Report outdated info',
                    onPressed: () => context.push('/report-outdated'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Title block
              const Text(
                'WORK & CREDENTIALS · ONTARIO',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Does your job need a licence here?',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.6,
                  height: 1.12,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Some jobs need a licence or certificate from a regulator before you can work in them — or use their title.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 16),

              // Full-pill Search bar
              FigmaSearchBar(
                controller: _searchController,
                hintText: 'Search your job, e.g. nurse, electrician',
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val.toLowerCase().trim();
                  });
                },
                onClear: () {
                  _searchController.clear();
                  setState(() {
                    _searchQuery = '';
                  });
                },
              ),
              const SizedBox(height: 16),

              // Omar's profession featured gradient card
              if (_searchQuery.isEmpty ||
                  'civil engineer'.contains(_searchQuery) ||
                  'omar'.contains(_searchQuery)) ...[
                InkWell(
                  onTap: () => context.push('/occupation-pathway'),
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: kFigmaHeroGradient,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Omar's profession",
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFD5E6E5),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: const Text(
                                'Licence needed',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Civil engineer',
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'P.Eng. licence · Professional Engineers Ontario',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 13.5,
                            color: Color(0xFFD5E6E5),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'See the full pathway →',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
              ],

              _buildCategorySection(
                title: 'HEALTH',
                jobs: const [
                  _JobItem(
                    'Registered nurse',
                    'RN registration · College of Nurses of Ontario',
                  ),
                  _JobItem('Physician', 'Certificate of registration · CPSO'),
                  _JobItem(
                    'Pharmacist',
                    'Registration · Ontario College of Pharmacists',
                  ),
                  _JobItem(
                    'Dentist',
                    'Registration · Royal College of Dental Surgeons of Ontario',
                  ),
                ],
              ),
              const SizedBox(height: 14),

              _buildCategorySection(
                title: 'EDUCATION, CARE & SOCIAL WORK',
                jobs: const [
                  _JobItem(
                    'Teacher (K–12)',
                    'Certificate of Qualification · Ontario College of Teachers',
                  ),
                  _JobItem(
                    'Early childhood educator',
                    'RECE registration · College of ECE',
                  ),
                  _JobItem(
                    'Social worker',
                    'Registration · College of Social Workers and Social Service Workers',
                  ),
                ],
              ),
              const SizedBox(height: 14),

              _buildCategorySection(
                title: 'LAW & FINANCE',
                jobs: const [
                  _JobItem(
                    'Lawyer',
                    'NCA assessment, then licence · Law Society of Ontario',
                  ),
                  _JobItem(
                    'Public accountant',
                    'CPA designation + public accounting licence · CPA Ontario',
                  ),
                ],
              ),
              const SizedBox(height: 14),

              _buildCategorySection(
                title: 'SKILLED TRADES',
                jobs: const [
                  _JobItem(
                    'Electrician (construction & maintenance)',
                    'Certificate of Qualification · Skilled Trades Ontario',
                  ),
                  _JobItem(
                    'Plumber',
                    'Certificate of Qualification · Skilled Trades Ontario',
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Not regulated callout
              const FigmaNoticeBanner(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      size: 20,
                      color: AppColors.secondary,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Not regulated? ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text:
                                  'Most jobs — like software developer, marketing or sales — need no licence. You can apply right away.',
                            ),
                          ],
                        ),
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13.5,
                          height: 1.45,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Footnote
              const Text(
                "Showing common jobs. The full list of 45 is below. Source: Ontario's Office of the Fairness Commissioner and each regulator · verified [DATE].",
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 12),

              // See all 45 regulated jobs card
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.all(14),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Showing all 45 regulated jobs in Ontario.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Row(
                  children: [
                    FigmaIconTile(
                      icon: Icons.work_outline_rounded,
                      iconColor: AppColors.primary,
                      backgroundColor: AppColors.dark50,
                      size: 42,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'See all 45 regulated jobs',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Health, law, business, science and trades',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13,
                              color: AppColors.dark300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: AppColors.dark200,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection({
    required String title,
    required List<_JobItem> jobs,
  }) {
    final filtered = _searchQuery.isEmpty
        ? jobs
        : jobs
            .where(
              (j) =>
                  j.title.toLowerCase().contains(_searchQuery) ||
                  j.sub.toLowerCase().contains(_searchQuery),
            )
            .toList();

    if (filtered.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
              color: AppColors.dark300,
            ),
          ),
        ),
        FigmaSurfaceCard(
          radius: 16,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: List.generate(filtered.length, (idx) {
              final job = filtered[idx];
              final isLast = idx == filtered.length - 1;
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: isLast
                      ? null
                      : const Border(
                          bottom: BorderSide(color: AppColors.divider),
                        ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.title,
                            style: const TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            job.sub,
                            style: const TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13,
                              color: AppColors.dark300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _JobItem {
  final String title;
  final String sub;
  const _JobItem(this.title, this.sub);
}
