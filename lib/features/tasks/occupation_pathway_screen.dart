import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class OccupationPathwayScreen extends StatefulWidget {
  const OccupationPathwayScreen({super.key});

  @override
  State<OccupationPathwayScreen> createState() => _OccupationPathwayScreenState();
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
              // Header navigation
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
                    onPressed: () => _showMoreOptions(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Title block
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
              const SizedBox(height: 10),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 6,
                children: [
                  const Text(
                    'For',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 14,
                      color: AppColors.dark300,
                    ),
                  ),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.only(left: 4, right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 11,
                          backgroundColor: AppColors.secondary,
                          child: Text(
                            'O',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Omar',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '· Regulator: Professional Engineers Ontario (PEO)',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13,
                      color: AppColors.dark300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Certificates you'll need
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Certificates you'll need",
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildCertRow(
                      badge: 'Goal',
                      badgeBg: const Color(0xFFEBD4D6),
                      badgeTextColor: AppColors.red,
                      title: 'P.Eng. licence',
                      desc:
                          'Issued by PEO. Needed to practise or call yourself an engineer.',
                    ),
                    const SizedBox(height: 12),
                    _buildCertRow(
                      badge: 'Required',
                      badgeBg: AppColors.softTeal,
                      badgeTextColor: AppColors.primary,
                      title: 'Course-by-course degree assessment',
                      desc:
                          'From World Education Services (WES), for degrees from outside Canada.',
                    ),
                    const SizedBox(height: 12),
                    _buildCertRow(
                      badge: 'Optional',
                      badgeBg: AppColors.dark50,
                      badgeTextColor: AppColors.dark300,
                      title: 'Engineering Intern (EIT) status',
                      desc:
                          'While you build experience. [Confirm details with PEO]',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Your pathway timeline
              const Text(
                'Your pathway',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 12),
              _buildTimeline(),
              const SizedBox(height: 16),

              // Working while you get licensed
              const FigmaNoticeBanner(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Working while you get licensed',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 8),
                    _BulletItem(
                      text: "Work under a licensed engineer's supervision",
                    ),
                    _BulletItem(
                      text:
                          'Join a bridging program for internationally trained engineers',
                    ),
                    _BulletItem(
                      text:
                          'Related roles, e.g. technologist — voluntary C.E.T. certification through OACETT',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Have ready section
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Have ready',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildCheckboxRow(
                      0,
                      'Degree and transcripts (sent by your university)',
                    ),
                    _buildCheckboxRow(
                      1,
                      'Work history with supervisor contacts',
                    ),
                    _buildCheckboxRow(2, 'Government photo ID'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Help near you
              const Text(
                'Help near you',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 10),
              _buildHelpCard(
                num: '1',
                title: 'Bridging program for engineers · [provider]',
                sub: '[distance] · funded by Ontario',
              ),
              const SizedBox(height: 10),
              _buildHelpCard(
                num: '2',
                title: 'Employment Ontario centre · [name]',
                sub: '1.9 km · Open now',
                hasOpenNow: true,
              ),
              const SizedBox(height: 14),

              // Official source card
              const FigmaSurfaceCard(
                radius: 16,
                padding: EdgeInsets.all(14),
                child: Row(
                  children: [
                    FigmaIconTile(
                      icon: Icons.open_in_new_rounded,
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
                            'Official source · PEO',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Application requirements · verified [DATE]',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13,
                              color: AppColors.dark300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Bottom Actions
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _activeStep = _activeStep < 6 ? _activeStep + 1 : 1;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Step $_activeStep is now active!'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Step $_activeStep done',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("We'll remind you in 3 days."),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.dark100),
                          backgroundColor: AppColors.dark50,
                          foregroundColor: AppColors.mainFont,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Remind me later',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Disclaimer
              const Text(
                "A summary of PEO's rules to help you plan — not advice. PEO decides every application.",
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCertRow({
    required String badge,
    required Color badgeBg,
    required Color badgeTextColor,
    required String title,
    required String desc,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 68,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: badgeBg,
            borderRadius: BorderRadius.circular(999),
          ),
          alignment: Alignment.center,
          child: Text(
            badge,
            style: TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: badgeTextColor,
            ),
          ),
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
                desc,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13,
                  height: 1.4,
                  color: AppColors.dark300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeline() {
    final steps = [
      _PathwayStep(
        1,
        'Get your degree assessed by WES',
        "Your university sends transcripts to WES. You're here.",
      ),
      _PathwayStep(
        2,
        'Apply to PEO and pass the good-character check',
        "Online through PEO's portal.",
      ),
      _PathwayStep(
        3,
        'Academic review',
        "If your degree isn't on PEO's recognized lists, PEO may assign technical exams.",
      ),
      _PathwayStep(
        4,
        'Show at least 2 years of engineering experience',
        'Canadian experience is not required. PEO assesses your competencies.',
      ),
      _PathwayStep(
        5,
        'Professional practice exam (law & ethics)',
        '[Confirm current exam requirement with PEO]',
      ),
      _PathwayStep(
        6,
        'Licence issued — use "P.Eng."',
        'Moving provinces? Each province has its own regulator.',
      ),
    ];

    return Stack(
      children: [
        Positioned(
          left: 14,
          top: 14,
          bottom: 14,
          child: Container(
            width: 1.5,
            color: const Color(0xFFC5C5C7),
          ),
        ),
        Column(
          children: steps.map((s) {
            final isActive = s.number == _activeStep;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.red : AppColors.dark50,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${s.number}',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isActive ? Colors.white : AppColors.dark300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: isActive
                          ? const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            )
                          : const EdgeInsets.symmetric(vertical: 4),
                      decoration: isActive
                          ? BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: AppColors.red,
                                width: 1.5,
                              ),
                            )
                          : null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.title,
                            style: const TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            s.desc,
                            style: const TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13,
                              height: 1.4,
                              color: AppColors.dark300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCheckboxRow(int idx, String title) {
    final isChecked = _checkedItems.contains(idx);
    return InkWell(
      onTap: () {
        setState(() {
          if (isChecked) {
            _checkedItems.remove(idx);
          } else {
            _checkedItems.add(idx);
          }
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: Checkbox(
                value: isChecked,
                activeColor: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _checkedItems.add(idx);
                    } else {
                      _checkedItems.remove(idx);
                    }
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14.5,
                  color: AppColors.mainFont,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpCard({
    required String num,
    required String title,
    required String sub,
    bool hasOpenNow = false,
  }) {
    return FigmaSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                num,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
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
                if (hasOpenNow)
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '1.9 km · '),
                        TextSpan(
                          text: 'Open now',
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13,
                      color: AppColors.dark300,
                    ),
                  )
                else
                  Text(
                    sub,
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
            color: AppColors.dark200,
          ),
        ],
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FigmaSheetHandle(),
              const SizedBox(height: 14),
              const Text(
                'P.Eng. Licensing Pathway',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.share_outlined,
                  color: AppColors.primary,
                ),
                title: const Text('Share this pathway'),
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.dark200,
                ),
                onTap: () => Navigator.pop(ctx),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.bookmark_outline_rounded,
                  color: AppColors.primary,
                ),
                title: const Text('Bookmark for later'),
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.dark200,
                ),
                onTap: () => Navigator.pop(ctx),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.flag_outlined,
                  color: AppColors.red,
                ),
                title: const Text('Report an issue'),
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.dark200,
                ),
                onTap: () => Navigator.pop(ctx),
              ),
              const SizedBox(height: 12),
              FigmaSoftOutlineButton(
                label: 'Cancel',
                onPressed: () => Navigator.pop(ctx),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PathwayStep {
  final int number;
  final String title;
  final String desc;
  _PathwayStep(this.number, this.title, this.desc);
}

class _BulletItem extends StatelessWidget {
  final String text;
  const _BulletItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16, color: AppColors.primary),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 13.5,
                height: 1.5,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
