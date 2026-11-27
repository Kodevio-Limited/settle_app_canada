import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import 'models/occupation_data.dart';
import 'widgets/occupation_pathway_widgets.dart';

class OccupationPathwayScreen extends StatefulWidget {
  const OccupationPathwayScreen({super.key});

  @override
  State<OccupationPathwayScreen> createState() =>
      _OccupationPathwayScreenState();
}

class _OccupationPathwayScreenState extends State<OccupationPathwayScreen> {
  final Set<int> _checkedItems = {};
  int _activeStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FigmaCircleBackButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/occupation-search');
                      }
                    },
                  ),
                  FigmaCircleActionButton(
                    icon: const Icon(
                      Icons.more_horiz_rounded,
                      size: 22,
                      color: AppColors.mainFont,
                    ),
                    tooltip: 'More options',
                    onPressed: () => context.push('/report-outdated'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'LICENSING PATHWAY · ONTARIO',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Becoming a Professional Engineer (P.Eng.)',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.6,
                  height: 1.12,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 14),
              const FigmaNoticeBanner(
                padding: EdgeInsets.all(14),
                child: Text(
                  'Regulated by Professional Engineers Ontario (PEO). You can work in engineering under a P.Eng. supervisor while completing your licence.',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13.5,
                    height: 1.45,
                    color: AppColors.mainFont,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                '4-step pathway',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 10),
              PathwayTimelineCard(
                steps: kPengPathwaySteps,
                activeStep: _activeStep,
                onSelectStep: (step) => setState(() => _activeStep = step),
              ),
              const SizedBox(height: 18),
              const Text(
                'Documents to prepare',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 10),
              FigmaSurfaceCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    for (int i = 0; i < kPengChecklistItems.length; i++) ...[
                      if (i > 0)
                        const Divider(
                            height: 1, thickness: 1, color: AppColors.divider),
                      InkWell(
                        onTap: () => setState(() {
                          if (_checkedItems.contains(i)) {
                            _checkedItems.remove(i);
                          } else {
                            _checkedItems.add(i);
                          }
                        }),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          child: Row(
                            children: [
                              Icon(
                                _checkedItems.contains(i)
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded,
                                size: 22,
                                color: _checkedItems.contains(i)
                                    ? AppColors.secondary
                                    : AppColors.dark200,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  kPengChecklistItems[i],
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
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const PathwayHelpCard(
                title: 'PEO Licensing Guide',
                subtitle: 'Official requirements & fee schedule',
                badge: 'Official',
                icon: Icons.verified_outlined,
              ),
              const SizedBox(height: 10),
              const PathwayHelpCard(
                title: 'Ontario Bridge Training',
                subtitle: 'Free credential & job-readiness support',
                badge: 'Free help',
                icon: Icons.handshake_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
