import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HowPartnersScreen extends StatelessWidget {
  const HowPartnersScreen({super.key});

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
                        context.go('/settings');
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

              // Title section
              const Text(
                'ABOUT SETTLE',
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
                'How we choose partners',
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
                'Settle is free for newcomers. Some partners pay to appear — here\'s how that works.',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 15,
                  height: 1.45,
                  color: textMuted,
                ),
              ),
              const SizedBox(height: 16),

              // Our rules card
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
                      'Our rules',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: primaryDark,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildBullet('Official government steps always come first and are never paid.', bulletRed),
                    _buildBullet('Free help (settlement agencies, legal clinics) comes next and is never paid.', bulletRed),
                    _buildBullet('Sponsored partners are labelled "Sponsored" and shown last.', bulletRed),
                    _buildBullet('Partners never see your answers, your family or your location.', bulletRed),
                    _buildBullet('Partners can\'t change, reorder or hide official steps.', bulletRed),
                    _buildBullet('We never take referral fees from lawyers or immigration consultants.', bulletRed),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // How a partner gets listed
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
                      'How a partner gets listed',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: primaryDark,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildBullet('They serve newcomers in the area shown', bulletRed),
                    _buildBullet('They\'re licensed or registered where the law requires it', bulletRed),
                    _buildBullet('Their offer is checked for clear, fair terms', bulletRed),
                    _buildBullet('They can be removed if newcomers report problems', bulletRed),
                  ],
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
                      onTap: () => context.push('/report-outdated'),
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
                                    'Report a problem with a partner',
                                    style: TextStyle(
                                      fontFamily: 'IBM Plex Sans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: primaryDark,
                                    ),
                                  ),
                                  Text(
                                    'We review every report',
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
}
