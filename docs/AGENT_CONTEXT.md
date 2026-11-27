# Settle App — Agent Context (1-Page Reference)

## Architecture & Tech Stack
- **Flutter + Dart** (feature-first under `lib/features/<feature>/`), **Riverpod** (`ConsumerWidget` / `StateNotifierProvider`), **go_router** (`lib/core/router/app_router.dart`, `app_routes.dart`).
- **Design System:** `lib/core/theme/app_colors.dart`, `app_typography.dart`, `lib/core/widgets/figma_onboarding_widgets.dart`, `settle_button.dart`, `settle_card.dart`, `settle_chip.dart`.
- **Tokens:** `AppColors.bg` (#F4F4F5), `AppColors.primary` (#123332), `AppColors.secondary` (#2E6B4F), `AppColors.mainFont` (#123332), `AppColors.dark50` (#F0F0F2), `AppColors.dark100/200/300`, `AppColors.red` (#A82227), `AppColors.divider` (#EAEAEC).
- **Fonts:** `AppTypography.fontHeading` (Instrument Serif), `AppTypography.fontBody` (DM Sans), `Noto Sans Arabic` for RTL.

## Shared Widget Catalogue (`lib/core/widgets/figma_onboarding_widgets.dart` & `core/widgets/`)
- `FigmaSurfaceCard({required Widget child, EdgeInsets? padding, VoidCallback? onTap})` — White borderless 16px-radius card.
- `FigmaCircleBackButton({VoidCallback? onTap})` — 44x44 circle back button.
- `FigmaCircleActionButton({required IconData icon, VoidCallback? onTap, String? semanticLabel})`
- `FigmaSubPageHeader({required String title, VoidCallback? onBack, Widget? trailing})`
- `FigmaNoticeBanner({required String text, bool isWarmAlert = false, IconData? icon})`
- `FigmaSegmentedTabs({required List<String> tabs, required int selectedIndex, required ValueChanged<int> onChanged})`
- `FigmaSearchBar({required TextEditingController controller, String hintText, ValueChanged<String>? onChanged})`
- `FigmaSoftOutlineButton({required String label, required VoidCallback? onPressed})`
- `FigmaDashedWideButton({required String label, required VoidCallback? onPressed})`
- `FigmaDangerButton({required String label, required VoidCallback? onPressed})`
- `FigmaIconTile({required IconData icon, Color? bgColor, Color? iconColor})`
- `SettleButton({required String label, required VoidCallback? onPressed, bool isLoading = false})` — Full-width 56px pill CTA.

## Commands (Scoped)
- Analyze: `dart analyze lib/features/<folder>`
- Test: `flutter test test/section<N>_test.dart test/nav_s<NN>_test.dart --reporter compact`
- Extract fixtures: `python3 tool/extract_section.py --section s08`

