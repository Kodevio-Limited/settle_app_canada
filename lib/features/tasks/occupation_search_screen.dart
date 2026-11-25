import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OccupationSearchScreen extends StatefulWidget {
  const OccupationSearchScreen({super.key});

  @override
  State<OccupationSearchScreen> createState() => _OccupationSearchScreenState();
}

class _OccupationSearchScreenState extends State<OccupationSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: BackButton(
                  color: const Color(0xFF123332),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/stage-work');
                    }
                  },
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
                    'Does your job need a licence here?',
                    style: TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.1,
                      color: Color(0xFF123332),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Some jobs need a licence or certificate from a regulator before you can work in them — or use their title.',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 14,
                      height: 1.45,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Search bar
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFC8C8CE)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 20, color: Color(0xFF5A5F6B)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (val) {
                          setState(() {
                            _searchQuery = val.toLowerCase().trim();
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search your job, e.g. nurse, electrician',
                          hintStyle: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 15,
                            color: Color(0xFF5A5F6B),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
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
              const SizedBox(height: 14),

              // Omar's profession card
              if (_searchQuery.isEmpty || 'civil engineer'.contains(_searchQuery) || 'omar'.contains(_searchQuery)) ...[
                InkWell(
                  onTap: () => context.push('/occupation-pathway'),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF123332),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Omar's profession",
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFCFE3E1),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Civil engineer',
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7E4E5),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'Licence needed',
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF7A1A1E),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'P.Eng. licence · Professional Engineers Ontario',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 14,
                            color: Color(0xFFCFE3E1),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'See the full pathway →',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Health section
              _buildCategorySection(
                title: 'HEALTH',
                jobs: const [
                  _JobItem('Registered nurse', 'RN registration · College of Nurses of Ontario'),
                  _JobItem('Physician', 'Certificate of registration · CPSO'),
                  _JobItem('Pharmacist', 'Registration · Ontario College of Pharmacists'),
                  _JobItem('Dentist', 'Registration · Royal College of Dental Surgeons of Ontario'),
                ],
              ),
              const SizedBox(height: 14),

              // Education section
              _buildCategorySection(
                title: 'EDUCATION, CARE & SOCIAL WORK',
                jobs: const [
                  _JobItem('Teacher (K–12)', 'Certificate of Qualification · Ontario College of Teachers'),
                  _JobItem('Early childhood educator', 'RECE registration · College of ECE'),
                  _JobItem('Social worker', 'Registration · College of Social Workers and Social Service Workers'),
                ],
              ),
              const SizedBox(height: 14),

              // Law & Finance
              _buildCategorySection(
                title: 'LAW & FINANCE',
                jobs: const [
                  _JobItem('Lawyer', 'NCA assessment, then licence · Law Society of Ontario'),
                  _JobItem('Public accountant', 'CPA designation + public accounting licence · CPA Ontario'),
                ],
              ),
              const SizedBox(height: 14),

              // Skilled trades
              _buildCategorySection(
                title: 'SKILLED TRADES',
                jobs: const [
                  _JobItem('Electrician (construction & maintenance)', 'Certificate of Qualification · Skilled Trades Ontario'),
                  _JobItem('Plumber', 'Certificate of Qualification · Skilled Trades Ontario'),
                ],
              ),
              const SizedBox(height: 14),

              // Not regulated callout
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3EFE8),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.check, size: 20, color: Color(0xFF2E6B4F)),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Not regulated? ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'Most jobs — like software developer, marketing or sales — need no licence. You can apply right away.',
                            ),
                          ],
                        ),
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 13,
                          height: 1.45,
                          color: Color(0xFF1F4A36),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Footnote
              const Text(
                'Showing common jobs. The full list of 45 is below. Source: Ontario\'s Office of the Fairness Commissioner and each regulator · verified [DATE].',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 12,
                  height: 1.45,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 12),

              // See all 45 regulated jobs button
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Showing all 45 regulated jobs in Ontario.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2ECEB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'See all 45 regulated jobs',
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF123332),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Health, law, business, science and trades',
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 13,
                                color: Color(0xFF3B4747),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, size: 20, color: Color(0xFF7A7A83)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection({
    required String title,
    required List<_JobItem> jobs,
  }) {
    final filtered = _searchQuery.isEmpty
        ? jobs
        : jobs.where((j) => j.title.toLowerCase().contains(_searchQuery) || j.sub.toLowerCase().contains(_searchQuery)).toList();

    if (filtered.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 6),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'IBM Plex Sans',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: Color(0xFF5A5F6B),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFDEDEE2)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: List.generate(filtered.length, (idx) {
              final job = filtered[idx];
              final isLast = idx == filtered.length - 1;
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: isLast ? null : const Border(bottom: BorderSide(color: Color(0xFFEAEAEC))),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.title,
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF123332),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            job.sub,
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
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _JobItem {
  final String title;
  final String sub;
  const _JobItem(this.title, this.sub);
}
