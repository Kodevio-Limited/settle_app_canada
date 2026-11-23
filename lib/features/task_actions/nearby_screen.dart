import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF123332)),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Near you',
                          style: TextStyle(
                            fontFamily: 'Bricolage Grotesque',
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF123332),
                          ),
                        ),
                        Text(
                          'For: ${widget.taskTitle}',
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 13,
                            color: Color(0xFF5A5F6B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Horizontal Category Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_categories.length, (idx) {
                    final isSelected = idx == _selectedCategoryIndex;
                    return Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCategoryIndex = idx;
                          });
                        },
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          height: 36,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF123332) : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: isSelected ? null : Border.all(color: const Color(0xFFC8C8CE)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _categories[idx],
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                              color: isSelected ? Colors.white : const Color(0xFF123332),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 12),

              // Interactive Map Preview
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 230,
                  color: const Color(0xFFE9E9EC),
                  child: Stack(
                    children: [
                      // Water
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        width: 96,
                        child: Container(color: const Color(0xFFCFE0EA)),
                      ),
                      // Parks
                      Positioned(
                        left: 24,
                        bottom: 36,
                        width: 84,
                        height: 54,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9E6D2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 170,
                        top: 10,
                        width: 60,
                        height: 36,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9E6D2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      // Road Grid
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 88,
                        height: 8,
                        child: Container(color: Colors.white),
                      ),
                      Positioned(
                        left: 0,
                        right: 62,
                        top: 176,
                        height: 8,
                        child: Container(color: Colors.white),
                      ),
                      Positioned(
                        left: 118,
                        top: 0,
                        bottom: 0,
                        width: 8,
                        child: Container(color: Colors.white),
                      ),
                      Positioned(
                        left: 214,
                        top: 0,
                        bottom: 0,
                        width: 8,
                        child: Container(color: Colors.white),
                      ),
                      // User Location Dot
                      Positioned(
                        left: 144,
                        top: 110,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2F6FB5).withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2F6FB5),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Pins
                      Positioned(
                        left: 214,
                        top: 52,
                        child: _buildMapPin('1'),
                      ),
                      Positioned(
                        left: 66,
                        top: 104,
                        child: _buildMapPin('2'),
                      ),
                      Positioned(
                        left: 250,
                        top: 150,
                        child: _buildMapPin('3'),
                      ),
                      // Attribution
                      const Positioned(
                        right: 12,
                        bottom: 8,
                        child: Text(
                          'Apple Maps',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 10,
                            color: Color(0xFF5A5F6B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

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
                    const SizedBox(height: 10),
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

              // Privacy Footnote
              Text.rich(
                TextSpan(
                  text: 'Using approximate location while the app is open. Not stored. ',
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 12,
                    color: Color(0xFF5A5F6B),
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
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 12,
                            color: Color(0xFF123332),
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
            color: Color(0xFF123332),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              num,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        CustomPaint(
          size: const Size(8, 6),
          painter: _TrianglePainter(color: const Color(0xFF123332)),
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
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDEDEE2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF123332),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    num,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 13,
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
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text.rich(
                      TextSpan(
                        children: const [
                          TextSpan(text: '2.1 km · '),
                          TextSpan(
                            text: 'Open now',
                            style: TextStyle(
                              color: Color(0xFF2E6B4F),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(text: ' · closes [TIME]'),
                        ],
                      ),
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 13,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                    if (tag != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        tag,
                        style: const TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 13,
                          color: Color(0xFF5A5F6B),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Opening directions in maps...')),
                    );
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF123332),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Directions',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Calling (905) 555-0199...')),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFC8C8CE)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Call',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF123332),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: onDetailsTap,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFC8C8CE)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Details',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF123332),
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
