import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/data/explore_figma_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/figma_onboarding_widgets.dart';
import '../../../core/widgets/settle_button.dart';
import '../providers/explore_providers.dart';

/// List screen template matching 20.2, 20.4, 20.6, 20.7, 20.11.
class ExploreListTemplateScreen extends ConsumerWidget {
  final ExploreListPageData page;
  const ExploreListTemplateScreen({super.key, required this.page});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(exploreFilterProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FigmaCircleBackButton(
                  onPressed: () =>
                      context.canPop() ? context.pop() : context.go('/explore'),
                ),
                FigmaCircleActionButton(
                  icon: const Icon(Icons.bookmark_border_rounded),
                  onPressed: () => context.push('/explore-saved'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              page.eyebrow,
              style: AppTypography.caption1.copyWith(
                color: AppColors.red,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              page.title,
              style: AppTypography.h1.copyWith(
                color: AppColors.mainFont,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              page.subtitle,
              style: AppTypography.body2.copyWith(color: AppColors.dark300),
            ),
            const SizedBox(height: 14),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: page.chips.map((chip) {
                  final selected = activeFilters.contains(chip);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(chip),
                      selected: selected,
                      onSelected: (_) =>
                          ref.read(exploreFilterProvider.notifier).toggle(chip),
                      selectedColor: AppColors.primary,
                      backgroundColor: Colors.white,
                      labelStyle: AppTypography.caption1.copyWith(
                        color: selected ? Colors.white : AppColors.mainFont,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: const StadiumBorder(),
                      side: BorderSide(
                        color: selected ? AppColors.primary : AppColors.divider,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            ...page.groups.map(
              (group) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (group.heading != null) ...[
                    Text(
                      group.heading!,
                      style: AppTypography.h3.copyWith(color: AppColors.mainFont),
                    ),
                    const SizedBox(height: 10),
                  ],
                  ...group.items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: FigmaSurfaceCard(
                        onTap: () => context.push(item.route),
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: item.iconBg,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(item.icon, color: Colors.white, size: 26),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.title,
                                          style: AppTypography.body1.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.mainFont,
                                          ),
                                        ),
                                      ),
                                      if (item.badge != null)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.dark50,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            item.badge!,
                                            style: AppTypography.caption1.copyWith(
                                              color: AppColors.dark300,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item.subtitle,
                                    style: AppTypography.caption1.copyWith(
                                      color: AppColors.dark300,
                                    ),
                                  ),
                                  if (item.tags.isNotEmpty) ...[
                                    const SizedBox(height: 6),
                                    Wrap(
                                      spacing: 6,
                                      runSpacing: 4,
                                      children: item.tags
                                          .map((t) => _TagPill(label: t))
                                          .toList(),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.chevron_right_rounded,
                              color: AppColors.dark200,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              page.footerNote,
              style: AppTypography.caption1.copyWith(color: AppColors.dark300),
            ),
          ],
        ),
      ),
    );
  }
}

/// Detail screen template matching 20.3, 20.5, 20.8, 21.2, 21.3, 23.1-23.16.
class ExploreDetailTemplateScreen extends ConsumerWidget {
  final ExploreDetailPageData data;
  const ExploreDetailTemplateScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaved = ref.watch(exploreSavedProvider).contains(data.id);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FigmaCircleBackButton(
                  onPressed: () =>
                      context.canPop() ? context.pop() : context.go('/explore'),
                ),
                FigmaCircleActionButton(
                  icon: Icon(
                    isSaved
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                  ),
                  onPressed: () => context.push('/explore-saved'),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              height: 140,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [data.bannerStart, data.bannerEnd],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.bottomLeft,
              child: Icon(data.bannerIcon, color: Colors.white, size: 32),
            ),
            const SizedBox(height: 16),
            Text(
              data.eyebrow,
              style: AppTypography.caption1.copyWith(
                color: AppColors.red,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data.title,
              style: AppTypography.h1.copyWith(
                color: AppColors.mainFont,
                fontSize: 28,
              ),
            ),
            if (data.tags.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: data.tags.map((t) => _TagPill(label: t)).toList(),
              ),
            ],
            if (data.promoCode != null) ...[
              const SizedBox(height: 14),
              FigmaSurfaceCard(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: data.promoCode!));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Copied ${data.promoCode}')),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      'YOUR CODE',
                      style: AppTypography.caption1.copyWith(
                        color: AppColors.dark200,
                        letterSpacing: 0.6,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      data.promoCode!,
                      style: AppTypography.h2.copyWith(color: AppColors.mainFont),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Copy code',
                      style: AppTypography.caption1.copyWith(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 16),
            for (int i = 0; i < data.grid.length; i += 2) ...[
              Row(
                children: [
                  Expanded(child: _GridCard(cell: data.grid[i])),
                  const SizedBox(width: 10),
                  if (i + 1 < data.grid.length)
                    Expanded(child: _GridCard(cell: data.grid[i + 1]))
                  else
                    const Spacer(),
                ],
              ),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 6),
            FigmaSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.sectionTitle,
                    style: AppTypography.h3.copyWith(color: AppColors.mainFont),
                  ),
                  const SizedBox(height: 10),
                  for (int i = 0; i < data.bullets.length; i++) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6, right: 10),
                          child: data.numbered
                              ? Text(
                                  '${i + 1}.',
                                  style: AppTypography.caption1.copyWith(
                                    color: AppColors.red,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              : Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: AppColors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: Text(
                            data.bullets[i],
                            style: AppTypography.body2.copyWith(
                              color: AppColors.dark300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (i < data.bullets.length - 1) const SizedBox(height: 8),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SettleButton(
                    label: data.primaryLabel,
                    onPressed: () {
                      if (data.primaryRoute != null) {
                        context.push(data.primaryRoute!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(data.primaryLabel)),
                        );
                      }
                    },
                  ),
                ),
                if (data.showSecondarySave) ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: FigmaSoftOutlineButton(
                      label: isSaved ? 'Saved' : data.secondaryLabel,
                      onPressed: () {
                        final added =
                            ref.read(exploreSavedProvider.notifier).toggle(data.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              added ? 'Saved · View saved' : 'Removed from saved',
                            ),
                            action: added
                                ? SnackBarAction(
                                    label: 'View saved',
                                    onPressed: () =>
                                        context.push('/explore-saved'),
                                  )
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 14),
            FigmaSurfaceCard(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(data.sourceTitle)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.open_in_new_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.sourceTitle,
                          style: AppTypography.body2.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainFont,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          data.sourceSubtitle,
                          style: AppTypography.caption1.copyWith(
                            color: AppColors.dark300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (data.isSponsored) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => context.push('/how-partners'),
                    child: const Text('How we choose partners'),
                  ),
                  TextButton(
                    onPressed: () => context.push('/report-outdated'),
                    child: const Text('Report this offer'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _GridCard extends StatelessWidget {
  final ExploreGridCell cell;
  const _GridCard({required this.cell});

  @override
  Widget build(BuildContext context) {
    return FigmaSurfaceCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cell.label,
            style: AppTypography.caption1.copyWith(color: AppColors.dark200),
          ),
          const SizedBox(height: 4),
          Text(
            cell.value,
            style: AppTypography.body2.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.mainFont,
            ),
          ),
        ],
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  final String label;
  const _TagPill({required this.label});

  @override
  Widget build(BuildContext context) {
    final isKids = label == 'Kids';
    final isGreen = label == 'Free' || label == 'Library pass';
    final bg = isKids
        ? const Color(0xFFFCEAEA)
        : isGreen
            ? const Color(0xFFE7F3ED)
            : AppColors.dark50;
    final fg = isKids
        ? AppColors.red
        : isGreen
            ? AppColors.secondary
            : AppColors.mainFont;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: AppTypography.caption1.copyWith(
          color: fg,
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}
