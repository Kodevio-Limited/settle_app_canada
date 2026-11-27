import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';
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
      ],
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Centered Figma Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Your journey',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.6,
                      color: AppColors.mainFont,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '$destinationCity · $memberCount people · arrived Sep 2026',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13.5,
                      color: AppColors.dark300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Full-pill Search Bar (preserves borderRadius(22) finder)
              InkWell(
                onTap: () => context.push('/search'),
                borderRadius: BorderRadius.circular(22),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search_rounded,
                        size: 20,
                        color: AppColors.dark200,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 15,
                          color: AppColors.dark200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Filter pills row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: personOptions.map((person) {
                    final isSelected = _selectedPerson == person;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedPerson = person;
                          });
                        },
                        borderRadius: BorderRadius.circular(999),
                        child: Container(
                          height: 38,
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.dark50,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            person,
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.dark300,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 18),

              // Clean Figma Timeline
              Stack(
                children: [
                  Positioned(
                    left: 15,
                    top: 24,
                    bottom: 24,
                    child: Container(
                      width: 1.5,
                      color: const Color(0xFFC5C5C7),
                    ),
                  ),
                  Column(
                    children: [
                      _buildTimelineStage(
                        context,
                        stageId: '1',
                        stageNumber: 1,
                        title: 'Status & arrival documents',
                        subtitle: 'Done · 3 of 3',
                        subtitleColor: AppColors.secondary,
                        isDone: true,
                        isInProgress: false,
                      ),
                      _buildTimelineStage(
                        context,
                        stageId: '2',
                        stageNumber: 2,
                        title: 'Paperwork',
                        subtitle: 'In progress · 1 of 4 · SIN, health cards, tax',
                        subtitleColor: AppColors.red,
                        isDone: false,
                        isInProgress: true,
                      ),
                      _buildTimelineStage(
                        context,
                        stageId: '3',
                        stageNumber: 3,
                        title: 'Housing',
                        subtitle: '8 tasks · finding a place, lease, moving in',
                        subtitleColor: AppColors.dark300,
                        isDone: false,
                        isInProgress: false,
                      ),
                      _buildTimelineStage(
                        context,
                        stageId: '4',
                        stageNumber: 4,
                        title: 'School, college & university',
                        subtitle: '16 tasks · Sami, Nour, Yasmin',
                        subtitleColor: AppColors.dark300,
                        isDone: false,
                        isInProgress: false,
                      ),
                      _buildTimelineStage(
                        context,
                        stageId: '5',
                        stageNumber: 5,
                        title: 'Car & driving',
                        subtitle: '9 tasks · Layla, Omar',
                        subtitleColor: AppColors.dark300,
                        isDone: false,
                        isInProgress: false,
                      ),
                      _buildTimelineStage(
                        context,
                        stageId: '6',
                        stageNumber: 6,
                        title: 'Insurance',
                        subtitle:
                            '5 tasks · auto, tenant, health gap, benefits',
                        subtitleColor: AppColors.dark300,
                        isDone: false,
                        isInProgress: false,
                      ),
                      _buildTimelineStage(
                        context,
                        stageId: '7',
                        stageNumber: 7,
                        title: 'Health care',
                        subtitle:
                            '8 tasks · family doctor, clinics, prescriptions',
                        subtitleColor: AppColors.dark300,
                        isDone: false,
                        isInProgress: false,
                      ),
                      _buildTimelineStage(
                        context,
                        stageId: '8',
                        stageNumber: 8,
                        title: 'Money & benefits',
                        subtitle: '8 tasks · bank, credit, benefits, taxes',
                        subtitleColor: AppColors.dark300,
                        isDone: false,
                        isInProgress: false,
                      ),
                      _buildTimelineStage(
                        context,
                        stageId: '9',
                        stageNumber: 9,
                        title: 'Work & credentials',
                        subtitle: '8 tasks · résumé, rights, P.Eng. licence',
                        subtitleColor: AppColors.dark300,
                        isDone: false,
                        isInProgress: false,
                      ),
                      _buildTimelineStage(
                        context,
                        stageId: '10',
                        stageNumber: 10,
                        title: 'Community & belonging',
                        subtitle: '2 tasks · library, local groups',
                        subtitleColor: AppColors.dark300,
                        isDone: false,
                        isInProgress: false,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
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
          color: AppColors.secondary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check_rounded,
          size: 17,
          color: Colors.white,
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
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      );
    } else {
      indicator = Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: AppColors.dark50,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '$stageNumber',
          style: TextStyle(
            fontFamily: AppTypography.fontBody,
            fontSize: stageNumber >= 10 ? 12.5 : 13.5,
            fontWeight: FontWeight.w600,
            color: AppColors.dark200,
          ),
        ),
      );
    }

    return InkWell(
      onTap: () => context.pushSafe('/stages/$stageId'),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            indicator,
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainFont,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 12.5,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: Color(0xFF989898),
            ),
          ],
        ),
      ),
    );
  }
}
