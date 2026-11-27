import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import 'widgets/checklist_section_card.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  String _selectedFilter = 'Everyone';

  final Map<String, List<ChecklistItemData>> _sections = {
    'Social Insurance Number (SIN)': [
      const ChecklistItemData(
        id: 'sin_primary',
        label: 'Primary identity document (passport or PR card)',
        owner: 'Applicant',
      ),
      const ChecklistItemData(
        id: 'sin_permit',
        label: 'Work or study permit (if applicable)',
        owner: 'Co-applicant',
      ),
      const ChecklistItemData(
        id: 'sin_address',
        label: 'Proof of Canadian address',
        owner: 'Everyone',
      ),
    ],
    'Provincial Health Card (OHIP)': [
      const ChecklistItemData(
        id: 'health_status',
        label: 'Proof of eligible immigration status',
        owner: 'Everyone',
      ),
      const ChecklistItemData(
        id: 'health_address',
        label: 'Proof of Ontario residency (lease or utility bill)',
        owner: 'Everyone',
      ),
      const ChecklistItemData(
        id: 'health_identity',
        label: 'Original photo ID',
        owner: 'Applicant',
      ),
    ],
    'School Registration': [
      const ChecklistItemData(
        id: 'school_address',
        label: 'Proof of address within school boundary',
        owner: 'Dependents',
      ),
      const ChecklistItemData(
        id: 'school_status',
        label: 'Child’s birth certificate or immigration document',
        owner: 'Dependents',
      ),
      const ChecklistItemData(
        id: 'school_vaccine',
        label: 'Immunization record',
        owner: 'Dependents',
      ),
    ],
  };

  void _toggleItem(String sectionKey, String itemId) {
    setState(() {
      final list = _sections[sectionKey]!;
      _sections[sectionKey] = [
        for (final item in list)
          if (item.id == itemId) item.copyWith(checked: !item.checked) else item,
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final filters = ['Everyone', 'Applicant', 'Co-applicant', 'Dependents'];

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FigmaSubPageHeader(
                title: 'What to bring',
                onBack: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/tasks/sin');
                  }
                },
              ),
              const SizedBox(height: 16),
              const FigmaNoticeBanner(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 20,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Keep your originals safe with you. This app never asks for photos, scans or document numbers — just tick things off as you gather them.',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          height: 1.45,
                          color: AppColors.mainFont,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final filter in filters) ...[
                      ChoiceChip(
                        label: Text(filter),
                        selected: _selectedFilter == filter,
                        onSelected: (_) =>
                            setState(() => _selectedFilter = filter),
                        selectedColor: AppColors.primary,
                        backgroundColor: Colors.white,
                        labelStyle: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: _selectedFilter == filter
                              ? Colors.white
                              : AppColors.mainFont,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: _selectedFilter == filter
                                ? AppColors.primary
                                : AppColors.divider,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
              for (final entry in _sections.entries) ...[
                Builder(
                  builder: (context) {
                    final filtered = _selectedFilter == 'Everyone'
                        ? entry.value
                        : entry.value
                            .where(
                              (i) =>
                                  i.owner == _selectedFilter ||
                                  i.owner == 'Everyone',
                            )
                            .toList();
                    if (filtered.isEmpty) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: ChecklistSectionCard(
                        title: entry.key,
                        items: filtered,
                        onToggle: (id) => _toggleItem(entry.key, id),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
