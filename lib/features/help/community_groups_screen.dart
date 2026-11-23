import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class CommunityGroupsScreen extends StatefulWidget {
  const CommunityGroupsScreen({super.key});

  @override
  State<CommunityGroupsScreen> createState() => _CommunityGroupsScreenState();
}

class _CommunityGroupsScreenState extends State<CommunityGroupsScreen> {
  String _selectedFilter = 'All';

  final List<String> _filters = [
    'All',
    'Parents',
    'Language',
    'Women',
    'Youth',
    'Faith & culture',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: InkWell(
                      onTap: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go('/stage-community');
                        }
                      },
                      borderRadius: BorderRadius.circular(22),
                      child: const SizedBox(
                        width: 44,
                        height: 44,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Groups near you',
                    style: TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF123332),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Filter Chips
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: _filters.map((filter) {
                  final isSelected = _selectedFilter == filter;
                  return InkWell(
                    onTap: () => setState(() => _selectedFilter = filter),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF123332) : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: isSelected
                            ? null
                            : Border.all(color: const Color(0xFFC8C8CE)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        filter,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                          color: isSelected ? Colors.white : const Color(0xFF123332),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),

              // Warning / Notice Banner
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E4E5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 18,
                      color: Color(0xFFA82227),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Shared by community organizations and 211 — not Settle's verified guidance.",
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.45,
                          color: Color(0xFF5C1518),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Group 1: Language
              if (_selectedFilter == 'All' || _selectedFilter == 'Language') ...[
                _buildGroupCard(
                  category: 'Language',
                  title: 'English conversation circle',
                  details: 'Mississauga Library · [day and time] · free',
                  onTap: () => context.push('/location-detail'),
                ),
                const SizedBox(height: 12),
              ],

              // Group 2: Women / Parents
              if (_selectedFilter == 'All' || _selectedFilter == 'Women' || _selectedFilter == 'Parents') ...[
                _buildGroupCard(
                  category: "Women · Parents",
                  title: "Newcomer women's circle",
                  details: '[Settlement agency] · [day and time] · childcare available',
                  onTap: () => context.push('/location-detail'),
                ),
                const SizedBox(height: 12),
              ],

              // Group 3: Youth
              if (_selectedFilter == 'All' || _selectedFilter == 'Youth') ...[
                _buildGroupCard(
                  category: 'Youth',
                  title: 'Newcomer youth program (13–18)',
                  details: '[Organization] · after school',
                  onTap: () => context.push('/location-detail'),
                ),
                const SizedBox(height: 12),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGroupCard({
    required String category,
    required String title,
    required String details,
    required VoidCallback onTap,
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
          Text(
            category,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF123332),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF123332),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            details,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF5A5F6B),
            ),
          ),
          const SizedBox(height: 6),
          InkWell(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text(
                'Details & directions',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
