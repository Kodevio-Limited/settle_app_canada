import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';

class SettleCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final BorderSide? border;

  const SettleCard({
    super.key,
    required this.child,
    this.padding = AppSpacing.cardPadding,
    this.onTap,
    this.backgroundColor = AppColors.white50,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: AppRadii.border28,
      side: border ?? const BorderSide(color: AppColors.border, width: 1.0),
    );

    final card = Container(
      decoration: const BoxDecoration(
        borderRadius: AppRadii.border28,
        boxShadow: [AppShadows.cardShadow],
      ),
      child: Material(
        color: backgroundColor,
        shape: shape,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );

    return card;
  }
}

