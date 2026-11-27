import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import 'pathway_data.dart';

/// 22.0 Work · All regulated jobs (index).
class AllProfessionsScreen extends StatefulWidget {
  const AllProfessionsScreen({super.key});

  @override
  State<AllProfessionsScreen> createState() => _AllProfessionsScreenState();
}

class _AllProfessionsScreenState extends State<AllProfessionsScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedTab = 0;
  String _query = '';

  static const _tabs = ['All', 'Healthcare', 'Trades', 'Professions'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<RegulatedOccupation> get _filtered {
    return regulatedOccupations.where((occ) {
      if (_selectedTab == 1 && occ.category != OccupationCategory.healthcare) {
        return false;
      }
      if (_selectedTab == 2 && occ.category != OccupationCategory.trades) {
        return false;
      }
      if (_selectedTab == 3 && occ.category != OccupationCategory.professions) {
        return false;
      }
      if (_query.isNotEmpty) {
        final q = _query.toLowerCase();
        return occ.title.toLowerCase().contains(q) ||
            occ.regulator.toLowerCase().contains(q);
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = _filtered;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FigmaSubPageHeader(onBack: () => context.canPop() ? context.pop() : context.go("/home"), title: 'All regulated jobs'),
                  const SizedBox(height: 12),
                  FigmaSearchBar(
                    controller: _searchController,
                    hintText: 'Search 33 regulated occupations...',
                    onChanged: (v) => setState(() => _query = v.trim()),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_tabs.length, (i) {
                        final selected = _selectedTab == i;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(_tabs[i]),
                            selected: selected,
                            onSelected: (_) => setState(() => _selectedTab = i),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            Expanded(
              child: items.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'No matching regulated occupations.',
                          style: AppTypography.body2.copyWith(
                            color: AppColors.dark200,
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final occ = items[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: FigmaSurfaceCard(
                            onTap: () => context.push(occ.routePath),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        occ.title,
                                        style:
                                            AppTypography.h5.copyWith(
                                          color: AppColors.mainFont,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${occ.category.label} · ${occ.timeline}',
                                        style: AppTypography.caption1.copyWith(
                                          color: AppColors.dark200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  color: AppColors.dark200,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
