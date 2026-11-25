import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  String _selectedRating = 'Hard';

  final List<String> _ratings = ['Very hard', 'Hard', 'Okay', 'Good', 'Great'];

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
              // Close button
              Transform.translate(
                offset: const Offset(-10, 0),
                child: InkWell(
                  onTap: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/home');
                    }
                  },
                  borderRadius: BorderRadius.circular(22),
                  child: const SizedBox(
                    width: 44,
                    height: 44,
                    child: Center(
                      child: Icon(
                        Icons.close_rounded,
                        size: 24,
                        color: Color(0xFF123332),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Title
              Text(
                'How manageable does settling feel this week?',
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                  letterSpacing: -0.6,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 16),

              // 5-Rating Selection Row
              Row(
                children: _ratings.map((r) {
                  final isSelected = _selectedRating == r;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedRating = r;
                          });
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 64),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFEAF2F1) : Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF123332)
                                  : const Color(0xFFDEDEE2),
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio<String>(
                                value: r,
                                groupValue: _selectedRating,
                                activeColor: const Color(0xFF123332),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() => _selectedRating = val);
                                  }
                                },
                              ),
                              const SizedBox(height: 2),
                              Text(
                                r,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                                  color: const Color(0xFF123332),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // Thank you message
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E4E5),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thank you for telling us',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF5C1518),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Feeling stretched in the first months is very common — you're carrying a whole family's move. A few things that might help:",
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: Color(0xFF5C1518),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Resource Suggestions
              _buildHelpAction(
                title: 'Switch to "just today"',
                subtitle: 'See one task at a time for a while',
                onTap: () => context.push('/just-today'),
              ),
              const SizedBox(height: 8),
              _buildHelpAction(
                title: 'Talk to a settlement worker',
                subtitle: 'A real person who helps newcomers every day',
                onTap: () => context.pushSafe('/help'),
              ),
              const SizedBox(height: 8),
              _buildHelpAction(
                title: 'Find newcomer groups near you',
                subtitle: 'Parents, language cafés, faith and cultural groups',
                onTap: () => context.push('/community-groups'),
              ),
              const SizedBox(height: 8),
              _buildHelpAction(
                title: 'Need to talk to someone now?',
                subtitle: '24/7 support lines',
                textColor: const Color(0xFF8E1C21),
                onTap: () => context.push('/crisis'),
              ),
              const SizedBox(height: 24),

              // Footer Disclaimer
              const Center(
                child: Text(
                  'This is not therapy, a medical check or emergency care. Your answer stays private.',
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

  Widget _buildHelpAction({
    required String title,
    required String subtitle,
    Color textColor = const Color(0xFF123332),
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFDEDEE2)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: textColor,
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
