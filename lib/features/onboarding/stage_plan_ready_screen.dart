import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum StageVariant {
  exploring,
  waiting,
  approved,
}

class StagePlanReadyScreen extends StatelessWidget {
  final StageVariant variant;

  const StagePlanReadyScreen({
    super.key,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    const title = 'Your plan is ready, Layla';
    String subtitle;
    String stat1Num;
    String stat1Label;
    String stat2Num;
    String stat2Label;
    String stat3Num;
    String stat3Label;
    String listHeader;
    List<_ActionItem> actions;
    String primaryButtonText;
    String homeRoute;

    switch (variant) {
      case StageVariant.exploring:
        subtitle =
            'Built from what you told us: exploring Canada, interested in Ontario, 5 people. No deadlines — learn at your own pace.';
        stat1Num = '3';
        stat1Label = 'official pathways';
        stat2Num = '14';
        stat2Label = 'guides';
        stat3Num = '0';
        stat3Label = 'deadlines';
        listHeader = 'Start with these 3 guides';
        actions = const [
          _ActionItem(
            num: '1',
            title: 'Learn the official ways to immigrate',
            sub: 'Express Entry, PNPs, family and study',
            route: '/tasks/exp-options',
          ),
          _ActionItem(
            num: '2',
            title: 'Check a consultant or lawyer is licensed',
            sub: 'Protect yourself from immigration fraud',
            route: '/tasks/exp-representative',
          ),
          _ActionItem(
            num: '3',
            title: 'See if your profession needs a licence',
            sub: '45 regulated jobs in Ontario',
            route: '/tasks/all-professions',
          ),
        ];
        primaryButtonText = 'Go to your home screen';
        homeRoute = '/home-exploring';
        break;

      case StageVariant.waiting:
        subtitle =
            'Built from what you told us: applied for permanent residence, waiting for a decision, moving to Mississauga, 5 people.';
        stat1Num = '10';
        stat1Label = 'things to do now';
        stat2Num = '4';
        stat2Label = 'documents to find';
        stat3Num = '0';
        stat3Label = 'cost';
        listHeader = 'What you can do while you wait';
        actions = const [
          _ActionItem(
            num: '1',
            title: 'Check your application status',
            sub: 'Official tracker & processing times',
            route: '/tasks/wait-track',
          ),
          _ActionItem(
            num: '2',
            title: "Gather your family's documents",
            sub: 'Originals, translations and police certificates',
            route: '/tasks/wait-docs',
          ),
          _ActionItem(
            num: '3',
            title: 'Start credential assessment (ECA)',
            sub: 'WES, ICAS, CES or professional body',
            route: '/tasks/task-credential-assess',
          ),
        ];
        primaryButtonText = 'Go to your home screen';
        homeRoute = '/home-waiting';
        break;

      case StageVariant.approved:
        subtitle =
            'Built from what you told us: PR approved, moving to Mississauga in about 6 weeks, 5 people. Your arrival plan unlocks when you land.';
        stat1Num = '12';
        stat1Label = 'before you move';
        stat2Num = '40';
        stat2Label = 'after';
        stat3Num = '6 wks';
        stat3Label = 'target';
        listHeader = 'First 3 tasks before you board';
        actions = const [
          _ActionItem(
            num: '1',
            title: 'Sign up for free pre-arrival services',
            sub: 'Funded by IRCC · start now before landing',
            route: '/tasks/pre-services',
          ),
          _ActionItem(
            num: '2',
            title: 'Get your travel documents ready',
            sub: 'COPR, passports, visas & arrival checklist',
            route: '/tasks/pre-travel-docs',
          ),
          _ActionItem(
            num: '3',
            title: "Get children's school & vaccine records",
            sub: 'Official translations & yellow card',
            route: '/tasks/pre-kids-records',
          ),
        ];
        primaryButtonText = 'Go to your home screen';
        homeRoute = '/home-approved';
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
              // Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PLAN READY',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                      color: Color(0xFFA82227),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.08,
                      color: Color(0xFF123332),
                    ),
                  ),
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
              ),
              const SizedBox(height: 16),

              // 3-stat row
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(stat1Num, stat1Label),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildStatCard(stat2Num, stat2Label),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildStatCard(stat3Num, stat3Label),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Action List
              Text(
                listHeader,
                style: const TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 10),

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
                                action.num,
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
              const SizedBox(height: 24),

              // CTA button
              ElevatedButton(
                onPressed: () => context.go(homeRoute),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF123332),
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Text(primaryButtonText),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String num, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFDEDEE2)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            num,
            style: const TextStyle(
              fontFamily: 'Bricolage Grotesque',
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Color(0xFF123332),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'IBM Plex Sans',
              fontSize: 12,
              color: Color(0xFF5A5F6B),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionItem {
  final String num;
  final String title;
  final String sub;
  final String route;

  const _ActionItem({
    required this.num,
    required this.title,
    required this.sub,
    required this.route,
  });
}
