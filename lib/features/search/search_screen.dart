import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'health card');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full-pill Search Bar + Cancel
              Row(
                children: [
                  Expanded(
                    child: FigmaSearchBar(
                      controller: _controller,
                      hintText: 'Search tasks, offices, or guides',
                      onChanged: (_) => setState(() {}),
                      onClear: () {
                        _controller.clear();
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/journey');
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 10,
                      ),
                      child: Text(
                        'Cancel',
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
              const SizedBox(height: 20),

              _buildSectionHeader('Your tasks'),
              const SizedBox(height: 8),
              _buildSearchResultCard(
                title: 'Apply for Ontario health cards',
                subtitle: 'Paperwork · Everyone · not started',
                onTap: () => context.push('/checklists'),
              ),
              const SizedBox(height: 8),
              _buildSearchResultCard(
                title: 'Find a family doctor',
                subtitle: 'Health care · needs your health cards',
                onTap: () => context.push('/tasks/doctor'),
              ),
              const SizedBox(height: 18),

              _buildSectionHeader('Places'),
              const SizedBox(height: 8),
              _buildSearchResultCard(
                leadingIcon: Icons.location_on_rounded,
                title: 'ServiceOntario · [location]',
                subtitle: '2.6 km · Open now',
                onTap: () => context.push('/task-actions/location-detail'),
              ),
              const SizedBox(height: 18),

              _buildSectionHeader('Help & guides'),
              const SizedBox(height: 8),
              _buildSearchResultCard(
                title: 'Gaps in health coverage',
                subtitle: 'Insurance · general information',
                onTap: () => context.push('/stages/stage-insurance'),
              ),
              const SizedBox(height: 28),

              const Center(
                child: Text(
                  "Searches run on Settle's servers in Canada and aren't linked to your profile.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 12,
                    height: 1.45,
                    color: AppColors.dark300,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontFamily: AppTypography.fontBody,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.6,
        color: AppColors.dark300,
      ),
    );
  }

  Widget _buildSearchResultCard({
    IconData? leadingIcon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return FigmaSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      onTap: onTap,
      child: Row(
        children: [
          if (leadingIcon != null) ...[
            FigmaIconTile(
              icon: leadingIcon,
              iconColor: AppColors.primary,
              backgroundColor: AppColors.dark50,
              size: 40,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    color: AppColors.dark300,
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
