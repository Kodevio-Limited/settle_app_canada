import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class NearbyScreen extends StatefulWidget {
  final String taskTitle;

  const NearbyScreen({
    super.key,
    this.taskTitle = 'Apply for your SIN',
  });

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = [
    'Service Canada',
    'ServiceOntario',
    'DriveTest',
    'Settlement',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Figma Sub-Page Header
              FigmaSubPageHeader(
                title: 'Near you',
                onBack: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/home');
                  }
                },
              ),
              const SizedBox(height: 4),
              Text(
                'For: ${widget.taskTitle}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 14),

              // Category Filter Pills
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_categories.length, (idx) {
                    final isSelected = idx == _selectedCategoryIndex;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCategoryIndex = idx;
                          });
                        },
                        borderRadius: BorderRadius.circular(999),
                        child: Container(
                          height: 38,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.dark50,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _categories[idx],
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.dark300,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 14),

              // Map Preview Card
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 210,
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
                      Positioned(
                        left: 144,
                        top: 102,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2F6FB5)
                                .withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: 13,
                              height: 13,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2F6FB5),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 214,
                        top: 48,
                        child: _buildMapPin('1'),
                      ),
                      Positioned(
                        left: 66,
                        top: 98,
                        child: _buildMapPin('2'),
                      ),
                      Positioned(
                        left: 250,
                        top: 140,
                        child: _buildMapPin('3'),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.85),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'Apple Maps',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 10,
                              color: AppColors.dark300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Location Cards List
              Expanded(
                child: ListView(
                  children: [
                    _buildLocationCard(
                      context,
                      num: '1',
                      title: 'Service Canada Centre · Mississauga',
                      sub: '2.1 km · Open now · closes [TIME]',
                      tag: 'Step-free entrance · verified [DATE]',
                      onDetailsTap: () => context.push('/location-detail'),
                    ),
                    const SizedBox(height: 12),
                    _buildLocationCard(
                      context,
                      num: '2',
                      title: 'Service Canada Centre · Brampton',
                      sub: '8.6 km · Open now · closes [TIME]',
                      onDetailsTap: () => context.push('/location-detail'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // Privacy Footnote
              Text.rich(
                TextSpan(
                  text:
                      'Using approximate location while the app is open. Not stored. ',
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 12,
                    color: AppColors.dark300,
                  ),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        onTap: () => context.push('/consent'),
                        child: const Text(
                          'Change',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMapPin(String num) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              num,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        CustomPaint(
          size: const Size(8, 6),
          painter: _TrianglePainter(color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildLocationCard(
    BuildContext context, {
    required String num,
    required String title,
    required String sub,
    String? tag,
    required VoidCallback onDetailsTap,
  }) {
    return FigmaSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.all(16),
      onTap: onDetailsTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    num,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainFont,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: '2.1 km · '),
                          TextSpan(
                            text: 'Open now',
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(text: ' · closes [TIME]'),
                        ],
                      ),
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13,
                        color: AppColors.dark300,
                      ),
                    ),
                    if (tag != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        tag,
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 12.5,
                          color: AppColors.dark200,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Opening directions in maps...'),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Directions',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Calling (905) 555-0199...'),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.dark50,
                      border: Border.all(color: AppColors.dark100),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone_outlined,
                          size: 15,
                          color: AppColors.mainFont,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Call',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: onDetailsTap,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.dark50,
                      border: Border.all(color: AppColors.dark100),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Details',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainFont,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
