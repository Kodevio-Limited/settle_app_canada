import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/figma_onboarding_widgets.dart';

class ChecklistItemData {
  final String id;
  final String label;
  final String owner;
  final bool checked;

  const ChecklistItemData({
    required this.id,
    required this.label,
    required this.owner,
    this.checked = false,
  });

  ChecklistItemData copyWith({bool? checked}) {
    return ChecklistItemData(
      id: id,
      label: label,
      owner: owner,
      checked: checked ?? this.checked,
    );
  }
}

class ChecklistSectionCard extends StatelessWidget {
  final String title;
  final List<ChecklistItemData> items;
  final ValueChanged<String> onToggle;

  const ChecklistSectionCard({
    super.key,
    required this.title,
    required this.items,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final doneCount = items.where((i) => i.checked).length;

    return FigmaSurfaceCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontHeading,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainFont,
                  ),
                ),
              ),
              Text(
                '$doneCount of ${items.length} ready',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: doneCount == items.length && items.isNotEmpty
                      ? AppColors.secondary
                      : AppColors.dark300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0)
              const Divider(height: 1, thickness: 1, color: AppColors.divider),
            InkWell(
              onTap: () => onToggle(items[i].id),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Row(
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: items[i].checked
                            ? AppColors.secondary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: items[i].checked
                              ? AppColors.secondary
                              : AppColors.dark200,
                          width: 1.5,
                        ),
                      ),
                      child: items[i].checked
                          ? const Icon(
                              Icons.check_rounded,
                              size: 15,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        items[i].label,
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 14,
                          color: items[i].checked
                              ? AppColors.dark300
                              : AppColors.mainFont,
                          decoration: items[i].checked
                              ? TextDecoration.lineThrough
                              : null,
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
    );
  }
}
