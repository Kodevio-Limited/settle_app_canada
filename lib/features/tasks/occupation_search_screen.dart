import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import 'models/occupation_data.dart';

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
    final query = _searchQuery.trim().toLowerCase();

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                const SizedBox(height: 14),
                FigmaSearchBar(
                  controller: _searchController,
                  hintText: 'Search occupation (e.g. Engineer, Nurse)...',
                  onChanged: (val) => setState(() => _searchQuery = val),
                ),
                const SizedBox(height: 18),
                for (final category in kOccupationCategories) ...[
                  Builder(
                    builder: (context) {
                      final items = query.isEmpty
                          ? category.items
                          : category.items
                              .where((i) =>
                                  i.title.toLowerCase().contains(query) ||
                                  i.sub.toLowerCase().contains(query))
                              .toList();
                      if (items.isEmpty) return const SizedBox.shrink();
                      return _CategorySection(
                        title: category.title,
                        items: items,
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String title;
  final List<OccupationItem> items;

  const _CategorySection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: AppTypography.fontHeading,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.mainFont,
            ),
          ),
          const SizedBox(height: 8),
          FigmaSurfaceCard(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Column(
              children: [
                for (int i = 0; i < items.length; i++) ...[
                  if (i > 0)
                    const Divider(
                        height: 1, thickness: 1, color: AppColors.divider),
                  InkWell(
                    onTap: items[i].isClickable
                        ? () => context.push('/occupation-pathway')
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[i].title,
                                  style: const TextStyle(
                                    fontFamily: AppTypography.fontBody,
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.mainFont,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  items[i].sub,
                                  style: const TextStyle(
                                    fontFamily: AppTypography.fontBody,
                                    fontSize: 12.5,
                                    color: AppColors.dark300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (items[i].badgeText != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: items[i].isRegulated
                                    ? AppColors.dark50
                                    : const Color(0xFFE8F3EC),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                items[i].badgeText!,
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w600,
                                  color: items[i].isRegulated
                                      ? AppColors.primary
                                      : AppColors.secondary,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
