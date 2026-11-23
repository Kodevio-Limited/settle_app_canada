import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_typography.dart';

class SettleChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Widget? leading;

  const SettleChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isSelected ? AppColors.primary : AppColors.white50;
    final fg = isSelected ? AppColors.white50 : AppColors.mainFont;
    final border = isSelected ? BorderSide.none : const BorderSide(color: AppColors.border);

    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.border100,
      child: Container(
        padding: AppSpacing.chipPadding,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: AppRadii.border100,
          border: Border.fromBorderSide(border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: AppSpacing.s4),
            ],
            Text(
              label,
              style: AppTypography.caption1Medium.copyWith(color: fg),
            ),
          ],
        ),
      ),
    );
  }
}

