import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class LocationDeniedScreen extends StatefulWidget {
  const LocationDeniedScreen({super.key});

  @override
  State<LocationDeniedScreen> createState() => _LocationDeniedScreenState();
}

class _LocationDeniedScreenState extends State<LocationDeniedScreen> {
  final TextEditingController _fsaController = TextEditingController(text: 'L5B');

  @override
  void dispose() {
    _fsaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: SafeArea(
          child: Column(
            children: [
              FigmaSubPageHeader(
                title: 'Near you',
                onBack: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/tasks/sin');
                  }
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4, bottom: 12),
                        child: Text(
                          'For: Apply for your SIN',
                          style: AppTypography.caption1.copyWith(
                            color: AppColors.dark200,
                          ),
                        ),
                      ),
                      FigmaSurfaceCard(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: const BoxDecoration(
                                color: AppColors.dark50,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.location_off_outlined,
                                size: 24,
                                color: AppColors.dark300,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Location is off for Settle',
                              style: AppTypography.body2Bold.copyWith(
                                fontSize: 18,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "That's fine. Enter a postal area and we'll sort offices by distance from there. Nothing is stored.",
                              style: AppTypography.body2.copyWith(
                                height: 1.45,
                                color: AppColors.dark300,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppColors.white50,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: AppColors.border),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                      controller: _fsaController,
                                      maxLength: 3,
                                      textCapitalization: TextCapitalization.characters,
                                      style: AppTypography.body2.copyWith(
                                        color: AppColors.primary,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: '',
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () => context.push('/nearby'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: AppColors.white50,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                    ),
                                    child: Text(
                                      'Show',
                                      style: AppTypography.body2Bold.copyWith(
                                        color: AppColors.white50,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Opening device settings...')),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  'Or turn on approximate location in iPhone Settings',
                                  style: AppTypography.body2Bold.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'In Mississauga (from your plan)',
                        style: AppTypography.body2Bold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildLocationTile(
                        context,
                        title: 'Service Canada Centre · Mississauga',
                        status: 'Distance unknown · ',
                      ),
                      const SizedBox(height: 8),
                      _buildLocationTile(
                        context,
                        title: 'Service Canada Centre · Brampton',
                        status: 'Distance unknown · ',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationTile(
    BuildContext context, {
    required String title,
    required String status,
  }) {
    return FigmaSurfaceCard(
      onTap: () => context.push('/location-detail'),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.body2Bold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 2),
                RichText(
                  text: TextSpan(
                    text: status,
                    style: AppTypography.caption1.copyWith(
                      color: AppColors.dark200,
                    ),
                    children: [
                      TextSpan(
                        text: 'Open now',
                        style: AppTypography.caption1.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: AppColors.dark200,
          ),
        ],
      ),
    );
  }
}
