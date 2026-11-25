import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF123332);
    const textMuted = Color(0xFF3B4747);
    const badgeRed = Color(0xFFA82227);
    const borderCard = Color(0xFFDEDEE2);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'PAUSED FOR 3 MONTHS',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: badgeRed,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Welcome back, Layla',
                style: TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  fontWeight: FontWeight.w800,
                  fontSize: 34,
                  height: 1.05,
                  letterSpacing: -0.8,
                  color: primaryDark,
                ),
              ),
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'أهلاً بعودتك',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 18,
                    color: textMuted,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'A lot can change in three months. Before you jump back in:',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 16,
                  height: 1.5,
                  color: textMuted,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderCard),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  children: [
                    _buildStatRow('Steps updated while you were away', '3'),
                    const Divider(color: Color(0xFFEEEEF0), height: 20),
                    _buildStatRow('Tasks still open', '33'),
                    const Divider(color: Color(0xFFEEEEF0), height: 20),
                    _buildStatRow('Reminders', 'Off', valColor: const Color(0xFF5A5F6B)),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => context.push('/life-event'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryDark,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Check my answers first',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () => context.go('/home'),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFC8C8CE)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    foregroundColor: primaryDark,
                  ),
                  child: const Text(
                    'Resume where I left off',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value, {Color? valColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'IBM Plex Sans',
              fontSize: 15,
              color: Color(0xFF123332),
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'IBM Plex Sans',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: valColor ?? const Color(0xFF123332),
          ),
        ),
      ],
    );
  }
}
