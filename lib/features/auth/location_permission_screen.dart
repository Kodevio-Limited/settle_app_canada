import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'auth_provider.dart';

class LocationPermissionScreen extends ConsumerStatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  ConsumerState<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState
    extends ConsumerState<LocationPermissionScreen> {
  final _postalController = TextEditingController();

  @override
  void dispose() {
    _postalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              // Top Location Pin Icon Box (88x88, radius 26, #E2ECEB, #123332)
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2ECEB),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Center(
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 44,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Find services near you',
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
                'Each task shows the closest Service Canada, ServiceOntario, DriveTest, school board and settlement offices.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 20),
              // 3 bullet points with green checkmarks
              _bulletItem('Approximate location only'),
              const SizedBox(height: 10),
              _bulletItem('Only while the app is open'),
              const SizedBox(height: 10),
              _bulletItem('Never stored or shared'),
              const Spacer(),
              // Primary button
              SettleButton(
                label: 'Use approximate location',
                onPressed: () {
                  ref.read(authProvider.notifier).setLocation(true);
                  context.go('/stage');
                },
              ),
              const SizedBox(height: 10),
              // Card: Or enter your postal area
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Or enter your postal area',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: TextField(
                              controller: _postalController,
                              textCapitalization: TextCapitalization.characters,
                              maxLength: 3,
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 16,
                                color: AppColors.primary,
                              ),
                              decoration: InputDecoration(
                                hintText: 'First 3 characters, e.g. L5B',
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF8A8A93),
                                ),
                                counterText: '',
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Color(0xFFC8C8CE)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Color(0xFFC8C8CE)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            final postal = _postalController.text.trim();
                            ref
                                .read(authProvider.notifier)
                                .setLocation(false, postal);
                            context.go('/stage');
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.primary),
                            ),
                            child: const Text(
                              'Use this',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bulletItem(String text) {
    return Row(
      children: [
        const Icon(Icons.check, color: Color(0xFF2E6B4F), size: 20),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 15,
            height: 1.4,
            color: Color(0xFF123332),
          ),
        ),
      ],
    );
  }
}
