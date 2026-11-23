import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  String _selectedFilter = 'Everyone';

  // Checklist states
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

    final sinDoneCount = (_sinLayla ? 1 : 0) + (_sinOmar ? 1 : 0) + (_sinNameChange ? 1 : 0);
    final healthDoneCount = (_healthStatus ? 1 : 0) + (_healthAddress ? 1 : 0) + (_healthIdentity ? 1 : 0);
    final schoolDoneCount = (_schoolAddress ? 1 : 0) + (_schoolStatus ? 1 : 0) + (_schoolVaccine ? 1 : 0);

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
                          context.go('/tasks/sin');
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
                  Text(
                    'What to bring',
                    style: const TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF123332),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Shield privacy callout
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2ECEB),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 22,
                      color: Color(0xFF123332),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Keep your originals safe with you. This app never asks for photos, scans or document numbers — just tick things off as you gather them.',
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.45,
                          color: Color(0xFF123332),
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
                      padding: const EdgeInsets.only(right: 6),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedFilter = f;
                          });
                        },
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          height: 36,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF123332) : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: isSelected
                                ? null
                                : Border.all(color: const Color(0xFFC8C8CE)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            f,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                              color: isSelected ? Colors.white : const Color(0xFF123332),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 14),

              // SIN Section
              if (_selectedFilter == 'Everyone' || _selectedFilter == 'Layla' || _selectedFilter == 'Omar') ...[
                _buildChecklistCard(
                  title: 'SIN · Service Canada',
                  badgeText: '$sinDoneCount of 3',
                  badgeColor: const Color(0xFF2E6B4F),
                  items: [
                    _ChecklistItem(
                      label: 'Status document — Layla',
                      value: _sinLayla,
                      onChanged: (val) => setState(() => _sinLayla = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'Status document — Omar',
                      value: _sinOmar,
                      onChanged: (val) => setState(() => _sinOmar = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'Name-change proof, if needed',
                      value: _sinNameChange,
                      onChanged: (val) => setState(() => _sinNameChange = val ?? false),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
              ],

              // Health cards Section
              if (_selectedFilter == 'Everyone' || _selectedFilter == 'Layla' || _selectedFilter == 'Omar' || _selectedFilter == 'Kids') ...[
                _buildChecklistCard(
                  title: 'Health cards · ServiceOntario',
                  badgeText: '$healthDoneCount of 3 · per person',
                  badgeColor: const Color(0xFF5A5F6B),
                  items: [
                    _ChecklistItem(
                      label: 'One proof of status in Canada',
                      value: _healthStatus,
                      onChanged: (val) => setState(() => _healthStatus = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'One proof of Ontario address',
                      value: _healthAddress,
                      onChanged: (val) => setState(() => _healthAddress = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'One proof of identity',
                      value: _healthIdentity,
                      onChanged: (val) => setState(() => _healthIdentity = val ?? false),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
              ],

              // School Section
              if (_selectedFilter == 'Everyone' || _selectedFilter == 'Kids') ...[
                _buildChecklistCard(
                  title: 'School · Sami & Nour',
                  badgeText: '$schoolDoneCount of 3',
                  badgeColor: const Color(0xFF5A5F6B),
                  items: [
                    _ChecklistItem(
                      label: 'Proof of address in the school area',
                      value: _schoolAddress,
                      onChanged: (val) => setState(() => _schoolAddress = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'Proof of age and status',
                      value: _schoolStatus,
                      onChanged: (val) => setState(() => _schoolStatus = val ?? false),
                    ),
                    _ChecklistItem(
                      label: 'Vaccination and past school records',
                      value: _schoolVaccine,
                      onChanged: (val) => setState(() => _schoolVaccine = val ?? false),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
              ],

              // Footer Note
              const Text(
                'Lists summarize official pages and may change — each links to its source in the task.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.45,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 16),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDEDEE2)),
      ),
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
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF123332),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                badgeText,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: badgeColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ...items.map((item) {
            return InkWell(
              onTap: () => item.onChanged(!item.value),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: Checkbox(
                        value: item.value,
                        activeColor: const Color(0xFF2E6B4F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(color: Color(0xFF8A8A93), width: 1.5),
                        onChanged: item.onChanged,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item.label,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF123332),
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
