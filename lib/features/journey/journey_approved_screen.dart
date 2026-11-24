import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JourneyApprovedScreen extends StatelessWidget {
  const JourneyApprovedScreen({super.key});

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
              // Header
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF123332)),
                  onPressed: () => context.pop(),
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(minWidth: 44, minHeight: 44),
                ),
              ),
              const SizedBox(height: 8),

              // Title block
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'YOUR JOURNEY',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                      color: Color(0xFFA82227),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Before you move',
                    style: TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.08,
                      color: Color(0xFF123332),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '12 tasks to complete before you board your flight to Canada.',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      height: 1.45,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Stage progress banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF123332),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Stage 0 of 10 · Before landing',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Getting ready to fly',
                      style: TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0.25,
                        backgroundColor: Colors.white24,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '3 of 12 tasks done',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Group 1: High Priority (Free Pre-arrival & Docs)
              _buildTaskGroup(
                context: context,
                title: 'High priority · First weeks',
                tasks: const [
                  _JourneyTask(
                    title: 'Sign up for free pre-arrival services',
                    sub: 'Funded by IRCC · Must register before landing',
                    route: '/tasks/pre-services',
                  ),
                  _JourneyTask(
                    title: 'Get your travel documents ready',
                    sub: 'Check COPR details, validity & passport pages',
                    route: '/tasks/pre-travel-docs',
                  ),
                  _JourneyTask(
                    title: "Get children's school & vaccine records",
                    sub: 'Immunization history & certified translations',
                    route: '/tasks/pre-kids-records',
                  ),
                  _JourneyTask(
                    title: "Plan your family's medications",
                    sub: '90-day supply & doctor prescription letters',
                    route: '/tasks/pre-medications',
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Group 2: Paperwork & Logistics
              _buildTaskGroup(
                context: context,
                title: 'Paperwork & preparations',
                tasks: const [
                  _JourneyTask(
                    title: 'Driving record and claims experience letter',
                    sub: 'From home country insurer to lower Ontario rates',
                    route: '/tasks/task-driving-record',
                  ),
                  _JourneyTask(
                    title: 'Official certified translations',
                    sub: 'Birth, marriage & degree certificates in English',
                    route: '/tasks/task-translations',
                  ),
                  _JourneyTask(
                    title: 'Plan money for your first months',
                    sub: 'CAD cash flow, wire transfers & settlement funds',
                    route: '/tasks/wait-savings',
                  ),
                  _JourneyTask(
                    title: "List what you're bringing and unaccompanied goods",
                    sub: 'Form B4 / BSF186 for Canadian customs',
                    route: '/tasks/pre-goods',
                  ),
                  _JourneyTask(
                    title: 'Book temporary housing for first weeks',
                    sub: 'Short-term furnished rental or hotel near transit',
                    route: '/tasks/pre-temp-housing',
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Group 3: Arrival & First 72 Hours
              _buildTaskGroup(
                context: context,
                title: 'Arrival countdown',
                tasks: const [
                  _JourneyTask(
                    title: 'Know what happens at the airport',
                    sub: 'Pearson immigration booth, CBSA & luggage hall',
                    route: '/tasks/pre-arrival-day',
                  ),
                  _JourneyTask(
                    title: 'Plan your first 72 hours in Canada',
                    sub: 'SIM card, cash, groceries & emergency contacts',
                    route: '/tasks/pre-first72',
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 10 stages locked preview card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEC),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'After you arrive · 10 stages',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Paperwork, housing, schools, car, insurance, health, money, work and community. Opens when you tell us you have landed.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () => context.push('/journey'),
                      child: const Text(
                        'Preview the stages',
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
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskGroup({
    required BuildContext context,
    required String title,
    required List<_JourneyTask> tasks,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'IBM Plex Sans',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF123332),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFDEDEE2)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: tasks.asMap().entries.map((entry) {
              final idx = entry.key;
              final task = entry.value;
              final isLast = idx == tasks.length - 1;

              return InkWell(
                onTap: () => context.push(task.route),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
                              task.title,
                              style: const TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF123332),
                              ),
                            ),
                            if (task.sub.isNotEmpty) ...[
                              const SizedBox(height: 2),
                              Text(
                                task.sub,
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
      ],
    );
  }
}

class _JourneyTask {
  final String title;
  final String sub;
  final String route;

  const _JourneyTask({
    required this.title,
    required this.sub,
    required this.route,
  });
}
