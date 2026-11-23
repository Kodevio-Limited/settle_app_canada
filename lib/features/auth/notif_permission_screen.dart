import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_decorations.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'auth_provider.dart';

class NotifPermissionScreen extends ConsumerWidget {
  const NotifPermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: AppColors.primary,
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Notification Bell Icon Box (88x88, radius 26, #F7E4E5, #CA292E)
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E4E5), // alertSurface
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Center(
                  child: Icon(
                    Icons.notifications_none_rounded,
                    size: 44,
                    color: Color(0xFFCA292E), // notification red
                  ),
                ),
              ),
              const SizedBox(height: 22),
              // Heading
              const Text(
                'Never miss an important step',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w800,
                  fontSize: 32,
                  height: 1.1,
                  letterSpacing: -0.7,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "We'll remind you before things like a school registration or an appointment you planned. You choose how often, and set quiet hours.",
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 24),
              // Sample notification card preview with hexagon logo
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.white50,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF123332).withOpacity(0.06),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hexagon Logo for Service Canada
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF2F1),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.hexagon,
                          size: 26,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tomorrow · Service Canada',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Bring your original status documents to apply for your SIN — Layla & Omar.',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 14,
                              height: 1.4,
                              color: Color(0xFF3B4747),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SettleButton(
                label: 'Turn on reminders',
                onPressed: () {
                  ref.read(authProvider.notifier).setNotifications(true);
                  context.push('/location-permission');
                },
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    ref.read(authProvider.notifier).setNotifications(false);
                    context.push('/location-permission');
                  },
                  child: const Text(
                    'Not now',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Center(
                child: Text(
                  'Your phone will ask next. You can change this anytime.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    color: Color(0xFF5A5F6B),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
