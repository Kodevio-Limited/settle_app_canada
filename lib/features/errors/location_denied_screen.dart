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
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.only(left: 52),
                child: Text(
                  'For: Apply for your SIN',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    color: AppColors.dark300,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Location is off card
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
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'That\'s fine. Enter a postal area and we\'ll sort offices by distance from there. Nothing is stored.',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.dark200),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            alignment: Alignment.centerLeft,
                            child: TextField(
                              controller: _fsaController,
                              maxLength: 3,
                              textCapitalization: TextCapitalization.characters,
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 16,
                                color: AppColors.mainFont,
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
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                            ),
                            child: Text(
                              'Show',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
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
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Locations in Mississauga from plan
              Text(
                'In Mississauga (from your plan)',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainFont,
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
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 2),
                RichText(
                  text: TextSpan(
                    text: status,
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13,
                      color: AppColors.dark300,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Open now',
                        style: TextStyle(
                          color: AppColors.secondary,
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
            color: AppColors.dark300,
          ),
        ],
      ),
    );
  }
}
