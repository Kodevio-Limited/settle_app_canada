import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF123332)),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Color(0xFF123332)),
                    onPressed: () => _showMoreOptions(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Title block
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'LICENSING PATHWAY · ONTARIO',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                      color: Color(0xFFA82227),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Becoming a Professional Engineer (P.Eng.)',
                    style: TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.08,
                      color: Color(0xFF123332),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6,
                    children: [
                      const Text(
                        'For',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 14,
                          color: Color(0xFF3B4747),
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 4, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: const Color(0xFFDEDEE2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            CircleAvatar(
                              radius: 11,
                              backgroundColor: Color(0xFF2E6B4F),
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
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 14,
                                color: Color(0xFF123332),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        '· Regulator: Professional Engineers Ontario (PEO)',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 13,
                          color: Color(0xFF3B4747),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Certificates you'll need
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Certificates you'll need",
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildCertRow(
                      badge: 'Goal',
                      badgeBg: const Color(0xFFF7E4E5),
                      badgeTextColor: const Color(0xFF7A1A1E),
                      title: 'P.Eng. licence',
                      desc: 'Issued by PEO. Needed to practise or call yourself an engineer.',
                    ),
                    const SizedBox(height: 10),
                    _buildCertRow(
                      badge: 'Required',
                      badgeBg: const Color(0xFFE2ECEB),
                      badgeTextColor: const Color(0xFF123332),
                      title: 'Course-by-course degree assessment',
                      desc: 'From World Education Services (WES), for degrees from outside Canada.',
                    ),
                    const SizedBox(height: 10),
                    _buildCertRow(
                      badge: 'Optional',
                      badgeBg: const Color(0xFFEAEAEC),
                      badgeTextColor: const Color(0xFF3B4747),
                      title: 'Engineering Intern (EIT) status',
                      desc: 'While you build experience. [Confirm details with PEO]',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Your pathway timeline
              const Text(
                'Your pathway',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 12),
              _buildTimeline(),
              const SizedBox(height: 20),

              // Working while you get licensed
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2ECEB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Working while you get licensed',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 8),
                    _BulletItem(text: "Work under a licensed engineer's supervision"),
                    _BulletItem(text: 'Join a bridging program for internationally trained engineers'),
                    _BulletItem(text: 'Related roles, e.g. technologist — voluntary C.E.T. certification through OACETT'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Have ready section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Have ready',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildCheckboxRow(0, 'Degree and transcripts (sent by your university)'),
                    _buildCheckboxRow(1, 'Work history with supervisor contacts'),
                    _buildCheckboxRow(2, 'Government photo ID'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Help near you
              const Text(
                'Help near you',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 10),
              _buildHelpCard(
                num: '1',
                title: 'Bridging program for engineers · [provider]',
                sub: '[distance] · funded by Ontario',
              ),
              const SizedBox(height: 8),
              _buildHelpCard(
                num: '2',
                title: 'Employment Ontario centre · [name]',
                sub: '1.9 km · Open now',
                hasOpenNow: true,
              ),
              const SizedBox(height: 16),

              // Official source card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.open_in_new, size: 22, color: Color(0xFF123332)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Official source · PEO',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF123332),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Application requirements · verified [DATE]',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 13,
                              color: Color(0xFF5A5F6B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

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
                          backgroundColor: const Color(0xFF123332),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Step $_activeStep done',
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 15,
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
                          side: const BorderSide(color: Color(0xFFC8C8CE)),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Remind me later',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF123332),
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
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 12,
                  height: 1.45,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 32),
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
          width: 64,
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          decoration: BoxDecoration(
            color: badgeBg,
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.center,
          child: Text(
            badge,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans',
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
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: const TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 13,
                  color: Color(0xFF3B4747),
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
        // Connecting line
        Positioned(
          left: 13,
          top: 14,
          bottom: 14,
          child: Container(
            width: 2,
            color: const Color(0xFFD6D6DB),
          ),
        ),
        Column(
          children: steps.map((s) {
            final isActive = s.number == _activeStep;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: isActive ? const Color(0xFFCA292E) : const Color(0xFFF4F4F5),
                      shape: BoxShape.circle,
                      border: isActive ? null : Border.all(color: const Color(0xFFABABB3), width: 2),
                    ),
                    child: Center(
                      child: Text(
                        '${s.number}',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isActive ? Colors.white : const Color(0xFF3B4747),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: isActive
                          ? const EdgeInsets.symmetric(horizontal: 12, vertical: 10)
                          : const EdgeInsets.symmetric(vertical: 4),
                      decoration: isActive
                          ? BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFFCA292E), width: 2),
                            )
                          : null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.title,
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF123332),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            s.desc,
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 13,
                              color: Color(0xFF3B4747),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: Checkbox(
                value: isChecked,
                activeColor: const Color(0xFF2E6B4F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
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
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 15,
                  color: Color(0xFF123332),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFDEDEE2)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: const BoxDecoration(
              color: Color(0xFF123332),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                num,
                style: const TextStyle(
                  fontFamily: 'IBM Plex Sans',
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
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF123332),
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
                            color: Color(0xFF2E6B4F),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 13,
                      color: Color(0xFF5A5F6B),
                    ),
                  )
                else
                  Text(
                    sub,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 13,
                      color: Color(0xFF5A5F6B),
                    ),
                  ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 18, color: Color(0xFF7A7A83)),
        ],
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.share_outlined, color: Color(0xFF123332)),
                title: const Text('Share this pathway'),
                onTap: () => Navigator.pop(ctx),
              ),
              ListTile(
                leading: const Icon(Icons.bookmark_outline, color: Color(0xFF123332)),
                title: const Text('Bookmark for later'),
                onTap: () => Navigator.pop(ctx),
              ),
              ListTile(
                leading: const Icon(Icons.flag_outlined, color: Color(0xFFA82227)),
                title: const Text('Report an issue'),
                onTap: () => Navigator.pop(ctx),
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
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF123332))),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF123332),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
