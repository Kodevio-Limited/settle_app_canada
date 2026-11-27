import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'models/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  final String screenId;

  const ExploreScreen({
    super.key,
    this.screenId = 'Explore',
  });

  @override
  Widget build(BuildContext context) {
    final model = allExploreScreens[screenId] ?? allExploreScreens['Explore']!;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header navigation (if not root Explore)
              if (screenId != 'Explore')
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF123332)),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                ),
              if (screenId != 'Explore') const SizedBox(height: 8),

              // Title block
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (model.tag.isNotEmpty) ...[
                    Text(
                      model.tag.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                        color: Color(0xFFA82227),
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                  Text(
                    model.title,
                    style: const TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.08,
                      color: Color(0xFF123332),
                    ),
                  ),
                  if (model.desc.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      model.desc,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 16),

              // If root Explore, show category chips
              if (screenId == 'Explore') ...[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildChip(context, 'For you', isActive: true),
                      const SizedBox(width: 8),
                      _buildChip(context, 'Free', route: '/explore/free-passes'),
                      const SizedBox(width: 8),
                      _buildChip(context, 'Places', route: '/explore/places'),
                      const SizedBox(width: 8),
                      _buildChip(context, 'Events', route: '/explore/events'),
                      const SizedBox(width: 8),
                      _buildChip(context, 'Offers', route: '/explore/offers'),
                      const SizedBox(width: 8),
                      _buildChip(context, 'Saved', route: '/explore/saved'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Sections
              ...model.sections.map((sec) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (sec.title.isNotEmpty) ...[
                        Text(
                          sec.title,
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF123332),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                      if (sec.items.isNotEmpty)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFFDEDEE2)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: sec.items.asMap().entries.map((entry) {
                              final idx = entry.key;
                              final item = entry.value;
                              final isLast = idx == sec.items.length - 1;

                              return InkWell(
                                onTap: () => _handleItemTap(context, item.href),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 12),
                                  decoration: BoxDecoration(
                                    border: isLast
                                        ? null
                                        : const Border(
                                            bottom: BorderSide(
                                                color: Color(0xFFEAEAEC)),
                                          ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    item.title,
                                                    style: const TextStyle(
                                                      fontFamily: 'IBM Plex Sans',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF123332),
                                                    ),
                                                  ),
                                                ),
                                                if (item.badge.isNotEmpty) ...[
                                                  const SizedBox(width: 6),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 6,
                                                        vertical: 2),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFEAEAEC),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    child: Text(
                                                      item.badge,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'IBM Plex Sans',
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xFF3B4747),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                            if (item.sub.isNotEmpty) ...[
                                              const SizedBox(height: 2),
                                              Text(
                                                item.sub,
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
                                      const Icon(
                                        Icons.chevron_right,
                                        size: 18,
                                        color: Color(0xFF7A7A83),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label,
      {bool isActive = false, String? route}) {
    return InkWell(
      onTap: () {
        if (route != null) {
          context.push(route);
        }
      },
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF123332) : Colors.white,
          border: isActive
              ? null
              : Border.all(color: const Color(0xFFDEDEE2)),
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'IBM Plex Sans',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : const Color(0xFF123332),
          ),
        ),
      ),
    );
  }

  void _handleItemTap(BuildContext context, String href) {
    if (href.isEmpty) return;
    final clean = href.replaceFirst('.dc.html', '');
    // Convert CamelCase to kebab-case
    final kebab = clean.replaceAllMapped(
      RegExp(r'([A-Z])'),
      (match) => '-${match.group(1)!.toLowerCase()}',
    ).replaceFirst('-', '');

    if (context.mounted) {
      context.push('/explore/$kebab');
    }
  }
}
