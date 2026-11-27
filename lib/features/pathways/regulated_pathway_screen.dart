import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import 'pathway_data.dart';

/// Data-driven pathway template for all 33 regulated occupations (S22).
class RegulatedPathwayScreen extends StatefulWidget {
  final String routePath;

  const RegulatedPathwayScreen({super.key, required this.routePath});

  @override
  State<RegulatedPathwayScreen> createState() => _RegulatedPathwayScreenState();
}

class _RegulatedPathwayScreenState extends State<RegulatedPathwayScreen> {
  final Set<int> _checkedSteps = {};

  @override
  Widget build(BuildContext context) {
    final occ = regulatedOccupationByPath[widget.routePath];
    if (occ == null) {
      return Scaffold(
        backgroundColor: AppColors.bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FigmaSubPageHeader(onBack: () => context.canPop() ? context.pop() : context.go("/home"), title: 'Licensing pathway'),
                const SizedBox(height: 24),
                FigmaNoticeBanner(child: Text('No pathway found for ${widget.routePath}.'),
                  isWarmAlert: true,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            FigmaSubPageHeader(onBack: () => context.canPop() ? context.pop() : context.go("/home"), title: occ.title),
            const SizedBox(height: 16),
            FigmaSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    occ.category.label,
                    style: AppTypography.caption1.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Regulator: ${occ.regulator}',
                    style: AppTypography.h5.copyWith(
                      color: AppColors.mainFont,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Estimated timeline: ${occ.timeline}',
                    style: AppTypography.body2.copyWith(
                      color: AppColors.dark300,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Typical licensing steps',
              style: AppTypography.h5.copyWith(
                color: AppColors.mainFont,
              ),
            ),
            const SizedBox(height: 10),
            ...List.generate(occ.steps.length, (i) {
              final done = _checkedSteps.contains(i);
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FigmaSurfaceCard(
                  onTap: () => setState(() {
                    if (done) {
                      _checkedSteps.remove(i);
                    } else {
                      _checkedSteps.add(i);
                    }
                  }),
                  child: Row(
                    children: [
                      Icon(
                        done
                            ? Icons.check_circle_rounded
                            : Icons.radio_button_unchecked_rounded,
                        color: done ? AppColors.secondary : AppColors.dark200,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '${i + 1}. ${occ.steps[i]}',
                          style: AppTypography.body2.copyWith(
                            color: AppColors.mainFont,
                            decoration:
                                done ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 8),
            FigmaSoftOutlineButton(
              label: 'All regulated jobs',
              onPressed: () => context.push('/all-professions'),
            ),
            const SizedBox(height: 16),
            Text(
              'Official source: provincial regulatory body · General information, not legal advice.',
              style: AppTypography.caption1.copyWith(color: AppColors.dark200),
            ),
          ],
        ),
      ),
    );
  }
}
