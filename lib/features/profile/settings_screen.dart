import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Me',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF123332),
                        letterSpacing: -0.6,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // User Profile Card
                    InkWell(
                      onTap: () => context.push('/edit-profile'),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFDEDEE2)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF123332),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'L',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Layla',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF123332),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Signed in with Apple · private relay email',
                                    style: TextStyle(
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
                    ),
                    const SizedBox(height: 12),

                    // My Family Card
                    InkWell(
                      onTap: () => context.push('/family'),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2ECEB),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.people_alt_outlined,
                              size: 24,
                              color: Color(0xFF123332),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'My family',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF123332),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "5 people · each person's tasks and progress",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF3B4747),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 20,
                              color: Color(0xFF7A7A83),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Section: MY PLAN
                    _buildSectionHeader('My plan'),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildNavRow(
                            'Edit my answers',
                            trailingText: 'Mississauga · PR',
                            showBorder: true,
                            onTap: () => context.push('/onboarding/destination'),
                          ),
                          _buildNavRow(
                            'Family members',
                            trailingText: '5',
                            showBorder: true,
                            onTap: () => context.push('/family'),
                          ),
                          _buildNavRow(
                            'Something changed?',
                            trailingText: 'Move, job, baby…',
                            showBorder: false,
                            onTap: () => context.push('/life-event'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Section: APP
                    _buildSectionHeader('App'),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildNavRow(
                            'Reminders & quiet hours',
                            trailingText: 'On',
                            showBorder: true,
                            onTap: () => context.push('/notification-settings'),
                          ),
                          _buildNavRow(
                            'Language & accessibility',
                            trailingText: 'English',
                            showBorder: true,
                            onTap: () => context.push('/language-access'),
                          ),
                          _buildNavRow(
                            'Privacy & my data',
                            trailingText: '›',
                            showBorder: false,
                            onTap: () => context.push('/privacy-data'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Section: ABOUT
                    _buildSectionHeader('About'),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          _buildNavRow(
                            'How our guidance works',
                            trailingText: '›',
                            showBorder: true,
                            onTap: () => context.push('/how-guidance'),
                          ),
                          _buildNavRow(
                            'Terms & Privacy Policy',
                            trailingText: '›',
                            showBorder: false,
                            onTap: () => context.push('/privacy-policy'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Bottom Links: Sign Out & Pause/Delete
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => context.push('/sign-out-confirm'),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Sign out',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF123332),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => context.push('/deactivate'),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Pause or delete account',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFA3261C),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 6),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: Color(0xFF5A5F6B),
        ),
      ),
    );
  }

  Widget _buildNavRow(
    String label, {
    required String trailingText,
    required bool showBorder,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(bottom: BorderSide(color: Color(0xFFEAEAEC)))
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF123332),
                ),
              ),
            ),
            Text(
              trailingText,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF5A5F6B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
