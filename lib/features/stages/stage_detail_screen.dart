import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import 'models/stage_data.dart';

class StageDetailScreen extends StatelessWidget {
  final String stageId;

  const StageDetailScreen({
    super.key,
    required this.stageId,
  });

  static const String _checkSvg = '''
<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="#FFFFFF" stroke-width="3.2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M5 12.5l4.5 4.5L19 7.5"></path>
</svg>''';

  static const String _lockSvg = '''
<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="#686868" stroke-width="2.4" stroke-linecap="round">
  <rect x="5" y="11" width="14" height="10" rx="2"></rect>
  <path d="M8 11V8a4 4 0 0 1 8 0v3"></path>
</svg>''';

  static const String _infoSvg = '''
<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#8E1C21" stroke-width="1.8" stroke-linecap="round">
  <circle cx="12" cy="12" r="9"></circle>
  <path d="M12 11v5M12 8h.01"></path>
</svg>''';

  StageModel? _findStage(String id) {
    try {
      return allStagesData.firstWhere(
        (s) => s.id == id || s.key == id,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final stage = _findStage(stageId) ?? allStagesData[0];

    Color tagColor = AppColors.red;
    if (stage.tag.contains('Done')) {
      tagColor = AppColors.dark300;
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Figma Sub-Page Header
              FigmaSubPageHeader(
                title: stage.title,
                onBack: () {
                  if (context.canPop()) {
                    context.pop();
                  } else if (stage.id == '4b') {
                    context.go('/stages/4');
                  } else {
                    context.go('/journey');
                  }
                },
              ),
              const SizedBox(height: 16),

              // Stage Tag + Description
              Text(
                stage.tag.toUpperCase(),
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: tagColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stage.desc,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 14),

              // Stage 4 / 4b stream switch
              if (stage.id == '4' || stage.id == '4b') ...[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: stage.id == '4b'
                            ? () => context.go('/stages/4')
                            : null,
                        borderRadius: BorderRadius.circular(999),
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: stage.id == '4'
                                ? AppColors.primary
                                : AppColors.dark50,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'School · Sami, Nour',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: stage.id == '4'
                                  ? Colors.white
                                  : AppColors.dark300,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: stage.id == '4'
                            ? () => context.pushSafe('/stages/4b')
                            : null,
                        borderRadius: BorderRadius.circular(999),
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: stage.id == '4b'
                                ? AppColors.primary
                                : AppColors.dark50,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'University · Yasmin',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: stage.id == '4b'
                                  ? Colors.white
                                  : AppColors.dark300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
              ],

              // Borderless Figma White Task List Container
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: List.generate(stage.tasks.length, (index) {
                    final task = stage.tasks[index];
                    final isLast = index == stage.tasks.length - 1;
                    return _buildTaskRow(
                      context,
                      task: task,
                      defaultNumber: index + 1,
                      isLast: isLast,
                    );
                  }),
                ),
              ),
              const SizedBox(height: 14),

              // Stage Specific Bottom Sections
              ..._buildStageBottomWidgets(context, stage.id),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskRow(
    BuildContext context, {
    required StageTask task,
    required int defaultNumber,
    required bool isLast,
  }) {
    Widget badgeWidget;
    if (task.isDone) {
      badgeWidget = Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: AppColors.dark300,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.string(_checkSvg, width: 13, height: 13),
        ),
      );
    } else if (task.isLocked) {
      badgeWidget = Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: AppColors.dark50,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.string(_lockSvg, width: 13, height: 13),
        ),
      );
    } else {
      final label = task.badge.isNotEmpty ? task.badge : '$defaultNumber';
      badgeWidget = Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: AppColors.white500,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.dark100, width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: AppColors.dark300,
          ),
        ),
      );
    }

    Color subtitleColor = AppColors.dark300;
    if (task.isDone) {
      subtitleColor = AppColors.dark300;
    } else if (task.sub.contains('SIN first') || task.sub.contains('Needs')) {
      subtitleColor = AppColors.red;
    }

    return InkWell(
      onTap: () {
        final titleLower = task.title.toLowerCase();
        if (titleLower.contains('pr card')) {
          context.push('/task-status');
        } else if (titleLower.contains('sin') || titleLower.contains('social insurance')) {
          context.push('/task-sin');
        } else if (titleLower.contains('lease') || titleLower.contains('tenant') || titleLower.contains('rights')) {
          context.push('/task-housing');
        } else if (titleLower.contains('school') || titleLower.contains('register sami')) {
          context.push('/task-school');
        } else if (titleLower.contains('licence') || titleLower.contains('exchange')) {
          context.push('/task-licence');
        } else if (titleLower.contains('insurance')) {
          context.push('/task-insurance');
        } else if (titleLower.contains('doctor') || titleLower.contains('practitioner')) {
          context.push('/task-doctor');
        } else if (titleLower.contains('child benefit') || titleLower.contains('ccb')) {
          context.push('/task-ccb');
        } else if (titleLower.contains('employment') || titleLower.contains('work')) {
          context.push('/task-work');
        } else if (titleLower.contains('library')) {
          context.push('/task-library');
        } else if (titleLower.contains('apply to university') || titleLower.contains('college')) {
          context.push('/task-uni-apply');
        } else if (titleLower.contains('osap')) {
          context.push('/task-osap');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(task.title)),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(
                  bottom: BorderSide(color: Color(0xFFEAEAEC), width: 1),
                ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            badgeWidget,
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: task.isLocked
                          ? const Color(0xFF3B4747)
                          : AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    task.sub,
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13,
                      fontWeight: task.sub.contains('SIN first')
                          ? FontWeight.w500
                          : FontWeight.normal,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildStageBottomWidgets(BuildContext context, String id) {
    switch (id) {
      case '1':
        return [
          _buildInfoBanner(
            'Settle never gives advice on your own immigration case. For that, talk to a licensed consultant or lawyer — find one in Trusted help.',
          ),
          const SizedBox(height: 10),
          _buildActionCard(
            title: 'Free settlement services near you',
            subtitle: '2 within 5 km · eligibility depends on status',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          const Text(
            'Official source: IRCC — New permanent residents ↗ · Last verified [DATE].',
            style: TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 12,
              height: 1.45,
              color: Color(0xFF5A5F6B),
            ),
          ),
        ];

      case '2':
        return [
          _buildActionCard(
            title: 'Service Canada & ServiceOntario',
            subtitle: '5 offices within 10 km',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          const Text(
            'Sources: Canada.ca, Ontario.ca · each task links its own page · Last verified [DATE].',
            style: TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 12,
              height: 1.45,
              color: Color(0xFF5A5F6B),
            ),
          ),
        ];

      case '3':
        return [
          _buildInfoBanner(
            "Settle doesn't list rentals. We'll help you check a place is real and your lease is fair.",
          ),
          const SizedBox(height: 10),
          _buildActionCard(
            title: 'Free tenant legal help near you',
            subtitle: 'Community legal clinics · 2 nearby',
            onTap: () {},
          ),
        ];

      case '4':
        return [
          _buildActionCard(
            title: 'School registration offices near you',
            subtitle: 'Public and Catholic boards · 2 nearby',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          FigmaSurfaceCard(
            radius: 16,
            padding: const EdgeInsets.all(14),
            color: const Color(0xFFEBD4D6),
            onTap: () => context.pushSafe('/stages/4b'),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Yasmin's university & college stream",
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainFont,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '6 steps · applying, tuition, OSAP',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          color: Color(0xFF5C1518),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: AppColors.red,
                ),
              ],
            ),
          ),
        ];

      case '4b':
        return [
          _buildActionCard(
            title: 'Campuses & admissions offices',
            subtitle: '3 within 15 km · visit days & advising',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          const Text(
            'Admission and fee decisions are made by each school. Sources: OUAC, ontariocolleges.ca, Ontario.ca · verified [DATE].',
            style: TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 12,
              height: 1.45,
              color: Color(0xFF5A5F6B),
            ),
          ),
        ];

      case '5':
        return [
          _buildActionCard(
            title: 'DriveTest centres near you',
            subtitle: '2 within 10 km · see hours & directions',
            onTap: () {},
          ),
          const SizedBox(height: 8),
          const Text(
            'Official source: Ontario.ca — driving with an out-of-province licence ↗ · Last verified [DATE]. General information, not legal advice.',
            style: TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 12,
              height: 1.45,
              color: Color(0xFF5A5F6B),
            ),
          ),
        ];

      case '6':
        return [
          FigmaSurfaceCard(
            radius: 16,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "We don't sell or recommend insurance",
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Before you buy, check the broker or agent is licensed in Ontario.',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    height: 1.45,
                    color: AppColors.dark300,
                  ),
                ),
                const SizedBox(height: 12),
                _buildSimpleLink("Check a broker's licence (RIBO) ↗"),
                const SizedBox(height: 6),
                _buildSimpleLink("Check an agent's licence (FSRA) ↗"),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sources: FSRA, Ontario.ca · Last verified [DATE]. General information, not insurance advice.',
            style: TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 12,
              height: 1.45,
              color: AppColors.dark300,
            ),
          ),
        ];

      case '7':
        return [
          FigmaSurfaceCard(
            radius: 16,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Need care before you have a doctor?',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 8),
                _buildClinicRow('Walk-in clinics', '· 3 within 3 km', AppColors.primary),
                _buildClinicRow('Health811', '· call 811 to talk to a nurse, 24/7', AppColors.primary),
                _buildClinicRow('Emergency', '· call 911', AppColors.red),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Settle gives no medical advice. Sources: Ontario.ca · Last verified [DATE].',
            style: TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 12,
              height: 1.45,
              color: AppColors.dark300,
            ),
          ),
        ];

      case '8':
        return [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: kFigmaHeroGradient,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'First-year budget planner',
                  style: TextStyle(
                    fontFamily: AppTypography.fontHeading,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Plan your first months in dollars and in your home currency. Exchange rates from the Bank of Canada, updated daily.',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    height: 1.45,
                    color: Color(0xFFD5E6E5),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Monthly costs',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 12,
                                color: Color(0xFFD5E6E5),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '[Your estimate]',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'In AED',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 12,
                                color: Color(0xFFD5E6E5),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '[Converted]',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 46,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Open the planner',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildActionCard(
            title: 'Free tax clinics near you',
            subtitle: 'Volunteer help with benefits & taxes',
            onTap: () {},
          ),
        ];

      case '9':
        return [
          FigmaSurfaceCard(
            radius: 16,
            padding: const EdgeInsets.all(14),
            onTap: () => context.push('/occupation-search'),
            child: const Row(
              children: [
                FigmaIconTile(
                  icon: Icons.work_outline_rounded,
                  iconColor: AppColors.primary,
                  backgroundColor: AppColors.dark50,
                  size: 42,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Does Layla's job need a licence?",
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainFont,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Search any occupation for its licence or certificate',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          color: AppColors.dark300,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.add_rounded, size: 22, color: AppColors.primary),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildActionCard(
            title: 'Employment Ontario centres',
            subtitle: '2 within 5 km · newcomer programs',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          const FigmaNoticeBanner(
            isWarmAlert: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Starting over at work is hard',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5C1518),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "It's common to feel it. Here's where to find support.",
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    color: Color(0xFF5C1518),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sources: Ontario.ca, professional regulators · Last verified [DATE].',
            style: TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 12,
              height: 1.45,
              color: AppColors.dark300,
            ),
          ),
        ];

      case '10':
        return [
          const FigmaNoticeBanner(
            isWarmAlert: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Belonging takes time',
                  style: TextStyle(
                    fontFamily: AppTypography.fontHeading,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5C1518),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Missing home and feeling like an outsider are part of almost every move. Small, regular connections help more than big plans.',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF5C1518),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'How are you doing this week?',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildActionCard(
            title: 'Libraries & community centres',
            subtitle: '4 within 5 km',
            onTap: () {},
          ),
        ];

      default:
        return [];
    }
  }

  Widget _buildInfoBanner(String text) {
    return FigmaNoticeBanner(
      isWarmAlert: true,
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.string(_infoSvg, width: 20, height: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 13.5,
                height: 1.45,
                color: Color(0xFF5C1518),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return FigmaSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.all(14),
      onTap: onTap,
      child: Row(
        children: [
          const FigmaIconTile(
            icon: Icons.location_on_rounded,
            iconColor: AppColors.primary,
            backgroundColor: AppColors.dark50,
            size: 42,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    color: AppColors.dark300,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: Color(0xFF989898),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleLink(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildClinicRow(String title, String subtitle, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 15,
                color: AppColors.primary,
              ),
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                TextSpan(
                  text: ' $subtitle',
                  style: const TextStyle(color: Color(0xFF5A5F6B)),
                ),
              ],
            ),
          ),
          Text(
            '›',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
