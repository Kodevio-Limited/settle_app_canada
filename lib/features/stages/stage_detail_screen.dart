import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
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
<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="#5A5F6B" stroke-width="2.4" stroke-linecap="round">
  <rect x="5" y="11" width="14" height="10" rx="2"></rect>
  <path d="M8 11V8a4 4 0 0 1 8 0v3"></path>
</svg>''';

  static const String _pinSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#123332" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <path d="M12 21s-7-6.1-7-11.5A7 7 0 0 1 19 9.5C19 14.9 12 21 12 21z"></path>
  <circle cx="12" cy="9.5" r="2.5"></circle>
</svg>''';

  static const String _infoSvg = '''
<svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#A82227" stroke-width="1.8" stroke-linecap="round">
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

    // Determine tag color
    Color tagColor = const Color(0xFFA82227);
    if (stage.tag.contains('Done')) {
      tagColor = const Color(0xFF2E6B4F);
    } else if (stage.tag.contains('In progress')) {
      tagColor = const Color(0xFFA82227);
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    if (stage.id == '4b') {
                      context.push('/stages/4');
                    } else if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/journey');
                    }
                  },
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: 44,
                    height: 44,
                    alignment: Alignment.centerLeft,
                    child: const Icon(
                      Icons.chevron_left,
                      size: 28,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),

              // Stage Tag
              Text(
                stage.tag.toUpperCase(),
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: tagColor,
                ),
              ),
              const SizedBox(height: 4),

              // Title
              Text(
                stage.title,
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 4),

              // Description
              Text(
                stage.desc,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 12),

              // Stage 4 stream switch
              if (stage.id == '4') ...[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 36,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'School · Sami, Nour',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      InkWell(
                        onTap: () => context.push('/stages/4b'),
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          height: 36,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: const Color(0xFFC8C8CE)),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'University · Yasmin',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // Task List Container
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
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

              const SizedBox(height: 24),
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
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          color: Color(0xFF2E6B4F),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.string(_checkSvg, width: 13, height: 13),
        ),
      );
    } else if (task.isLocked) {
      badgeWidget = Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          color: Color(0xFFEAEAEC),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.string(_lockSvg, width: 13, height: 13),
        ),
      );
    } else {
      final label = task.badge.isNotEmpty ? task.badge : '$defaultNumber';
      badgeWidget = Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          color: Color(0xFFE2ECEB),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      );
    }

    Color subtitleColor = const Color(0xFF5A5F6B);
    if (task.isDone) {
      subtitleColor = const Color(0xFF2E6B4F);
    } else if (task.sub.contains('SIN first') || task.sub.contains('Needs')) {
      subtitleColor = const Color(0xFFA82227);
    }

    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${task.title} (Phase 4)')),
        );
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
          InkWell(
            onTap: () => context.push('/stages/4b'),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF7E4E5),
                borderRadius: BorderRadius.circular(16),
              ),
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
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
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
                    Icons.chevron_right,
                    size: 20,
                    color: Color(0xFFA82227),
                  ),
                ],
              ),
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
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFDEDEE2)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "We don't sell or recommend insurance",
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Before you buy, check the broker or agent is licensed in Ontario.',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    height: 1.45,
                    color: Color(0xFF3B4747),
                  ),
                ),
                const SizedBox(height: 10),
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
              color: Color(0xFF5A5F6B),
            ),
          ),
        ];

      case '7':
        return [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFDEDEE2)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Need care before you have a doctor?',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                _buildClinicRow('Walk-in clinics', '· 3 within 3 km', AppColors.primary),
                _buildClinicRow('Health811', '· call 811 to talk to a nurse, 24/7', AppColors.primary),
                _buildClinicRow('Emergency', '· call 911', const Color(0xFF8E1C21)),
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
              color: Color(0xFF5A5F6B),
            ),
          ),
        ];

      case '8':
        return [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'First-year budget planner',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
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
                    color: Color(0xFFCFE3E1),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF346767),
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
                                color: Color(0xFFCFE3E1),
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
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF346767),
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
                                color: Color(0xFFCFE3E1),
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
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
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
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColors.primary,
                style: BorderStyle.solid,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Does Layla's job need a licence?",
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Search any occupation for its licence or certificate',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          color: Color(0xFF5A5F6B),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.add, size: 20, color: AppColors.primary),
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
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF7E4E5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Starting over at work is hard',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
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
              color: Color(0xFF5A5F6B),
            ),
          ),
        ];

      case '10':
        return [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF7E4E5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Belonging takes time',
                  style: TextStyle(
                    fontFamily: AppTypography.fontHeading,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
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
                    color: Color(0xFF8E1C21),
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
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF7E4E5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.string(_infoSvg, width: 22, height: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 14,
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFE2ECEB),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.string(_pinSvg, width: 24, height: 24),
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
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColors.primary,
            ),
          ],
        ),
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
