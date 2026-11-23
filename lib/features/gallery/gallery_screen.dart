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


