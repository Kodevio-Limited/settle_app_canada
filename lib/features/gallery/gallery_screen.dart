import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text(
          'Screen Navigator',
          style: TextStyle(
            fontFamily: AppTypography.fontHeading,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader('Phase 7: Trusted Help & Wellbeing (6 Screens)'),
          _buildTile(context, '7.1 Trusted help (free services directory)', '/help'),
          _buildTile(context, '7.2 Get help now (emergency & crisis lines)', '/crisis'),
          _buildTile(context, '7.3 Weekly check-in', '/check-in'),
          _buildTile(context, '7.4 Community groups near you', '/community-groups'),
          _buildTile(context, '7.5 How Settle\'s guidance works', '/how-guidance'),
          _buildTile(context, '7.6 Family conversation guide for teens', '/conversation-guide'),

          const SizedBox(height: 20),
          _buildSectionHeader('Phase 6: Family, Checklists, Reminders & Plan Changes (13 Screens)'),
          _buildTile(context, '6.1 Family overview', '/family'),
          _buildTile(context, '6.2 Family member · adult (Omar)', '/member-adult'),
          _buildTile(context, '6.3 Family member · child (Nour)', '/member-child'),
          _buildTile(context, '6.4 Remove a family member modal', '/remove-member'),
          _buildTile(context, '6.5 What to bring checklist', '/checklist'),
          _buildTile(context, '6.6 Reminders · upcoming', '/reminders'),
          _buildTile(context, '6.7 Reminders · calendar', '/calendar'),
          _buildTile(context, '6.8 Notification settings', '/notification-settings'),
          _buildTile(context, '6.9 Something changed? Life event picker', '/life-event'),
          _buildTile(context, '6.10 Plan recalculated', '/plan-change'),
          _buildTile(context, '6.11 Just today mode', '/just-today'),
          _buildTile(context, '6.12 Global search', '/search'),
          _buildTile(context, '6.13 Family member · student (Yasmin)', '/member-student'),

          const SizedBox(height: 20),
          _buildSectionHeader('Phase 5: Task Actions, Nearby Map & Updates (8 Screens)'),
          _buildTile(context, '5.1 Nearby locations (map)', '/nearby'),
          _buildTile(context, '5.2 Location detail', '/location-detail'),
          _buildTile(context, '5.3 Mark done · who did it', '/done-picker'),
          _buildTile(context, '5.4 Task done · unlocked next', '/task-done'),
          _buildTile(context, '5.5 Remind me later', '/snooze'),
          _buildTile(context, '5.6 Not for me', '/dismiss'),
          _buildTile(context, '5.7 Report outdated info', '/report-outdated'),
          _buildTile(context, '5.8 A step changed (content update)', '/content-updated'),

          const SizedBox(height: 20),
          _buildSectionHeader('Phase 4: Full Tasks, Nearby Services & Licensing (14 Screens)'),
          _buildTile(context, '4.1 Task · PR card (completed state)', '/task-status'),
          _buildTile(context, '4.2 Task · SIN (full detail)', '/task-sin'),
          _buildTile(context, '4.3 Task · Tenant rights before a lease', '/task-housing'),
          _buildTile(context, '4.4 Task · School registration', '/task-school'),
          _buildTile(context, '4.5 Task · Driver\'s licence', '/task-licence'),
          _buildTile(context, '4.6 Task · Auto insurance', '/task-insurance'),
          _buildTile(context, '4.7 Task · Family doctor', '/task-doctor'),
          _buildTile(context, '4.8 Task · Canada Child Benefit', '/task-ccb'),
          _buildTile(context, '4.9 Task · Employment services', '/task-work'),
          _buildTile(context, '4.10 Task · Library card', '/task-library'),
          _buildTile(context, '4.11 Task · Apply to university or college', '/task-uni-apply'),
          _buildTile(context, '4.12 Task · OSAP student aid', '/task-osap'),
          _buildTile(context, '4.13 Does your job need a licence?', '/occupation-search'),
          _buildTile(context, '4.14 Licensing pathway · P.Eng. (Omar)', '/occupation-pathway'),

          const SizedBox(height: 20),
          _buildSectionHeader('Phase 3: Home, Journey & All 10 Stages'),
          _buildTile(context, '3.1 Home Screen', '/home'),
          _buildTile(context, '3.2 Journey Screen', '/journey'),
          _buildTile(context, '3.3 Stage 1: Status & Arrival Documents', '/stage-status'),
          _buildTile(context, '3.4 Stage 2: Paperwork', '/stage-paperwork'),
          _buildTile(context, '3.5 Stage 3: Housing', '/stage-housing'),
          _buildTile(context, '3.6 Stage 4: School, College & University', '/stage-schools'),
          _buildTile(context, '3.6b Stage 4b: University Stream (Yasmin)', '/stage-university'),
          _buildTile(context, '3.7 Stage 5: Car & Driving', '/stage-car'),
          _buildTile(context, '3.8 Stage 6: Insurance', '/stage-insurance'),
          _buildTile(context, '3.9 Stage 7: Health Care', '/stage-health'),
          _buildTile(context, '3.10 Stage 8: Money & Benefits', '/stage-money'),
          _buildTile(context, '3.11 Stage 9: Work & Credentials', '/stage-work'),
          _buildTile(context, '3.12 Stage 10: Community & Belonging', '/stage-community'),

          const SizedBox(height: 20),
          _buildSectionHeader('Phase 2: Onboarding'),
          _buildTile(context, '2.1 Move Stage', '/stage'),
          _buildTile(context, '2.2 Destination', '/destination'),
          _buildTile(context, '2.3 Status', '/status'),
          _buildTile(context, '2.4 Household', '/household'),
          _buildTile(context, '2.5 Add Child', '/add-child'),
          _buildTile(context, '2.6 Add Adult', '/add-adult'),
          _buildTile(context, '2.9 Add Student', '/add-student'),
          _buildTile(context, '2.7 Priorities', '/priorities'),
          _buildTile(context, '2.8 Plan Ready', '/plan-ready'),

          const SizedBox(height: 20),
          _buildSectionHeader('Phase 1: Welcome & Auth'),
          _buildTile(context, '1.1 Welcome', '/'),
          _buildTile(context, '1.2 Sign Up', '/sign-up'),
          _buildTile(context, '1.3 Verify Email', '/verify-email'),
          _buildTile(context, '1.4 Sign In', '/sign-in'),
          _buildTile(context, '1.5 Privacy Consent', '/consent'),
          _buildTile(context, '1.6 Notifications', '/notif-permission'),
          _buildTile(context, '1.7 Location Permission', '/location-permission'),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: AppTypography.fontBody,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFFA82227),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, String path) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFDEDEE2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xFF7A7A83),
          size: 20,
        ),
        onTap: () => context.push(path),
      ),
    );
  }
}


