import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

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
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FigmaSubPageHeader(
                title: 'Groups near you',
                onBack: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/stage-community');
                  }
                },
              ),
              const SizedBox(height: 16),

              // Borderless Pill Filter Chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _filters.map((filter) {
                  final isSelected = _selectedFilter == filter;
                  return InkWell(
                    onTap: () => setState(() => _selectedFilter = filter),
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      height: 38,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.primary : AppColors.dark50,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        filter,
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : AppColors.dark300,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // Warning Notice Banner
              const FigmaNoticeBanner(
                isWarmAlert: true,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 18,
                      color: AppColors.red,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Shared by community organizations and 211 — not Settle's verified guidance.",
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          height: 1.45,
                          color: Color(0xFF5C1518),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              if (_selectedFilter == 'All' ||
                  _selectedFilter == 'Language') ...[
                _buildGroupCard(
                  category: 'Language',
                  title: 'English conversation circle',
                  details: 'Mississauga Library · [day and time] · free',
                  onTap: () => context.push('/location-detail'),
                ),
                const SizedBox(height: 12),
              ],

              if (_selectedFilter == 'All' ||
                  _selectedFilter == 'Women' ||
                  _selectedFilter == 'Parents') ...[
                _buildGroupCard(
                  category: 'Women · Parents',
                  title: "Newcomer women's circle",
                  details:
                      '[Settlement agency] · [day and time] · childcare available',
                  onTap: () => context.push('/location-detail'),
                ),
                const SizedBox(height: 12),
              ],

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
    return FigmaSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontFamily: AppTypography.fontHeading,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.mainFont,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            details,
            style: const TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 13,
              color: AppColors.dark300,
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'Details & directions',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
