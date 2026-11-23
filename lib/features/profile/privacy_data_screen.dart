import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class PrivacyDataScreen extends StatefulWidget {
  const PrivacyDataScreen({super.key});

  @override
  State<PrivacyDataScreen> createState() => _PrivacyDataScreenState();
}

class _PrivacyDataScreenState extends State<PrivacyDataScreen> {
  bool _nearbyServices = true;
  bool _anonymousStats = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: InkWell(
                      onTap: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/settings');
                        }
                      },
                      borderRadius: BorderRadius.circular(22),
                      child: const SizedBox(
                        width: 44,
                        height: 44,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Privacy & my data',
                    style: TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF123332),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // WHAT WE KEEP
              const Padding(
                padding: EdgeInsets.only(left: 4, bottom: 6),
                child: Text(
                  'WHAT WE KEEP',
                  style: TextStyle(
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
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    _buildDataRow('Email for sign-in', showBorder: true),
                    _buildDataRow(
                      'City, stage, arrival month',
                      actionLabel: 'Edit',
                      onActionTap: () => context.push('/onboarding/destination'),
                      showBorder: true,
                    ),
                    _buildDataRow(
                      'Status category',
                      actionLabel: 'Remove',
                      onActionTap: () => context.push('/status'),
                      showBorder: true,
                    ),
                    _buildDataRow(
                      'Family nicknames & age ranges',
                      actionLabel: 'Edit',
                      onActionTap: () => context.push('/family'),
                      showBorder: true,
                    ),
                    _buildDataRow('Task ticks & reminders', showBorder: false),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // NEVER COLLECTED (Banner)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E4E5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Never collected',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF7A1A1E),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Documents or photos · passport, UCI, SIN or file numbers · birthdates · medical records · precise location',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: Color(0xFF5C1518),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Toggle Switches
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nearby services',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF123332),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Approximate, only while app is open',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF5A5F6B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            value: _nearbyServices,
                            activeColor: const Color(0xFF2E6B4F),
                            onChanged: (val) => setState(() => _nearbyServices = val),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFEAEAEC)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Anonymous usage stats',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF123332),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'No tracking, no ads, ever',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF5A5F6B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            value: _anonymousStats,
                            activeColor: const Color(0xFF2E6B4F),
                            onChanged: (val) => setState(() => _anonymousStats = val),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Download button
              InkWell(
                onTap: () => context.push('/data-export'),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFF123332)),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Download a copy of my data',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF123332),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Footer Note with links
              Wrap(
                children: [
                  const Text(
                    'Stored in Canada [confirm with hosting provider]. ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF5A5F6B),
                    ),
                  ),
                  InkWell(
                    onTap: () => context.push('/deactivate'),
                    child: const Text(
                      'Delete my account',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF123332),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              InkWell(
                onTap: () {},
                child: const Text(
                  'No app? Delete on the web',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF123332),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataRow(
    String label, {
    String? actionLabel,
    VoidCallback? onActionTap,
    required bool showBorder,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 48),
      padding: const EdgeInsets.symmetric(vertical: 10),
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
          if (actionLabel != null && onActionTap != null)
            InkWell(
              onTap: onActionTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  actionLabel,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF123332),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
