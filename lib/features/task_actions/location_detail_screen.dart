import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: const Color(0xFFF4F4F5),
      body: Column(
        children: [
          // Hero Map Banner with back button
          Stack(
            children: [
              Container(
                height: 210,
                width: double.infinity,
                color: const Color(0xFFE9E9EC),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      width: 100,
                      child: Container(color: const Color(0xFFCFE0EA)),
                    ),
                    Positioned(
                      left: 40,
                      bottom: 30,
                      width: 90,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9E6D2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 100,
                      height: 9,
                      child: Container(color: Colors.white),
                    ),
                    Positioned(
                      left: 130,
                      top: 0,
                      bottom: 0,
                      width: 9,
                      child: Container(color: Colors.white),
                    ),
                    Positioned(
                      left: 236,
                      top: 0,
                      bottom: 0,
                      width: 9,
                      child: Container(color: Colors.white),
                    ),
                    // Center Location Pin
                    Positioned(
                      left: 175,
                      top: 60,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFF123332),
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
                            painter: _TrianglePainter(color: const Color(0xFF123332)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 16,
                top: 50,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF123332)),
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
            ],
          ),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Tag, Title, Subtitle
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2ECEB),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        categoryTag,
                        style: const TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF123332),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                      color: Color(0xFF123332),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '$distance · '),
                        const TextSpan(
                          text: 'Open now',
                          style: TextStyle(
                            color: Color(0xFF2E6B4F),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 14,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // 3-Button Action Grid
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionBtn(
                          icon: Icons.navigation_outlined,
                          label: 'Directions',
                          isPrimary: true,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Starting turn-by-turn navigation...')),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildActionBtn(
                          icon: Icons.phone_outlined,
                          label: 'Call',
                          isPrimary: false,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Calling (905) 555-0199...')),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildActionBtn(
                          icon: Icons.open_in_new,
                          label: 'Official page',
                          isPrimary: false,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Opening official Service Canada directory...')),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Definition / Details card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFDEDEE2)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    child: Column(
                      children: const [
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
                          value: 'SIN, pensions, employment insurance and more',
                          hasBorder: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Your tasks here
                  const Text(
                    'Your tasks here',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF123332),
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () => context.push('/task-sin'),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7E4E5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Apply for your SIN',
                                  style: TextStyle(
                                    fontFamily: 'IBM Plex Sans',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF123332),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Layla, Omar · 1 of 3 items ready to bring',
                                  style: TextStyle(
                                    fontFamily: 'IBM Plex Sans',
                                    fontSize: 13,
                                    color: Color(0xFF5C1518),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right, size: 20, color: Color(0xFFA82227)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Footer info
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        'Verified [DATE] · Service Canada directory',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 12,
                          color: Color(0xFF5A5F6B),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.push('/report-outdated'),
                        child: const Text(
                          'Report a problem',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF123332),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
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
        height: 64,
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF123332) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: isPrimary ? null : Border.all(color: const Color(0xFFDEDEE2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isPrimary ? Colors.white : const Color(0xFF123332),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isPrimary ? Colors.white : const Color(0xFF123332),
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: hasBorder
            ? const Border(bottom: BorderSide(color: Color(0xFFEAEAEC)))
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 96,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 13,
                color: Color(0xFF5A5F6B),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 14,
                color: Color(0xFF123332),
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
