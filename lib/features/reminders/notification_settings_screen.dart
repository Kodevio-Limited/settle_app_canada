import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
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
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FigmaSubPageHeader(
                title: 'Reminders & alerts',
                onBack: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/settings');
                  }
                },
              ),
              const SizedBox(height: 18),

              const Padding(
                padding: EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  'REMIND ME ABOUT',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                    color: AppColors.dark300,
                  ),
                ),
              ),
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  'HOW',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                    color: AppColors.dark300,
                  ),
                ),
              ),
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildSwitchRow(
                      title: 'iPhone notifications',
                      value: _iphoneNotifications,
                      onChanged: (v) =>
                          setState(() => _iphoneNotifications = v),
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
              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  'QUIET HOURS',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                    color: AppColors.dark300,
                  ),
                ),
              ),
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'From',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              color: AppColors.mainFont,
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
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 38,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                color: AppColors.dark50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${_quietFrom.hour.toString().padLeft(2, '0')}:${_quietFrom.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: AppColors.divider),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Until',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              color: AppColors.mainFont,
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
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 38,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                color: AppColors.dark50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${_quietUntil.hour.toString().padLeft(2, '0')}:${_quietUntil.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
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

              const Text(
                'Messages are only about your plan. No marketing, ever.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
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
            ? const Border(bottom: BorderSide(color: AppColors.divider))
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
                    fontFamily: AppTypography.fontBody,
                    fontSize: 14.5,
                    color: enabled ? AppColors.mainFont : AppColors.dark200,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 12,
                      color: AppColors.dark300,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: Colors.white,
            activeTrackColor: AppColors.secondary,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: AppColors.dark100,
            onChanged: enabled ? onChanged : null,
          ),
        ],
      ),
    );
  }
}
