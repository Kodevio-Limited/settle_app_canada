import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class LifeEventOption {
  final IconData icon;
  final String title;
  final String route;
  final bool isSelected;

  const LifeEventOption({
    required this.icon,
    required this.title,
    required this.route,
    this.isSelected = false,
  });
}

class LifeEventScreen extends StatelessWidget {
  const LifeEventScreen({super.key});

  static const List<LifeEventOption> options = [
    LifeEventOption(
      icon: Icons.home_outlined,
      title: 'We moved home',
      route: '/plan/plan-change',
      isSelected: true,
    ),
    LifeEventOption(
      icon: Icons.shield_outlined,
      title: "Someone's status changed",
      route: '/plan/plan-change',
    ),
    LifeEventOption(
      icon: Icons.child_care_outlined,
      title: 'A new baby is coming or here',
      route: '/onboarding/add-child',
    ),
    LifeEventOption(
      icon: Icons.person_add_alt_1_outlined,
      title: 'Someone joined or arrived',
      route: '/onboarding/add-adult',
    ),
    LifeEventOption(
      icon: Icons.work_outline_rounded,
      title: 'New job, or lost a job',
      route: '/plan/plan-change',
    ),
    LifeEventOption(
      icon: Icons.navigation_outlined,
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Transform.translate(
                offset: const Offset(-10, 0),
                child: InkWell(
                  onTap: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/settings');
                    }
                  },
                  borderRadius: BorderRadius.circular(22),
                  child: const SizedBox(
                    width: 44,
                    height: 44,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Color(0xFF123332),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Title & Subtitle
              Text(
                'Something changed?',
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF123332),
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Life moves fast in the first year. Tell us what's new and we'll update everyone's tasks.",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 16),

              // 2-column Grid of Options
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = (constraints.maxWidth - 10) / 2;
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: options.map((opt) {
                      return SizedBox(
                        width: cardWidth,
                        child: InkWell(
                          onTap: () => context.push(opt.route),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 96),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: opt.isSelected
                                    ? const Color(0xFF123332)
                                    : const Color(0xFFDEDEE2),
                                width: opt.isSelected ? 2 : 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  opt.icon,
                                  size: 22,
                                  color: const Color(0xFF123332),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  opt.title,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF123332),
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
              const SizedBox(height: 14),

              // Something else secondary button
              InkWell(
                onTap: () => context.push('/onboarding/destination'),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFC8C8CE)),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Something else — edit my answers',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF123332),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Footer Note
              const Text(
                'Baby and status details are optional and you can remove them anytime.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.45,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
