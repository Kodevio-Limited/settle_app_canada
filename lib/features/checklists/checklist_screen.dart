import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  String _selectedFilter = 'Everyone';

  bool _sinLayla = true;
  bool _sinOmar = false;
  bool _sinNameChange = false;

  bool _healthStatus = false;
  bool _healthAddress = false;
  bool _healthIdentity = false;

  bool _schoolAddress = false;
  bool _schoolStatus = false;
  bool _schoolVaccine = false;

  @override
  Widget build(BuildContext context) {
    final filters = ['Everyone', 'Layla', 'Omar', 'Kids'];

    final sinDoneCount =
        (_sinLayla ? 1 : 0) + (_sinOmar ? 1 : 0) + (_sinNameChange ? 1 : 0);
    final healthDoneCount = (_healthStatus ? 1 : 0) +
        (_healthAddress ? 1 : 0) +
        (_healthIdentity ? 1 : 0);
    final schoolDoneCount = (_schoolAddress ? 1 : 0) +
        (_schoolStatus ? 1 : 0) +
        (_schoolVaccine ? 1 : 0);

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

              // Shield privacy callout
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
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Filter pills
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: filters.map((f) {
                    final isSelected = _selectedFilter == f;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedFilter = f;
                          });
                        },
                        borderRadius: BorderRadius.circular(999),
                        child: Container(
                          height: 38,
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.dark50,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            f,
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.dark300,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              if (_selectedFilter == 'Everyone' ||
                  _selectedFilter == 'Layla' ||
                  _selectedFilter == 'Omar') ...[
                _buildChecklistCard(
                  title: 'SIN · Service Canada',
                  badgeText: '$sinDoneCount of 3',
                  badgeColor: AppColors.secondary,
                  items: [
                    _ChecklistItem(
                      label: 'Status document — Layla',
                      value: _sinLayla,
                      onChanged: (val) =>
                          setState(() => _sinLayla = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'Status document — Omar',
                      value: _sinOmar,
                      onChanged: (val) =>
                          setState(() => _sinOmar = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'Name-change proof, if needed',
                      value: _sinNameChange,
                      onChanged: (val) =>
                          setState(() => _sinNameChange = val ?? false),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
              ],

              if (_selectedFilter == 'Everyone' ||
                  _selectedFilter == 'Layla' ||
                  _selectedFilter == 'Omar' ||
                  _selectedFilter == 'Kids') ...[
                _buildChecklistCard(
                  title: 'Health cards · ServiceOntario',
                  badgeText: '$healthDoneCount of 3 · per person',
                  badgeColor: AppColors.dark300,
                  items: [
                    _ChecklistItem(
                      label: 'One proof of status in Canada',
                      value: _healthStatus,
                      onChanged: (val) =>
                          setState(() => _healthStatus = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'One proof of Ontario address',
                      value: _healthAddress,
                      onChanged: (val) =>
                          setState(() => _healthAddress = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'One proof of identity',
                      value: _healthIdentity,
                      onChanged: (val) =>
                          setState(() => _healthIdentity = val ?? false),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
              ],

              if (_selectedFilter == 'Everyone' ||
                  _selectedFilter == 'Kids') ...[
                _buildChecklistCard(
                  title: 'School · Sami & Nour',
                  badgeText: '$schoolDoneCount of 3',
                  badgeColor: AppColors.dark300,
                  items: [
                    _ChecklistItem(
                      label: 'Proof of address in the school area',
                      value: _schoolAddress,
                      onChanged: (val) =>
                          setState(() => _schoolAddress = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'Proof of age and status',
                      value: _schoolStatus,
                      onChanged: (val) =>
                          setState(() => _schoolStatus = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'Vaccination and past school records',
                      value: _schoolVaccine,
                      onChanged: (val) =>
                          setState(() => _schoolVaccine = val ?? false),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
              ],

              const Text(
                'Lists summarize official pages and may change — each links to its source in the task.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChecklistCard({
    required String title,
    required String badgeText,
    required Color badgeColor,
    required List<_ChecklistItem> items,
  }) {
    return FigmaSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainFont,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                badgeText,
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: badgeColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...items.map((item) {
            return InkWell(
              onTap: () => item.onChanged(!item.value),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: item.value,
                        activeColor: AppColors.secondary,
                        shape: const CircleBorder(),
                        side: const BorderSide(
                          color: AppColors.dark100,
                          width: 1.5,
                        ),
                        onChanged: item.onChanged,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.label,
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 14,
                          color: AppColors.mainFont,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ChecklistItem {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _ChecklistItem({
    required this.label,
    required this.value,
    required this.onChanged,
  });
}
