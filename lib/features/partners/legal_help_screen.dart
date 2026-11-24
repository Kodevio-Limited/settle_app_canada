import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LegalHelpScreen extends StatelessWidget {
  const LegalHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF123332);
    const borderCard = Color(0xFFDEDEE2);
    const textMuted = Color(0xFF3B4747);
    const textSubtle = Color(0xFF5A5F6B);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/help');
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: primaryDark),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                    alignment: Alignment.centerLeft,
                  ),
                  IconButton(
                    onPressed: () => context.push('/task-actions/dismiss'),
                    icon: const Icon(Icons.more_horiz, size: 22, color: primaryDark),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Title
              const Text(
                'TRUSTED HELP',
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
                'Legal and immigration help',
                style: TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  height: 1.08,
                  letterSpacing: -0.6,
                  color: primaryDark,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Free options first. Paid professionals are licensed, labelled and never paid per referral.',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 15,
                  height: 1.45,
                  color: textMuted,
                ),
              ),
              const SizedBox(height: 16),

              // Advice disclaimer banner
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2ECEB),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settle gives no immigration or legal advice',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryDark,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'For questions about your own status or application, talk to a lawyer or a licensed consultant.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: primaryDark,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Free help section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderCard),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Free help',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: primaryDark,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3EFE8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Free',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F4A36),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _buildHelpRow(
                      context,
                      title: 'Law Society Referral Service',
                      subtitle: 'Free 30-minute consultation · ask for your language',
                    ),
                    _buildHelpRow(
                      context,
                      title: 'Mississauga Community Legal Services',
                      subtitle: 'Free for low-income households · 905-896-2050',
                    ),
                    _buildHelpRow(
                      context,
                      title: 'Legal Aid Ontario',
                      subtitle: 'Refugee and some immigration matters',
                      showBorder: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Check anyone before you pay
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderCard),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Check anyone before you pay',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: primaryDark,
                      ),
                    ),
                    const SizedBox(height: 6),
                    _buildLinkRow('Consultant register (CICC)'),
                    _buildLinkRow('Lawyer and paralegal directory (Law Society)', showBorder: false),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Licensed professionals (Sponsored)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF8A8A93), style: BorderStyle.solid),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Licensed professionals',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: primaryDark,
                          ),
                        ),
                        InkWell(
                          onTap: () => context.push('/how-partners'),
                          child: const Text(
                            'How we choose partners',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: primaryDark,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Paid placements. Shown after the official and free options. Partners never see your answers.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 13,
                        height: 1.4,
                        color: textMuted,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildSponsoredProCard(
                      context,
                      name: '[Immigration law firm] · Mississauga',
                      sub: 'Licensed lawyer · Arabic, French, English · flat-fee consultations',
                    ),
                    const SizedBox(height: 8),
                    _buildSponsoredProCard(
                      context,
                      name: '[Licensed consultant] · R000000',
                      sub: 'CICC licensee · register: college-ic.ca',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'General information to help you organize. Not immigration, legal or financial advice. Always confirm on the official source.',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 12,
                  height: 1.45,
                  color: textSubtle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpRow(
    BuildContext context, {
    required String title,
    required String subtitle,
    bool showBorder = true,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: showBorder ? const Border(bottom: BorderSide(color: Color(0xFFEAEAEC))) : null,
      ),
      child: Row(
        children: [
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
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 13,
                    color: Color(0xFF5A5F6B),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFF7A7A83), size: 20),
        ],
      ),
    );
  }

  Widget _buildLinkRow(String title, {bool showBorder = true}) {
    return Container(
      constraints: const BoxConstraints(minHeight: 48),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: showBorder ? const Border(bottom: BorderSide(color: Color(0xFFEAEAEC))) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'IBM Plex Sans',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF123332),
            ),
          ),
          const Icon(Icons.north_east_rounded, size: 16, color: Color(0xFF5A5F6B)),
        ],
      ),
    );
  }

  Widget _buildSponsoredProCard(BuildContext context, {required String name, required String sub}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDEDEE2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF123332),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Sponsored',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3B4747),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            sub,
            style: const TextStyle(
              fontFamily: 'IBM Plex Sans',
              fontSize: 13,
              color: Color(0xFF5A5F6B),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: OutlinedButton(
              onPressed: () => context.push('/partner-detail'),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFC8C8CE)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                foregroundColor: const Color(0xFF123332),
              ),
              child: const Text(
                'See profile',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
