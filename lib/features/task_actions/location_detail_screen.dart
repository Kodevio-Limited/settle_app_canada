import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class LocationDetailScreen extends StatelessWidget {
  final String title;
  final String distance;
  final String categoryTag;

  const LocationDetailScreen({
    super.key,
    this.title = 'Service Canada Centre · Mississauga',
    this.distance = '2.1 km',
    this.categoryTag = 'Federal office',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          // Hero Map Banner with Floating Figma Back Button
          Stack(
            children: [
              SizedBox(
                height: 220,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/map_preview.png',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: const Color(0xFFE9E9EC),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          CustomPaint(
                            size: const Size(12, 10),
                            painter: _TrianglePainter(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.10),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: BackButton(
                      color: AppColors.mainFont,
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/nearby');
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.dark50,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        categoryTag,
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      height: 1.15,
                      color: AppColors.mainFont,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '$distance · '),
                        const TextSpan(
                          text: 'Open now',
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 14,
                      color: AppColors.dark300,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 3-Button Action Grid
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionBtn(
                          icon: Icons.near_me_outlined,
                          label: 'Directions',
                          isPrimary: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Starting turn-by-turn navigation...'),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildActionBtn(
                          icon: Icons.phone_outlined,
                          label: 'Call',
                          isPrimary: false,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Calling (905) 555-0199...'),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildActionBtn(
                          icon: Icons.open_in_new_rounded,
                          label: 'Official page',
                          isPrimary: false,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Opening official Service Canada directory...'),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Borderless Details Card
                  const FigmaSurfaceCard(
                    radius: 16,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Column(
                      children: [
                        _DetailRow(
                          label: 'Address',
                          value: '[Street address, Mississauga ON]',
                          hasBorder: true,
                        ),
                        _DetailRow(
                          label: 'Hours',
                          value: '[From the official office directory]',
                          hasBorder: true,
                        ),
                        _DetailRow(
                          label: 'Access',
                          value: 'Step-free entrance',
                          hasBorder: true,
                        ),
                        _DetailRow(
                          label: 'Services',
                          value:
                              'SIN, pensions, employment insurance and more',
                          hasBorder: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Your tasks here
                  const Text(
                    'Your tasks here',
                    style: TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainFont,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FigmaSurfaceCard(
                    radius: 16,
                    padding: const EdgeInsets.all(14),
                    onTap: () => context.push('/task-sin'),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Apply for your SIN',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainFont,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Layla, Omar · 1 of 3 items ready to bring',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 13,
                                  color: AppColors.dark300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 20,
                          color: AppColors.dark200,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  FigmaSoftOutlineButton(
                    label: 'Report a problem',
                    onPressed: () => context.push('/report-outdated'),
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    'Verified [DATE] · Service Canada directory',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 12,
                      color: AppColors.dark300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn({
    required IconData icon,
    required String label,
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 68,
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isPrimary ? Colors.white : AppColors.primary,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: isPrimary ? Colors.white : AppColors.mainFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool hasBorder;

  const _DetailRow({
    required this.label,
    required this.value,
    required this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: hasBorder
            ? const Border(bottom: BorderSide(color: AppColors.divider))
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 88,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 13,
                color: AppColors.dark300,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.mainFont,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
