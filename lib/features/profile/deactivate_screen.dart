import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeactivateScreen extends StatelessWidget {
  const DeactivateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF123332);
    const textMuted = Color(0xFF3B4747);
    const borderCard = Color(0xFFDEDEE2);
    const dangerColor = Color(0xFFA3261C);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 8),
              const Text(
                'Pause or delete your account',
                style: TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  letterSpacing: -0.6,
                  color: primaryDark,
                ),
              ),
              const SizedBox(height: 16),
              // Pause Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: borderCard),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pause',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: primaryDark,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Stop reminders and hide your plan. Your answers stay saved, so you can pick up where you left off by signing in again.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        height: 1.5,
                        color: textMuted,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () => context.push('/paused'),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: primaryDark),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          foregroundColor: primaryDark,
                        ),
                        child: const Text(
                          'Pause my account',
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
              const SizedBox(height: 16),
              // Delete Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: borderCard),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Delete',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: dangerColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Permanently delete your account, household answers, tasks, checklists and reminders. This can\'t be undone.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        height: 1.5,
                        color: textMuted,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => context.push('/delete-confirm'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: dangerColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Delete my account…',
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
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => context.push('/data-export'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Download a copy of my data first',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: primaryDark,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.push('/notification-settings'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Just want fewer reminders?',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: primaryDark,
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
}
