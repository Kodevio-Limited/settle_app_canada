import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF123332);
    const borderCard = Color(0xFFDEDEE2);
    const textMuted = Color(0xFF3B4747);
    const crisisRed = Color(0xFF8E1C21);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: Column(
          children: [
            // Status bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              color: const Color(0xFF3B4747),
              child: const Row(
                children: [
                  Icon(Icons.wifi_off_rounded, color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'You\'re offline. Your plan and checklists still work. Last synced 10:24 am.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Good morning, Layla',
                      style: TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                        letterSpacing: -0.6,
                        color: primaryDark,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Next 3 actions card
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: borderCard),
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your next 3 actions',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: primaryDark,
                            ),
                          ),
                          const SizedBox(height: 6),
                          _buildActionRow(
                            context,
                            title: 'Apply for your SIN',
                            subtitle: 'Available offline',
                            route: '/tasks/sin',
                            showBorder: true,
                          ),
                          _buildActionRow(
                            context,
                            title: 'Apply for Ontario health cards',
                            subtitle: 'Available offline',
                            route: '/checklist',
                            showBorder: true,
                          ),
                          _buildActionRow(
                            context,
                            title: 'Register Sami & Nour for school',
                            subtitle: 'Available offline',
                            route: '/tasks/school',
                            showBorder: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Needs a connection card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAEAEC),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(14),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Needs a connection',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: primaryDark,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Maps, opening hours and official pages. Nearby lists show your last saved results.',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 14,
                              height: 1.45,
                              color: textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Crisis banner
                    InkWell(
                      onTap: () => context.push('/crisis'),
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: crisisRed,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Text(
                          'Crisis lines work offline — tap to see them',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Try again button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Checking connection...')),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: primaryDark),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.white,
                          foregroundColor: primaryDark,
                        ),
                        child: const Text(
                          'Try again',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionRow(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String route,
    required bool showBorder,
  }) {
    return InkWell(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(bottom: BorderSide(color: Color(0xFFEAEAEC)))
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFABABB3), width: 2),
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
                      fontSize: 16,
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
          ],
        ),
      ),
    );
  }
}
