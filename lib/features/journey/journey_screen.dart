import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../onboarding/onboarding_provider.dart';

class JourneyScreen extends ConsumerStatefulWidget {
  const JourneyScreen({super.key});

  @override
  ConsumerState<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends ConsumerState<JourneyScreen> {
  String _selectedPerson = 'Everyone';

  static const String _searchSvg = '''
<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
  <circle cx="11" cy="11" r="7"></circle>
  <path d="M20 20l-4-4"></path>
</svg>''';

  static const String _checkSvg = '''
<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#FFFFFF" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
  <path d="M5 12.5l4.5 4.5L19 7.5"></path>
</svg>''';

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingProvider);
    final destinationCity = onboardingState.city.isNotEmpty
        ? onboardingState.city
        : 'Mississauga';
    final memberCount = onboardingState.members.isNotEmpty
        ? onboardingState.members.length
        : 5;

    final personOptions = [
      'Everyone',
      if (onboardingState.members.isNotEmpty)
        ...onboardingState.members.map((m) => m.name)
      else ...[
        'Layla',
        'Omar',
        'Yasmin',
        'Sami',
        'Nour',
      ]
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your journey',
                          style: TextStyle(
                            fontFamily: AppTypography.fontHeading,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.6,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$destinationCity · $memberCount people · arrived Sep 2026',
                          style: const TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 14,
                            color: Color(0xFF5A5F6B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => context.push('/search'),
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                      ),
                      child: Center(
                        child: SvgPicture.string(
                          _searchSvg,
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Filter pills row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: personOptions.map((person) {
                    final isSelected = _selectedPerson == person;
                    return Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedPerson = person;
                          });
                        },
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          height: 36,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: isSelected
                                ? null
                                : Border.all(color: const Color(0xFFC8C8CE)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            person,
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 14,
                              fontWeight:
                                  isSelected ? FontWeight.w600 : FontWeight.w500,
                              color: isSelected ? Colors.white : AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 14),

              // Timeline
              Stack(
                children: [
                  // Vertical connecting line: left: 15px, top: 24px, bottom: 24px
                  Positioned(
                    left: 15,
                    top: 24,
                    bottom: 24,
                    child: Container(
                      width: 2,
                      color: const Color(0xFFD6D6DB),
                    ),
                  ),
                  Column(
                    children: [
                      // Stage 1 (Done)
                      _buildTimelineStage(
                        context,
                        stageId: '1',
                        stageNumber: 1,
                        title: 'Status & arrival documents',
                        subtitle: 'Done · 3 of 3',
                        subtitleColor: const Color(0xFF2E6B4F),
                        isDone: true,
                        isInProgress: false,
                      ),
                      // Stage 2 (In progress)
                      _buildTimelineStage(
                        context,
                        stageId: '2',
                        stageNumber: 2,
                        title: 'Paperwork',
                        subtitle: 'In progress · 1 of 4 · SIN, health cards, tax',
                        subtitleColor: const Color(0xFFA82227),
                        isDone: false,
                        isInProgress: true,
                      ),
                      // Stage 3
                      _buildTimelineStage(
                        context,
                        stageId: '3',
                        stageNumber: 3,
                        title: 'Housing',
                        subtitle: '8 tasks · finding a place, lease, moving in',
                        subtitleColor: const Color(0xFF5A5F6B),
                        isDone: false,
                        isInProgress: false,
                      ),
                      // Stage 4
                      _buildTimelineStage(
                        context,
                        stageId: '4',
                        stageNumber: 4,
                        title: 'School, college & university',
                        subtitle: '16 tasks · Sami, Nour, Yasmin',
                        subtitleColor: const Color(0xFF5A5F6B),
                        isDone: false,
                        isInProgress: false,
                      ),
                      // Stage 5
                      _buildTimelineStage(
                        context,
                        stageId: '5',
                        stageNumber: 5,
                        title: 'Car & driving',
                        subtitle: '9 tasks · Layla, Omar',
                        subtitleColor: const Color(0xFF5A5F6B),
                        isDone: false,
                        isInProgress: false,
                      ),
                      // Stage 6
                      _buildTimelineStage(
                        context,
                        stageId: '6',
                        stageNumber: 6,
                        title: 'Insurance',
                        subtitle:
                            '5 tasks · auto, tenant, health gap, benefits',
                        subtitleColor: const Color(0xFF5A5F6B),
                        isDone: false,
                        isInProgress: false,
                      ),
                      // Stage 7
                      _buildTimelineStage(
                        context,
                        stageId: '7',
                        stageNumber: 7,
                        title: 'Health care',
                        subtitle:
                            '8 tasks · family doctor, clinics, prescriptions',
                        subtitleColor: const Color(0xFF5A5F6B),
                        isDone: false,
                        isInProgress: false,
                      ),
                      // Stage 8
                      _buildTimelineStage(
                        context,
                        stageId: '8',
                        stageNumber: 8,
                        title: 'Money & benefits',
                        subtitle: '8 tasks · bank, credit, benefits, taxes',
                        subtitleColor: const Color(0xFF5A5F6B),
                        isDone: false,
                        isInProgress: false,
                      ),
                      // Stage 9
                      _buildTimelineStage(
                        context,
                        stageId: '9',
                        stageNumber: 9,
                        title: 'Work & credentials',
                        subtitle: '8 tasks · résumé, rights, P.Eng. licence',
                        subtitleColor: const Color(0xFF5A5F6B),
                        isDone: false,
                        isInProgress: false,
                      ),
                      // Stage 10
                      _buildTimelineStage(
                        context,
                        stageId: '10',
                        stageNumber: 10,
                        title: 'Community & belonging',
                        subtitle: '2 tasks · library, local groups',
                        subtitleColor: const Color(0xFF5A5F6B),
                        isDone: false,
                        isInProgress: false,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineStage(
    BuildContext context, {
    required String stageId,
    required int stageNumber,
    required String title,
    required String subtitle,
    required Color subtitleColor,
    required bool isDone,
    required bool isInProgress,
  }) {
    Widget indicator;
    if (isDone) {
      indicator = Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: Color(0xFF2E6B4F),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.string(_checkSvg, width: 16, height: 16),
        ),
      );
    } else if (isInProgress) {
      indicator = Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '$stageNumber',
          style: const TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      );
    } else {
      indicator = Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F5),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFABABB3), width: 2),
        ),
        alignment: Alignment.center,
        child: Text(
          '$stageNumber',
          style: TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: stageNumber >= 10 ? 13 : 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF3B4747),
          ),
        ),
      );
    }

    final rowContent = Row(
      children: [
        indicator,
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13,
                  color: subtitleColor,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.chevron_right,
          size: 20,
          color: Color(0xFF7A7A83),
        ),
      ],
    );

    if (isInProgress) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: InkWell(
          onTap: () => context.push('/stages/$stageId'),
          borderRadius: BorderRadius.circular(14),
          child: Container(
            constraints: const BoxConstraints(minHeight: 56),
            padding: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFDEDEE2)),
              borderRadius: BorderRadius.circular(14),
            ),
            child: rowContent,
          ),
        ),
      );
    }

    return InkWell(
      onTap: () => context.push('/stages/$stageId'),
      child: Container(
        constraints: BoxConstraints(minHeight: isDone ? 50 : 48),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: rowContent,
      ),
    );
  }
}
