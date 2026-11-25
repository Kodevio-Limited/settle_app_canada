import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/main_welcome_screen.dart';
import '../../features/auth/sign_up_screen.dart';
import '../../features/auth/sign_in_screen.dart';
import '../../features/auth/verify_email_screen.dart';
import '../../features/auth/consent_screen.dart';
import '../../features/auth/notif_permission_screen.dart';
import '../../features/auth/location_permission_screen.dart';
import '../../features/onboarding/stage_screen.dart';
import '../../features/onboarding/destination_screen.dart';
import '../../features/onboarding/status_screen.dart';
import '../../features/onboarding/household_screen.dart';
import '../../features/onboarding/add_child_screen.dart';
import '../../features/onboarding/add_adult_screen.dart';
import '../../features/onboarding/add_student_screen.dart';
import '../../features/onboarding/priorities_screen.dart';
import '../../features/onboarding/plan_ready_screen.dart';
import '../../features/navigation/bottom_nav_scaffold.dart';
import '../../features/home/home_screen.dart';
import '../../features/journey/journey_screen.dart';
import '../../features/stages/stage_detail_screen.dart';
import '../../features/profile/edit_profile_screen.dart';
import '../../features/gallery/gallery_screen.dart';
import '../../features/tasks/task_detail_screen.dart';
import '../../features/tasks/occupation_search_screen.dart';
import '../../features/tasks/occupation_pathway_screen.dart';
import '../../features/task_actions/nearby_screen.dart';
import '../../features/task_actions/location_detail_screen.dart';
import '../../features/task_actions/done_picker_screen.dart';
import '../../features/task_actions/task_done_screen.dart';
import '../../features/task_actions/snooze_screen.dart';
import '../../features/task_actions/dismiss_screen.dart';
import '../../features/task_actions/report_outdated_screen.dart';
import '../../features/task_actions/content_updated_screen.dart';
import '../../app/router/pending_routes.dart';

GoRouter createRouter({String initialLocation = '/'}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: '/',
        name: 'welcome',
        builder: (context, state) => const MainWelcomeScreen(),
      ),
      GoRoute(
        path: '/main',
        redirect: (context, state) => '/',
      ),
      GoRoute(
        path: '/sign-up',
        name: 'signUp',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/sign-in',
        name: 'signIn',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/verify-email',
        name: 'verifyEmail',
        builder: (context, state) => const VerifyEmailScreen(),
      ),
      GoRoute(
        path: '/consent',
        name: 'consent',
        builder: (context, state) => const ConsentScreen(),
      ),
      GoRoute(
        path: '/notif-permission',
        name: 'notifPermission',
        builder: (context, state) => const NotifPermissionScreen(),
      ),
      GoRoute(
        path: '/location-permission',
        name: 'locationPermission',
        builder: (context, state) => const LocationPermissionScreen(),
      ),
      GoRoute(
        path: '/gallery',
        name: 'gallery',
        builder: (context, state) => const GalleryScreen(),
      ),
      // Fallback placeholder routes for cross-section links
      GoRoute(
        path: '/guest-home',
        name: 'guestHome',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Guest Mode')),
          body: const Center(child: Text('Exploring without an account (Phase 9)')),
        ),
      ),
      GoRoute(
        path: '/stage',
        name: 'stage',
        builder: (context, state) => const OnboardingStageScreen(),
      ),
      GoRoute(
        path: '/destination',
        name: 'destination',
        builder: (context, state) => const OnboardingDestinationScreen(),
      ),
      GoRoute(
        path: '/status',
        name: 'status',
        builder: (context, state) => const OnboardingStatusScreen(),
      ),
      GoRoute(
        path: '/household',
        name: 'household',
        builder: (context, state) => const OnboardingHouseholdScreen(),
      ),
      GoRoute(
        path: '/add-child',
        name: 'addChild',
        builder: (context, state) => const AddChildScreen(),
      ),
      GoRoute(
        path: '/add-adult',
        name: 'addAdult',
        builder: (context, state) {
          final type = state.uri.queryParameters['type'] ?? 'Partner or spouse';
          return AddAdultScreen(initialType: type);
        },
      ),
      GoRoute(
        path: '/add-student',
        name: 'addStudent',
        builder: (context, state) => const AddStudentScreen(),
      ),
      GoRoute(
        path: '/priorities',
        name: 'priorities',
        builder: (context, state) => const OnboardingPrioritiesScreen(),
      ),
      GoRoute(
        path: '/plan-ready',
        name: 'planReady',
        builder: (context, state) => const PlanReadyScreen(),
      ),
      GoRoute(
        path: '/privacy-policy',
        name: 'privacyPolicy',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Privacy Policy')),
          body: const Center(child: Text('Full Privacy Policy (Phase 12)')),
        ),
      ),
      GoRoute(
        path: '/how-guidance',
        name: 'howGuidance',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('How Guidance Works')),
          body: const Center(child: Text('Support & Guidance (Phase 7)')),
        ),
      ),
      GoRoute(
        path: '/edit-profile',
        name: 'editProfile',
        builder: (context, state) => const EditProfileScreen(),
      ),

      // Phase 4: Full Tasks, Nearby Services, University Tasks & Licensing
      GoRoute(
        path: '/tasks/:id',
        name: 'taskDetail',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? 'TaskSIN';
          return TaskDetailScreen(taskId: id);
        },
      ),
      GoRoute(
        path: '/task-status',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskStatus'),
      ),
      GoRoute(
        path: '/task-sin',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskSIN'),
      ),
      GoRoute(
        path: '/task-housing',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskHousing'),
      ),
      GoRoute(
        path: '/task-school',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskSchool'),
      ),
      GoRoute(
        path: '/task-licence',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskLicence'),
      ),
      GoRoute(
        path: '/task-insurance',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskInsurance'),
      ),
      GoRoute(
        path: '/task-doctor',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskDoctor'),
      ),
      GoRoute(
        path: '/task-ccb',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskCCB'),
      ),
      GoRoute(
        path: '/task-work',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskWork'),
      ),
      GoRoute(
        path: '/task-library',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskLibrary'),
      ),
      GoRoute(
        path: '/task-uni-apply',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskUniApply'),
      ),
      GoRoute(
        path: '/task-osap',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskOSAP'),
      ),
      GoRoute(
        path: '/occupation-search',
        builder: (context, state) => const OccupationSearchScreen(),
      ),
      GoRoute(
        path: '/occupation-pathway',
        builder: (context, state) => const OccupationPathwayScreen(),
      ),

      // Phase 5: Task Actions, Nearby Map & Content Updates
      GoRoute(
        path: '/nearby',
        builder: (context, state) => const NearbyScreen(),
      ),
      GoRoute(
        path: '/location-detail',
        builder: (context, state) => const LocationDetailScreen(),
      ),
      GoRoute(
        path: '/done-picker',
        builder: (context, state) => const DonePickerScreen(),
      ),
      GoRoute(
        path: '/task-done',
        builder: (context, state) => const TaskDoneScreen(),
      ),
      GoRoute(
        path: '/snooze',
        builder: (context, state) => const SnoozeScreen(),
      ),
      GoRoute(
        path: '/dismiss',
        builder: (context, state) => const DismissScreen(),
      ),
      GoRoute(
        path: '/report-outdated',
        builder: (context, state) => const ReportOutdatedScreen(),
      ),
      GoRoute(
        path: '/content-updated',
        builder: (context, state) => const ContentUpdatedScreen(),
      ),

      // Persistent 5-Tab Shell (Phase 3: Home, Journey & 10 Stages)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavScaffold(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),

          // Branch 1: Journey & 10 Stages (+ University Stream)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/journey',
                name: 'journey',
                builder: (context, state) => const JourneyScreen(),
              ),
              GoRoute(
                path: '/stages/:id',
                name: 'stageDetail',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '1';
                  return StageDetailScreen(stageId: id);
                },
              ),
              GoRoute(
                path: '/stage-status',
                name: 'stageStatus',
                builder: (context, state) => const StageDetailScreen(stageId: '1'),
              ),
              GoRoute(
                path: '/stage-paperwork',
                name: 'stagePaperwork',
                builder: (context, state) => const StageDetailScreen(stageId: '2'),
              ),
              GoRoute(
                path: '/stage-housing',
                name: 'stageHousing',
                builder: (context, state) => const StageDetailScreen(stageId: '3'),
              ),
              GoRoute(
                path: '/stage-schools',
                name: 'stageSchools',
                builder: (context, state) => const StageDetailScreen(stageId: '4'),
              ),
              GoRoute(
                path: '/stage-university',
                name: 'stageUniversity',
                builder: (context, state) => const StageDetailScreen(stageId: '4b'),
              ),
              GoRoute(
                path: '/stage-car',
                name: 'stageCar',
                builder: (context, state) => const StageDetailScreen(stageId: '5'),
              ),
              GoRoute(
                path: '/stage-insurance',
                name: 'stageInsurance',
                builder: (context, state) => const StageDetailScreen(stageId: '6'),
              ),
              GoRoute(
                path: '/stage-health',
                name: 'stageHealth',
                builder: (context, state) => const StageDetailScreen(stageId: '7'),
              ),
              GoRoute(
                path: '/stage-money',
                name: 'stageMoney',
                builder: (context, state) => const StageDetailScreen(stageId: '8'),
              ),
              GoRoute(
                path: '/stage-work',
                name: 'stageWork',
                builder: (context, state) => const StageDetailScreen(stageId: '9'),
              ),
              GoRoute(
                path: '/stage-community',
                name: 'stageCommunity',
                builder: (context, state) => const StageDetailScreen(stageId: '10'),
              ),
            ],
          ),

          // Branch 2: Explore
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/explore',
                name: 'explore',
                builder: (context, state) => Scaffold(
                  appBar: AppBar(title: const Text('Explore')),
                  body: const Center(child: Text('Explore (Phase 8)')),
                ),
              ),
            ],
          ),

          // Branch 3: Help
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/help',
                name: 'help',
                builder: (context, state) => Scaffold(
                  appBar: AppBar(title: const Text('Help')),
                  body: const Center(child: Text('Help & Trusted Support (Phase 7)')),
                ),
              ),
            ],
          ),

          // Branch 4: Me / Settings
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (context, state) => const EditProfileScreen(),
              ),
              GoRoute(
                path: '/me',
                name: 'me',
                builder: (context, state) => const EditProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      ...pendingS10Routes,
    ],
  );
}

final appRouter = createRouter();
