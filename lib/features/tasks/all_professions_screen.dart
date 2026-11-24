import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllProfessionsScreen extends StatelessWidget {
  const AllProfessionsScreen({super.key});

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
              // Back button
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
                    'WORK & CREDENTIALS · ONTARIO',
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
                    'Jobs that need a licence',
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
                    "45 regulated professions and compulsory trades in Ontario. Not listed? Most jobs don't need a licence — but check Ontario's full list.",
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 14,
                      height: 1.45,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Health · 21
              _buildSection(
                context: context,
                category: 'Health · 21',
                items: const [
                  _ProfessionItem('Registered nurse', '/tasks/pathway-nurse'),
                  _ProfessionItem('Physician', '/tasks/pathway-physician'),
                  _ProfessionItem('Pharmacist', '/tasks/pathway-pharmacist'),
                  _ProfessionItem('Dentist', '/tasks/pathway-dentist'),
                  _ProfessionItem(
                      'Dental hygienist', '/tasks/pathway-dental-hygienist'),
                  _ProfessionItem('Physiotherapist', '/tasks/pathway-physio'),
                  _ProfessionItem(
                      'Occupational therapist', '/tasks/pathway-ot'),
                  _ProfessionItem('Medical laboratory technologist',
                      '/tasks/pathway-mlt'),
                  _ProfessionItem('Medical radiation technologist',
                      '/tasks/pathway-mrt'),
                  _ProfessionItem(
                      'Respiratory therapist', '/tasks/pathway-rt'),
                  _ProfessionItem('Midwife', '/tasks/pathway-midwife'),
                  _ProfessionItem('Dietitian', '/tasks/pathway-dietitian'),
                  _ProfessionItem(
                      'Psychologist', '/tasks/pathway-psychologist'),
                  _ProfessionItem(
                      'Psychotherapist', '/tasks/pathway-psychotherapist'),
                  _ProfessionItem('Optometrist', '/tasks/pathway-optometrist'),
                  _ProfessionItem('Optician', '/tasks/pathway-optician'),
                  _ProfessionItem(
                      'Chiropractor', '/tasks/pathway-chiropractor'),
                  _ProfessionItem('Massage therapist', '/tasks/pathway-massage'),
                  _ProfessionItem(
                      'Kinesiologist', '/tasks/pathway-kinesiologist'),
                  _ProfessionItem(
                      'Audiologist or speech-language pathologist',
                      '/tasks/pathway-audiologist-slp'),
                  _ProfessionItem('Denturist', '/tasks/pathway-denturist'),
                ],
              ),
              const SizedBox(height: 20),

              // Education & social services · 3
              _buildSection(
                context: context,
                category: 'Education & social services · 3',
                items: const [
                  _ProfessionItem('Teacher (K–12)', '/tasks/pathway-teacher'),
                  _ProfessionItem(
                      'Early childhood educator', '/tasks/pathway-ece'),
                  _ProfessionItem(
                      'Social worker', '/tasks/pathway-social-worker'),
                ],
              ),
              const SizedBox(height: 20),

              // Business, law & science · 11
              _buildSection(
                context: context,
                category: 'Business, law & science · 11',
                items: const [
                  _ProfessionItem('Engineer (P.Eng.)', '/tasks/engineer-pathway'),
                  _ProfessionItem('Lawyer', '/tasks/pathway-lawyer'),
                  _ProfessionItem('Chartered professional accountant',
                      '/tasks/pathway-cpa'),
                  _ProfessionItem('Paralegal', '/tasks/pathway-paralegal'),
                  _ProfessionItem('Architect', '/tasks/pathway-architect'),
                  _ProfessionItem('Veterinarian', '/tasks/pathway-vet'),
                  _ProfessionItem('Land surveyor', '/tasks/pathway-surveyor'),
                  _ProfessionItem(
                      'Geoscientist', '/tasks/pathway-geoscientist'),
                  _ProfessionItem(
                      'Real estate agent', '/tasks/pathway-real-estate'),
                  _ProfessionItem(
                      'Life insurance agent', '/tasks/pathway-insurance'),
                  _ProfessionItem(
                      'Mortgage agent', '/tasks/pathway-mortgage'),
                ],
              ),
              const SizedBox(height: 20),

              // Skilled trades · 10
              _buildSection(
                context: context,
                category: 'Skilled trades · 10',
                items: const [
                  _ProfessionItem('Electrician', '/tasks/pathway-electrician'),
                  _ProfessionItem('Plumber', '/tasks/pathway-plumber'),
                  _ProfessionItem(
                      'Refrigeration and air conditioning mechanic',
                      '/tasks/pathway-refrigeration'),
                  _ProfessionItem(
                      'Sheet metal worker', '/tasks/pathway-sheet-metal'),
                  _ProfessionItem('Steamfitter', '/tasks/pathway-steamfitter'),
                  _ProfessionItem('Automotive service technician',
                      '/tasks/pathway-auto-tech'),
                  _ProfessionItem('Auto body and collision repairer',
                      '/tasks/pathway-auto-body'),
                  _ProfessionItem(
                      'Truck and coach technician', '/tasks/pathway-truck-coach'),
                  _ProfessionItem('Hairstylist', '/tasks/pathway-hairstylist'),
                  _ProfessionItem(
                      'Mobile crane operator (hoisting engineer)',
                      '/tasks/pathway-crane'),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String category,
    required List<_ProfessionItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
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
            children: items.asMap().entries.map((entry) {
              final idx = entry.key;
              final item = entry.value;
              final isLast = idx == items.length - 1;

              return InkWell(
                onTap: () => context.push(item.route),
                child: Container(
                  constraints: const BoxConstraints(minHeight: 48),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    border: isLast
                        ? null
                        : const Border(
                            bottom: BorderSide(color: Color(0xFFEAEAEC)),
                          ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 15,
                            color: Color(0xFF123332),
                          ),
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

class _ProfessionItem {
  final String name;
  final String route;

  const _ProfessionItem(this.name, this.route);
}
