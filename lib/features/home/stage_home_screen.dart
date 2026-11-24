import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum StageHomeVariant {
  exploring,
  waiting,
  approved,
  settled,
}

class StageHomeScreen extends StatelessWidget {
  final StageHomeVariant variant;

  const StageHomeScreen({
    super.key,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    String tag;
    String subtitle;
    Widget? heroCard;
    String actionHeader;
    String actionHeaderLink;
    String actionHeaderRoute;
    List<_HomeAction> actions;
    Widget? bannerCard;

    switch (variant) {
      case StageHomeVariant.exploring:
        tag = 'EXPLORING CANADA';
        subtitle =
            'No deadlines. Read at your own pace and come back when things change.';
        heroCard = Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF7E4E5),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Text(
            "Settle is free and independent. We don't sell visas or offer legal representation.",
            style: TextStyle(
              fontFamily: 'IBM Plex Sans',
              fontSize: 13,
              height: 1.45,
              color: Color(0xFF5C1518),
            ),
          ),
        );
        actionHeader = 'Popular exploring guides';
        actionHeaderLink = 'All guides';
        actionHeaderRoute = '/tasks/all-professions';
        actions = const [
          _HomeAction(
            title: 'Learn the official ways to immigrate',
            sub: 'Express Entry, PNPs, family and study',
            route: '/tasks/exp-options',
          ),
          _HomeAction(
            title: 'Check a consultant or lawyer is licensed',
            sub: 'CICC or provincial law society',
            route: '/tasks/exp-representative',
          ),
          _HomeAction(
            title: 'Compare cities and living costs',
            sub: 'Toronto, Ottawa, Hamilton & more',
            route: '/tasks/exp-cities',
          ),
          _HomeAction(
            title: 'Jobs that need a licence in Ontario',
            sub: '45 regulated professions & trades',
            route: '/tasks/all-professions',
          ),
          _HomeAction(
            title: 'English or French test (IELTS, CELPIP, TEF)',
            sub: 'Language requirements & benchmarks',
            route: '/tasks/task-english-test',
          ),
          _HomeAction(
            title: 'Credential assessment (ECA)',
            sub: 'WES, ICAS, CES comparison',
            route: '/tasks/task-credential-assess',
          ),
        ];
        bannerCard = Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFE2ECEB),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Free legal and settlement help',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Legal clinics, immigrant-serving agencies and community centres offer free information.',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => context.push('/partners/legal-help'),
                child: const Text(
                  'Find free legal help near you',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF123332),
                  ),
                ),
              ),
            ],
          ),
        );
        break;

      case StageHomeVariant.waiting:
        tag = 'WAITING FOR A DECISION';
        subtitle =
            'Waiting is the hardest part. You can still make progress while IRCC reviews your file.';
        heroCard = Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF123332),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Permanent Residence application',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 13,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'In progress',
                style: TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '4 of 10 preparation steps done',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: const LinearProgressIndicator(
                  value: 0.4,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        );
        actionHeader = 'Next actions while waiting';
        actionHeaderLink = 'All 10 steps';
        actionHeaderRoute = '/journey-approved';
        actions = const [
          _HomeAction(
            title: 'Check your application status',
            sub: 'IRCC application tracker',
            route: '/tasks/wait-track',
          ),
          _HomeAction(
            title: "Gather your family's documents",
            sub: 'Originals, translations & police certs',
            route: '/tasks/wait-docs',
          ),
          _HomeAction(
            title: 'Start credential assessment (ECA)',
            sub: 'WES, ICAS, CES or professional body',
            route: '/tasks/task-credential-assess',
          ),
          _HomeAction(
            title: 'Plan money for your first months',
            sub: 'Proof of funds & buffer savings',
            route: '/tasks/wait-savings',
          ),
        ];
        bannerCard = Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFE2ECEB),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'When waiting feels hard',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Long processing times can take a mental toll. Tips and trusted resources to help you through.',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => context.push('/tasks/wait-wellbeing'),
                child: const Text(
                  'Read the guide',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF123332),
                  ),
                ),
              ),
            ],
          ),
        );
        break;

      case StageHomeVariant.approved:
        tag = 'APPROVED · GETTING READY';
        subtitle = '';
        heroCard = Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF123332),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Moving to Mississauga · [Your date]',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 13,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '42 days',
                style: TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'until you move · 3 of 12 steps done',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: const LinearProgressIndicator(
                  value: 0.25,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        );
        actionHeader = 'Your next 3 actions';
        actionHeaderLink = 'All steps';
        actionHeaderRoute = '/journey-approved';
        actions = const [
          _HomeAction(
            title: 'Sign up for free pre-arrival services',
            sub: 'Layla, Omar, Yasmin · this week',
            route: '/tasks/pre-services',
          ),
          _HomeAction(
            title: 'Get your travel documents ready',
            sub: 'Everyone · check every COPR',
            route: '/tasks/pre-travel-docs',
          ),
          _HomeAction(
            title: "Get the children's school records",
            sub: 'Sami, Nour · ask before you leave',
            route: '/tasks/pre-kids-records',
          ),
        ];
        bannerCard = Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFE2ECEB),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Arrival day walkthrough',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'What happens at Pearson Airport: immigration counter, goods to declare and B4 forms.',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => context.push('/tasks/pre-arrival-day'),
                child: const Text(
                  'Airport walkthrough',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF123332),
                  ),
                ),
              ),
            ],
          ),
        );
        break;

      case StageHomeVariant.settled:
        tag = 'MONTH 5 IN CANADA';
        subtitle =
            'The first rush is over. Now: taxes, credit, work and a family doctor.';
        heroCard = Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF123332),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Living in Mississauga · Stage 7 of 10',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 13,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Settling in',
                style: TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '32 of 52 total tasks completed',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: const LinearProgressIndicator(
                  value: 0.61,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        );
        actionHeader = 'Focus for months 4 to 12';
        actionHeaderLink = 'All tasks';
        actionHeaderRoute = '/journey';
        actions = const [
          _HomeAction(
            title: 'File your first tax return',
            sub: 'Unlocks CCB, GST credit & Ontario Trillium',
            route: '/tasks/task-tax-return',
          ),
          _HomeAction(
            title: 'Build Canadian credit history',
            sub: 'Secured card & credit habits',
            route: '/tasks/task-credit',
          ),
          _HomeAction(
            title: 'Bridge training & job search',
            sub: 'Ontario bridge programs for professionals',
            route: '/tasks/task-bridging',
          ),
          _HomeAction(
            title: 'Find a family doctor or clinic',
            sub: 'Health Care Connect Ontario',
            route: '/tasks/task-doctor',
          ),
        ];
        bannerCard = Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFE2ECEB),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Check in with your settlement worker',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Review your progress, get tax filing advice, and update family priorities.',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => context.push('/help'),
                child: const Text(
                  'Book a check-in',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF123332),
                  ),
                ),
              ),
            ],
          ),
        );
        break;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Greeting
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tag,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                      color: Color(0xFFA82227),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Good evening, Layla',
                    style: TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.08,
                      color: Color(0xFF123332),
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        height: 1.45,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 14),

              // Hero card
              heroCard,
              const SizedBox(height: 14),

              // Actions section header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    actionHeader,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF123332),
                    ),
                  ),
                  InkWell(
                    onTap: () => context.push(actionHeaderRoute),
                    child: Text(
                      actionHeaderLink,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF123332),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Actions card list
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: actions.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final action = entry.value;
                    final isLast = idx == actions.length - 1;

                    return InkWell(
                      onTap: () => context.push(action.route),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          border: isLast
                              ? null
                              : const Border(
                                  bottom: BorderSide(color: Color(0xFFEAEAEC)),
                                ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE2ECEB),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${idx + 1}',
                                style: const TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF123332),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    action.title,
                                    style: const TextStyle(
                                      fontFamily: 'IBM Plex Sans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF123332),
                                    ),
                                  ),
                                  if (action.sub.isNotEmpty) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      action.sub,
                                      style: const TextStyle(
                                        fontFamily: 'IBM Plex Sans',
                                        fontSize: 13,
                                        color: Color(0xFF5A5F6B),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              size: 18,
                              color: Color(0xFF7A7A83),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              // Banner card
              bannerCard,
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeAction {
  final String title;
  final String sub;
  final String route;

  const _HomeAction({
    required this.title,
    required this.sub,
    required this.route,
  });
}
