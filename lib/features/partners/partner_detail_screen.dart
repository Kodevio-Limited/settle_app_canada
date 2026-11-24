import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PartnerDetailScreen extends StatelessWidget {
  final String partnerName;
  final String category;

  const PartnerDetailScreen({
    super.key,
    this.partnerName = '[Partner bank]',
    this.category = 'newcomer package',
  });

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF123332);
    const borderCard = Color(0xFFDEDEE2);
    const bulletRed = Color(0xFFCA292E);
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
                        context.go('/tasks/bank');
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
                'SPONSORED PARTNER',
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
                '$partnerName $category',
                style: const TextStyle(
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
                'Sponsored · shown on: Open a bank account, Start building credit',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 15,
                  height: 1.45,
                  color: textMuted,
                ),
              ),
              const SizedBox(height: 16),

              // Paid placement note
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2ECEB),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'This is a paid placement',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryDark,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$partnerName pays Settle to appear here. It doesn\'t change your plan or the official steps, and it never sees your answers.',
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: primaryDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => context.push('/how-partners'),
                      child: const Text(
                        'How we choose partners',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: primaryDark,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // What they offer newcomers
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderCard),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'What they offer newcomers',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: primaryDark,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildBullet('[Offer details from the partner, reviewed by Settle]', bulletRed),
                    _buildBullet('[Languages spoken at partner branches]', bulletRed),
                    _buildBullet('[Fees and conditions, in plain language]', bulletRed),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Branches near you
              const Text(
                'Their branches near you',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: primaryDark,
                ),
              ),
              const SizedBox(height: 10),
              _buildBranchTile(context, '1', '$partnerName · Square One', '2.4 km · Open now'),
              const SizedBox(height: 8),
              _buildBranchTile(context, '2', '$partnerName · Hurontario', '1.7 km · Open now'),
              const SizedBox(height: 16),

              // Primary visit CTA
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Visiting $partnerName website (external link)...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryDark,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Visit $partnerName\'s website',
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'You leave Settle. Nothing you told Settle is shared.',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 13,
                    color: textMuted,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Free help banner
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
                    InkWell(
                      onTap: () => context.push('/tasks/bank'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Color(0xFFEAEAEC))),
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Compare all banks yourself',
                                    style: TextStyle(
                                      fontFamily: 'IBM Plex Sans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: primaryDark,
                                    ),
                                  ),
                                  Text(
                                    'Financial Consumer Agency of Canada',
                                    style: TextStyle(
                                      fontFamily: 'IBM Plex Sans',
                                      fontSize: 13,
                                      color: textSubtle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.chevron_right_rounded, color: Color(0xFF7A7A83), size: 20),
                          ],
                        ),
                      ),
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

  Widget _buildBullet(String text, Color bulletColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 8, right: 10),
            decoration: BoxDecoration(
              color: bulletColor,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 15,
                height: 1.45,
                color: Color(0xFF3B4747),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBranchTile(BuildContext context, String num, String name, String sub) {
    return InkWell(
      onTap: () => context.push('/location-detail'),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFDEDEE2)),
        ),
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF123332),
              ),
              alignment: Alignment.center,
              child: Text(
                num,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF123332),
                    ),
                  ),
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
            const Icon(Icons.chevron_right_rounded, color: Color(0xFF7A7A83), size: 20),
          ],
        ),
      ),
    );
  }
}
