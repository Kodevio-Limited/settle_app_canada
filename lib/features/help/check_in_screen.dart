import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  String _selectedRating = 'Hard';

  final List<_RatingOption> _ratings = const [
    _RatingOption('Very hard', '😵'),
    _RatingOption('Hard', '😢'),
    _RatingOption('Okay', '😐'),
    _RatingOption('Good', '🙂'),
    _RatingOption('Great', '🤩'),
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
              Align(
                alignment: Alignment.centerLeft,
                child: FigmaCircleActionButton(
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 22,
                    color: AppColors.mainFont,
                  ),
                  tooltip: 'Close',
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/home');
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'How manageable does settling feel this week?',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  height: 1.12,
                  letterSpacing: -0.6,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 18),

              // 5-Emoji Rating Row matching Figma
              Row(
                children: _ratings.map((r) {
                  final isSelected = _selectedRating == r.label;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedRating = r.label;
                          });
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 74),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: isSelected
                                ? Border.all(
                                    color: AppColors.primary,
                                    width: 1.5,
                                  )
                                : null,
                            boxShadow:
                                isSelected ? kFigmaSelectedGlow : null,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                r.emoji,
                                style: const TextStyle(fontSize: 24),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                r.label,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 11,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.dark300,
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
              const SizedBox(height: 18),

              // Thank you message warm banner
              const FigmaNoticeBanner(
                isWarmAlert: true,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thank you for telling us',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5C1518),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Feeling stretched in the first months is very common — you're carrying a whole family's move. A few things that might help:",
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        height: 1.45,
                        color: Color(0xFF5C1518),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              _buildHelpAction(
                title: 'Switch to "just today"',
                subtitle: 'See one task at a time for a while',
                onTap: () => context.push('/just-today'),
              ),
              const SizedBox(height: 10),
              _buildHelpAction(
                title: 'Talk to a settlement worker',
                subtitle: 'A real person who helps newcomers every day',
                onTap: () => context.pushSafe('/help'),
              ),
              const SizedBox(height: 10),
              _buildHelpAction(
                title: 'Find newcomer groups near you',
                subtitle: 'Parents, language cafés, faith and cultural groups',
                onTap: () => context.push('/community-groups'),
              ),
              const SizedBox(height: 10),
              _buildHelpAction(
                title: 'Need to talk to someone now?',
                subtitle: '24/7 support lines',
                textColor: AppColors.red,
                onTap: () => context.push('/crisis'),
              ),
              const SizedBox(height: 22),

              const Center(
                child: Text(
                  'This is not therapy, a medical check or emergency care. Your answer stays private.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 12,
                    height: 1.45,
                    color: AppColors.dark300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpAction({
    required String title,
    required String subtitle,
    Color textColor = AppColors.mainFont,
    required VoidCallback onTap,
  }) {
    return FigmaSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: textColor,
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

class _RatingOption {
  final String label;
  final String emoji;
  const _RatingOption(this.label, this.emoji);
}
