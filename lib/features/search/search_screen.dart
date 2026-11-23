import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFF123332),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search_rounded,
                            size: 20,
                            color: Color(0xFF5A5F6B),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF123332),
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF123332),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Section 1: YOUR TASKS
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
              const SizedBox(height: 16),

              // Section 2: PLACES
              _buildSectionHeader('Places'),
              const SizedBox(height: 8),
              _buildSearchResultCard(
                leadingIcon: Icons.location_on_outlined,
                title: 'ServiceOntario · [location]',
                subtitle: '2.6 km · Open now',
                onTap: () => context.push('/task-actions/location-detail'),
              ),
              const SizedBox(height: 16),

              // Section 3: HELP & GUIDES
              _buildSectionHeader('Help & guides'),
              const SizedBox(height: 8),
              _buildSearchResultCard(
                title: 'Gaps in health coverage',
                subtitle: 'Insurance · general information',
                onTap: () => context.push('/stages/stage-insurance'),
              ),
              const SizedBox(height: 32),

              // Privacy statement
              const Center(
                child: Text(
                  "Searches run on Settle's servers in Canada and aren't linked to your profile.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.45,
                    color: Color(0xFF5A5F6B),
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: Color(0xFF5A5F6B),
      ),
    );
  }

  Widget _buildSearchResultCard({
    IconData? leadingIcon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFDEDEE2)),
        ),
        child: Row(
          children: [
            if (leadingIcon != null) ...[
              Icon(
                leadingIcon,
                size: 20,
                color: const Color(0xFF123332),
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
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF123332),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF5A5F6B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
