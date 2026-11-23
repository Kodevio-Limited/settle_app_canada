import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_typography.dart';

enum SettleButtonVariant { primary, secondary, outline }

class SettleButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final SettleButtonVariant variant;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;

  const SettleButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = SettleButtonVariant.primary,
    this.leading,
    this.trailing,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    BorderSide side = BorderSide.none;

    switch (variant) {
      case SettleButtonVariant.primary:
        bg = AppColors.primary;
        fg = AppColors.white50;
        break;
      case SettleButtonVariant.secondary:
        bg = AppColors.secondary;
        fg = AppColors.white50;
        break;
      case SettleButtonVariant.outline:
        bg = Colors.transparent;
        fg = AppColors.primary;
        side = const BorderSide(color: AppColors.border, width: 1.5);
        break;
    }

    return Container(
      constraints: const BoxConstraints(minHeight: 56, maxWidth: 440),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: AppRadii.border100,
        boxShadow: variant == SettleButtonVariant.primary ? const [AppShadows.btnShadow] : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: 0,
          shadowColor: Colors.transparent,
          side: side,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: fg,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) ...[
                    leading!,
                    const SizedBox(width: AppSpacing.s8),
                  ],
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.body1Medium.copyWith(color: fg),
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: AppSpacing.s8),
                    trailing!,
                  ],
                ],
              ),
      ),
    );
  }
}

