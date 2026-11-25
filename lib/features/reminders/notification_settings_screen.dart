import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool _plannedTasks = true;
  bool _deadlines = true;
  bool _stepChanges = true;
  bool _weeklyCheckin = false;

  bool _iphoneNotifications = true;
  bool _weeklyEmail = false;

  TimeOfDay _quietFrom = const TimeOfDay(hour: 21, minute: 0);
  TimeOfDay _quietUntil = const TimeOfDay(hour: 8, minute: 0);

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
                  Text(
                    'Reminders & alerts',
                    style: const TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF123332),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Section 1: REMIND ME ABOUT
              const Padding(
                padding: EdgeInsets.only(left: 4, bottom: 6),
                child: Text(
                  'REMIND ME ABOUT',
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
                    _buildSwitchRow(
                      title: 'Tasks I planned',
                      value: _plannedTasks,
                      onChanged: (v) => setState(() => _plannedTasks = v),
                      showBorder: true,
                    ),
                    _buildSwitchRow(
                      title: 'Deadlines and time windows',
                      value: _deadlines,
                      onChanged: (v) => setState(() => _deadlines = v),
                      showBorder: true,
                    ),
                    _buildSwitchRow(
                      title: "When a step I'm working on changes",
                      subtitle: 'After we verify the official update',
                      value: _stepChanges,
                      onChanged: (v) => setState(() => _stepChanges = v),
                      showBorder: true,
                    ),
                    _buildSwitchRow(
                      title: 'Weekly check-in',
                      value: _weeklyCheckin,
                      onChanged: (v) => setState(() => _weeklyCheckin = v),
                      showBorder: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Section 2: HOW
              const Padding(
                padding: EdgeInsets.only(left: 4, bottom: 6),
                child: Text(
                  'HOW',
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
                    _buildSwitchRow(
                      title: 'iPhone notifications',
                      value: _iphoneNotifications,
                      onChanged: (v) => setState(() => _iphoneNotifications = v),
                      showBorder: true,
                    ),
                    _buildSwitchRow(
                      title: 'Weekly email summary',
                      value: _weeklyEmail,
                      onChanged: (v) => setState(() => _weeklyEmail = v),
                      showBorder: true,
                    ),
                    _buildSwitchRow(
                      title: 'SMS or WhatsApp',
                      subtitle: 'Coming later',
                      value: false,
                      enabled: false,
                      onChanged: null,
                      showBorder: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Section 3: QUIET HOURS
              const Padding(
                padding: EdgeInsets.only(left: 4, bottom: 6),
                child: Text(
                  'QUIET HOURS',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'From',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF123332),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final picked = await showTimePicker(
                                context: context,
                                initialTime: _quietFrom,
                              );
                              if (picked != null) {
                                setState(() => _quietFrom = picked);
                              }
                            },
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: const Color(0xFFC8C8CE)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${_quietFrom.hour.toString().padLeft(2, '0')}:${_quietFrom.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF123332),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFEAEAEC)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Until',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF123332),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final picked = await showTimePicker(
                                context: context,
                                initialTime: _quietUntil,
                              );
                              if (picked != null) {
                                setState(() => _quietUntil = picked);
                              }
                            },
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: const Color(0xFFC8C8CE)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${_quietUntil.hour.toString().padLeft(2, '0')}:${_quietUntil.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF123332),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Footer Note
              const Text(
                'Messages are only about your plan. No marketing, ever.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.45,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchRow({
    required String title,
    String? subtitle,
    required bool value,
    bool enabled = true,
    required ValueChanged<bool>? onChanged,
    required bool showBorder,
  }) {
    return Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    color: enabled ? const Color(0xFF123332) : const Color(0xFF8A8A93),
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF5A5F6B),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: const Color(0xFF2E6B4F),
            activeTrackColor: const Color(0xFF2E6B4F).withValues(alpha: 0.5),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFF8A8A93),
            onChanged: enabled ? onChanged : null,
          ),
        ],
      ),
    );
  }
}
