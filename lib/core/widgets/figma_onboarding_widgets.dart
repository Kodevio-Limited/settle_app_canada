import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Soft green selection glow used on active pill cards in Figma onboarding.
const List<BoxShadow> kFigmaSelectedGlow = [
  BoxShadow(
    color: Color(0x40278F13),
    blurRadius: 8.0,
    spreadRadius: 1.0,
  ),
];

/// Subtle blue-tinted shadow used on Figma social login pills.
const List<BoxShadow> kFigmaSocialShadow = [
  BoxShadow(
    color: Color(0x26A7BEFE),
    offset: Offset(0, 4),
    blurRadius: 4,
  ),
  BoxShadow(
    color: Color(0x26A7BEFE),
    offset: Offset(0, -4),
    blurRadius: 4,
  ),
];

/// Sheet elevation shadow matching Figma modal surfaces.
const List<BoxShadow> kFigmaSheetShadow = [
  BoxShadow(
    color: Color(0x40000000),
    offset: Offset(0, -1),
    blurRadius: 7.1,
  ),
];

/// 50x50 circular back button matching Figma while keeping a real [BackButton]
/// widget in the tree for navigation & widget tests.
class FigmaCircleBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const FigmaCircleBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Material(
        color: AppColors.dark50,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: BackButton(
          color: AppColors.mainFont,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

/// Top header for Auth screens: optional circular back button on the left and
/// centered Settle maple-leaf emblem mark.
class FigmaAuthHeader extends StatelessWidget {
  final VoidCallback? onBack;
  final bool showLogo;

  const FigmaAuthHeader({
    super.key,
    this.onBack,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: showLogo ? 74 : 50,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (onBack != null)
            Align(
              alignment: Alignment.topLeft,
              child: FigmaCircleBackButton(onPressed: onBack),
            ),
          if (showLogo)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/images/settle_mark.png',
                width: 44,
                height: 58,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.eco_rounded,
                  size: 40,
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Header row used across Onboarding Steps 1-5:
/// 50x50 circular [BackButton] + `Step N of 5` label + 8px pill progress bar
/// + compact trailing Skip button when applicable.
class FigmaOnboardingHeader extends StatelessWidget {
  final String stepLabel;
  final double progress;
  final VoidCallback onBack;
  final VoidCallback? onSkip;

  const FigmaOnboardingHeader({
    super.key,
    required this.stepLabel,
    required this.progress,
    required this.onBack,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FigmaCircleBackButton(onPressed: onBack),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      stepLabel,
                      style: const TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainFont,
                      ),
                    ),
                  ),
                  if (onSkip != null)
                    TextButton(
                      onPressed: onSkip,
                      style: TextButton.styleFrom(
                        minimumSize: const Size(48, 32),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Skip', style: AppTypography.body2Bold),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Container(
                height: 8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.dark100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress.clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Centered drag handle strip matching the modal sheet style in Figma add-member views.
class FigmaSheetHandle extends StatelessWidget {
  const FigmaSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 98,
        height: 5,
        decoration: BoxDecoration(
          color: AppColors.dark100,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

/// Pill input label using Figma's Bricolage Grotesque Medium style.
class FigmaInputLabel extends StatelessWidget {
  final String text;
  final String? trailingHint;
  final double fontSize;

  const FigmaInputLabel(
    this.text, {
    super.key,
    this.trailingHint,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    if (trailingHint == null) {
      return Text(
        text,
        style: TextStyle(
          fontFamily: AppTypography.fontHeading,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          height: 1.4,
          color: AppColors.mainFont,
        ),
      );
    }
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$text ',
            style: TextStyle(
              fontFamily: AppTypography.fontHeading,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              height: 1.4,
              color: AppColors.mainFont,
            ),
          ),
          TextSpan(
            text: trailingHint!,
            style: const TextStyle(
              fontFamily: AppTypography.fontHeading,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.4,
              color: AppColors.dark300,
            ),
          ),
        ],
      ),
    );
  }
}

/// Shared pill-shaped InputDecoration matching Figma's `#E9E9E9` inputs.
InputDecoration figmaPillInputDecoration({
  required String hintText,
  String? errorText,
  String? counterText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  double radius = 35,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
    horizontal: 18,
    vertical: 16,
  ),
}) {
  final baseBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide.none,
  );
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
      fontFamily: AppTypography.fontBody,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.dark200,
    ),
    errorText: errorText,
    counterText: counterText,
    filled: true,
    fillColor: AppColors.dark50,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: contentPadding,
    border: baseBorder,
    enabledBorder: baseBorder,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );
}

/// White full-pill selectable option card with trailing circle checkmark and
/// soft green active glow, matching Figma Steps 1, 3, and 5.
class FigmaPillOptionTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const FigmaPillOptionTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white500,
        borderRadius: BorderRadius.circular(55),
        border: Border.all(
          color: isSelected ? AppColors.primary : Colors.transparent,
          width: 1.2,
        ),
        boxShadow: isSelected ? kFigmaSelectedGlow : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(55),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: subtitle == null ? 56 : 68),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 16.5,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: isSelected ? AppColors.primary : AppColors.dark300,
                          ),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 3),
                          Text(
                            subtitle!,
                            style: const TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13,
                              color: AppColors.dark300,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  _FigmaCheckCircle(isSelected: isSelected),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FigmaCheckCircle extends StatelessWidget {
  final bool isSelected;

  const _FigmaCheckCircle({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.check_rounded,
          color: AppColors.white500,
          size: 16,
        ),
      );
    }
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.dark100,
          width: 1.5,
        ),
      ),
    );
  }
}

/// Interactive pill checkbox row matching Figma's AddAdult & AddStudent toggles.
class FigmaCheckRow extends StatelessWidget {
  final String label;
  final bool value;
  final VoidCallback onTap;

  const FigmaCheckRow({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            _FigmaCheckCircle(isSelected: value),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Solid pill selection chip matching Figma AddChild / AddAdult / AddStudent / Step 5.
class FigmaChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final double height;
  final EdgeInsetsGeometry padding;

  const FigmaChoiceChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.height = 46,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? AppColors.secondary : AppColors.dark50,
      borderRadius: BorderRadius.circular(38),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: height),
          child: Padding(
            padding: padding,
            child: Center(
              widthFactor: 1.0,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: isSelected
                        ? AppTypography.fontBody
                        : AppTypography.fontHeading,
                    fontSize: 15.5,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                    color: isSelected ? AppColors.white500 : AppColors.dark300,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Secondary `#E9E9E9` outlined pill CTA (`height: 59`, border `#B9B9B9`).
class FigmaSoftOutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const FigmaSoftOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 59, maxWidth: 440),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.dark50,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.dark100, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Center(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainFont,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Social auth pill button matching Figma (`rounded-[64px] h-[59px]`, blue-tinted shadow).
class FigmaSocialPillButton extends StatelessWidget {
  final String label;
  final String svgAssetPath;
  final VoidCallback? onTap;

  const FigmaSocialPillButton({
    super.key,
    required this.label,
    required this.svgAssetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      decoration: BoxDecoration(
        color: AppColors.white600,
        borderRadius: BorderRadius.circular(64),
        border: Border.all(
          color: const Color(0x335E5E5E),
          width: 1,
        ),
        boxShadow: kFigmaSocialShadow,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(64),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  svgAssetPath,
                  width: 22,
                  height: 22,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainFont,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Dashed `#346767` pill action button matching Figma Step 4 (`+ Child`, `+ Partner`).
class FigmaDashedActionPill extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const FigmaDashedActionPill({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _DashedPillPainter(
        color: AppColors.secondary,
        radius: 39,
        strokeWidth: 1.5,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(39),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 44),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedPillPainter extends CustomPainter {
  final Color color;
  final double radius;
  final double strokeWidth;

  const _DashedPillPainter({
    required this.color,
    required this.radius,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    final path = Path()..addRRect(rrect);

    const dashWidth = 5.0;
    const dashSpace = 4.0;
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final next = (distance + dashWidth).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedPillPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.radius != radius ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

// ---------------------------------------------------------------------------
// Shared Figma Design System Components for Sections S03 - S09
// ---------------------------------------------------------------------------

/// Signature Figma hero gradient used on Home progress card and featured highlights.
const LinearGradient kFigmaHeroGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF123332),
    Color(0xFF1E5250),
    Color(0xFF369996),
  ],
);

/// Standard circular trailing action button (`50x50`, `#E9E9E9`) matching Figma.
class FigmaCircleActionButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final String? tooltip;
  final bool showDot;

  const FigmaCircleActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    final btn = SizedBox(
      width: 50,
      height: 50,
      child: Material(
        color: AppColors.dark50,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Stack(
            alignment: Alignment.center,
            children: [
              icon,
              if (showDot)
                Positioned(
                  top: 11,
                  right: 11,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: AppColors.notificationDot,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.dark50, width: 1.5),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
    if (tooltip == null) return btn;
    return Tooltip(message: tooltip!, child: btn);
  }
}

/// Top sub-page header with 50x50 circular [BackButton], centered title, and
/// optional trailing 50x50 circular action button (or balancing spacer).
class FigmaSubPageHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final Widget? trailing;

  const FigmaSubPageHeader({
    super.key,
    required this.title,
    required this.onBack,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FigmaCircleBackButton(onPressed: onBack),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: AppTypography.fontHeading,
              fontWeight: FontWeight.w500,
              fontSize: 25,
              height: 1.25,
              color: AppColors.mainFont,
            ),
          ),
        ),
        const SizedBox(width: 10),
        trailing ?? const SizedBox(width: 50),
      ],
    );
  }
}

/// Clean flat white surface card used throughout Figma S03–S09 (`radius 14`, no border).
class FigmaSurfaceCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final double radius;
  final Color color;

  const FigmaSurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.radius = 14,
    this.color = AppColors.white500,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

/// 44x44 `#E9E9E9` rounded square icon tile seen in Home, Stage Detail, and Task Detail.
class FigmaIconTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;

  const FigmaIconTile({
    super.key,
    required this.icon,
    this.iconColor = AppColors.primary,
    this.backgroundColor = AppColors.dark50,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 22, color: iconColor),
    );
  }
}

/// Soft rose or slate informational banner matching Figma disclaimers & notes.
class FigmaNoticeBanner extends StatelessWidget {
  final Widget child;
  final bool isWarmAlert;
  final EdgeInsetsGeometry padding;

  const FigmaNoticeBanner({
    super.key,
    required this.child,
    this.isWarmAlert = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: isWarmAlert
            ? const Color(0xFFEBD4D6)
            : const Color(0xFFDCE1E1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: child,
    );
  }
}

/// Full-pill white search bar matching Figma Journey & Search.
class FigmaSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final bool autofocus;

  const FigmaSearchBar({
    super.key,
    required this.controller,
    this.hintText = 'Search',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    );
    return TextField(
      controller: controller,
      autofocus: autofocus,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      style: const TextStyle(
        fontFamily: AppTypography.fontBody,
        fontSize: 15.5,
        color: AppColors.mainFont,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: AppTypography.fontBody,
          fontSize: 15.5,
          color: AppColors.dark200,
        ),
        filled: true,
        fillColor: AppColors.white500,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 16, right: 8),
          child: Icon(Icons.search, color: AppColors.dark200, size: 22),
        ),
        suffixIcon: controller.text.isNotEmpty && onClear != null
            ? IconButton(
                icon: const Icon(Icons.clear, color: AppColors.dark200, size: 20),
                onPressed: onClear,
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        border: border,
        enabledBorder: border,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
        ),
      ),
    );
  }
}

/// Crimson pill button (`#8E1C21` / `#C91E1E`) matching Figma destructive CTAs.
class FigmaDangerButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const FigmaDangerButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 58, maxWidth: 440),
      width: double.infinity,
      decoration: BoxDecoration(
        color: onPressed == null ? AppColors.dark100 : AppColors.red,
        borderRadius: BorderRadius.circular(30),
        boxShadow: onPressed == null
            ? null
            : const [
                BoxShadow(
                  color: Color(0x1F000000),
                  offset: Offset(0, 4),
                  blurRadius: 16,
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Center(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Full-width dashed-border pill button matching Figma `+ Add New member` & `Pause my account`.
class FigmaDashedWideButton extends StatelessWidget {
  final String label;
  final IconData? leadingIcon;
  final VoidCallback onTap;

  const FigmaDashedWideButton({
    super.key,
    required this.label,
    this.leadingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _DashedPillPainter(
        color: AppColors.dark200,
        radius: 30,
        strokeWidth: 1.2,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            constraints: const BoxConstraints(minHeight: 54),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leadingIcon != null) ...[
                  Icon(leadingIcon, size: 20, color: AppColors.dark300),
                  const SizedBox(width: 8),
                ],
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 16.5,
                      color: AppColors.dark300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Segmented 2-tab pill control matching Figma Reminders/Calendar (`Upcoming | Calendar`).
class FigmaSegmentedTabs extends StatelessWidget {
  final String leftLabel;
  final String rightLabel;
  final bool isLeftSelected;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;

  const FigmaSegmentedTabs({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
    required this.isLeftSelected,
    required this.onLeftTap,
    required this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.dark50,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onLeftTap,
              child: Container(
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isLeftSelected ? AppColors.white500 : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  leftLabel,
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: isLeftSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isLeftSelected ? AppColors.primary : AppColors.dark300,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onRightTap,
              child: Container(
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !isLeftSelected ? AppColors.white500 : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  rightLabel,
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: !isLeftSelected ? FontWeight.w600 : FontWeight.w500,
                    color: !isLeftSelected ? AppColors.primary : AppColors.dark300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


