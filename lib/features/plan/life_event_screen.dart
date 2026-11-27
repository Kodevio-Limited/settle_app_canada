import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class LifeEventOption {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String route;
  final bool isSelected;

  const LifeEventOption({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.route,
    this.isSelected = false,
  });
}

class LifeEventScreen extends StatelessWidget {
  const LifeEventScreen({super.key});

  static const List<LifeEventOption> options = [
    LifeEventOption(
      icon: Icons.home_rounded,
      iconColor: Color(0xFF346767),
      title: 'We moved home',
      route: '/plan/plan-change',
      isSelected: true,
    ),
    LifeEventOption(
      icon: Icons.shield_rounded,
      iconColor: Color(0xFF3B7DD8),
      title: "Someone's status changed",
      route: '/plan/plan-change',
    ),
    LifeEventOption(
      icon: Icons.child_care_rounded,
      iconColor: Color(0xFFD98A54),
      title: 'A new baby is coming or here',
      route: '/onboarding/add-child',
    ),
    LifeEventOption(
      icon: Icons.person_add_alt_1_rounded,
      iconColor: AppColors.mainFont,
      title: 'Someone joined or arrived',
      route: '/onboarding/add-adult',
    ),
    LifeEventOption(
      icon: Icons.work_rounded,
      iconColor: Color(0xFF7D5A50),
      title: 'New job, or lost a job',
      route: '/plan/plan-change',
    ),
    LifeEventOption(
      icon: Icons.location_on_rounded,
      iconColor: Color(0xFFD94336),
      title: 'Moving to another province',
      route: '/plan/plan-change',
    ),
  ];

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
              Align(
                alignment: Alignment.centerLeft,
                child: FigmaCircleBackButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/settings');
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Something changed?',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainFont,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Life moves fast in the first year. Tell us what's new and we'll update everyone's tasks.",
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14.5,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 18),

              // 2-column Grid of Borderless White Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = (constraints.maxWidth - 12) / 2;
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: options.map((opt) {
                      return SizedBox(
                        width: cardWidth,
                        child: InkWell(
                          onTap: () => context.push(opt.route),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 112),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow:
                                  opt.isSelected ? kFigmaSelectedGlow : null,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  opt.icon,
                                  size: 32,
                                  color: opt.iconColor,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  opt.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: AppTypography.fontBody,
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    height: 1.25,
                                    color: AppColors.mainFont,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 20),

              FigmaSoftOutlineButton(
                label: 'Something else — edit my answers',
                onPressed: () => context.push('/onboarding/destination'),
              ),
              const SizedBox(height: 14),

              const Text(
                'Baby and status details are optional and you can remove them anytime.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12,
                  height: 1.45,
                  color: AppColors.dark200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
