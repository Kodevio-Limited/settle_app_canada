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
import '../../features/family/family_screen.dart';
import '../../features/family/member_adult_screen.dart';
import '../../features/family/member_child_screen.dart';
import '../../features/family/member_student_screen.dart';
import '../../features/family/remove_member_screen.dart';
import '../../features/checklists/checklist_screen.dart';
import '../../features/reminders/reminders_screen.dart';
import '../../features/reminders/calendar_screen.dart';
import '../../features/reminders/notification_settings_screen.dart';
import '../../features/plan/life_event_screen.dart';
import '../../features/plan/plan_change_screen.dart';
import '../../features/plan/just_today_screen.dart';
import '../../features/search/search_screen.dart';
import '../../features/help/help_screen.dart';
import '../../features/help/crisis_screen.dart';
import '../../features/help/check_in_screen.dart';
import '../../features/help/community_groups_screen.dart';
import '../../features/help/how_guidance_screen.dart';
import '../../features/help/conversation_guide_screen.dart';

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
        builder: (context, state) => const HowGuidanceScreen(),
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

      // Phase 6: Family, Checklists, Reminders & Plan Changes (13 Screens)
      GoRoute(
        path: '/family',
        name: 'family',
        builder: (context, state) => const FamilyScreen(),
      ),
      GoRoute(
        path: '/family/member-adult',
        builder: (context, state) => const MemberAdultScreen(),
      ),
      GoRoute(
        path: '/member-adult',
        builder: (context, state) => const MemberAdultScreen(),
      ),
      GoRoute(
        path: '/family/member-child',
        builder: (context, state) => const MemberChildScreen(),
      ),
      GoRoute(
        path: '/member-child',
        builder: (context, state) => const MemberChildScreen(),
      ),
      GoRoute(
        path: '/family/member-student',
        builder: (context, state) => const MemberStudentScreen(),
      ),
      GoRoute(
        path: '/member-student',
        builder: (context, state) => const MemberStudentScreen(),
      ),
      GoRoute(
        path: '/family/remove-member',
        builder: (context, state) {
          final name = state.uri.queryParameters['name'] ?? 'Nour';
          return RemoveMemberScreen(memberName: name);
        },
      ),
      GoRoute(
        path: '/remove-member',
        builder: (context, state) {
          final name = state.uri.queryParameters['name'] ?? 'Nour';
          return RemoveMemberScreen(memberName: name);
        },
      ),
      GoRoute(
        path: '/checklist',
        name: 'checklist',
        builder: (context, state) => const ChecklistScreen(),
      ),
      GoRoute(
        path: '/checklists',
        builder: (context, state) => const ChecklistScreen(),
      ),
      GoRoute(
        path: '/reminders',
        name: 'reminders',
        builder: (context, state) => const RemindersScreen(),
      ),
      GoRoute(
        path: '/reminders/calendar',
        builder: (context, state) => const CalendarScreen(),
      ),
      GoRoute(
        path: '/calendar',
        name: 'calendar',
        builder: (context, state) => const CalendarScreen(),
      ),
      GoRoute(
        path: '/reminders/settings',
        builder: (context, state) => const NotificationSettingsScreen(),
      ),
      GoRoute(
        path: '/notification-settings',
        name: 'notificationSettings',
        builder: (context, state) => const NotificationSettingsScreen(),
      ),
      GoRoute(
        path: '/life-event',
        name: 'lifeEvent',
        builder: (context, state) => const LifeEventScreen(),
      ),
      GoRoute(
        path: '/plan/life-event',
        builder: (context, state) => const LifeEventScreen(),
      ),
      GoRoute(
        path: '/plan-change',
        name: 'planChange',
        builder: (context, state) => const PlanChangeScreen(),
      ),
      GoRoute(
        path: '/plan/plan-change',
        builder: (context, state) => const PlanChangeScreen(),
      ),
      GoRoute(
        path: '/just-today',
        name: 'justToday',
        builder: (context, state) => const JustTodayScreen(),
      ),
      GoRoute(
        path: '/plan/just-today',
        builder: (context, state) => const JustTodayScreen(),
      ),
      GoRoute(
        path: '/search',
        name: 'search',
        builder: (context, state) => const SearchScreen(),
      ),

      // Phase 7: Trusted Help & Wellbeing (6 Screens)
      GoRoute(
        path: '/crisis',
        name: 'crisis',
        builder: (context, state) => const CrisisScreen(),
      ),
      GoRoute(
        path: '/check-in',
        name: 'checkIn',
        builder: (context, state) => const CheckInScreen(),
      ),
      GoRoute(
        path: '/checkin',
        builder: (context, state) => const CheckInScreen(),
      ),
      GoRoute(
        path: '/community-groups',
        name: 'communityGroups',
        builder: (context, state) => const CommunityGroupsScreen(),
      ),
      GoRoute(
        path: '/help/community-groups',
        builder: (context, state) => const CommunityGroupsScreen(),
      ),
      GoRoute(
        path: '/help/how-guidance',
        builder: (context, state) => const HowGuidanceScreen(),
      ),
      GoRoute(
        path: '/conversation-guide',
        name: 'conversationGuide',
        builder: (context, state) => const ConversationGuideScreen(),
      ),
      GoRoute(
        path: '/help/conversation-guide',
        builder: (context, state) => const ConversationGuideScreen(),
      ),

      // Navigation aliases for Phase 6 inter-screen links
      GoRoute(
        path: '/occupations/pathway',
        builder: (context, state) => const OccupationPathwayScreen(),
      ),
      GoRoute(
        path: '/tasks/sin',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskSIN'),
      ),
      GoRoute(
        path: '/tasks/licence',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskLicence'),
      ),
      GoRoute(
        path: '/tasks/work',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskWork'),
      ),
      GoRoute(
        path: '/tasks/school',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskSchool'),
      ),
      GoRoute(
        path: '/tasks/immunization',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskSchool'),
      ),
      GoRoute(
        path: '/tasks/esl',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskSchool'),
      ),
      GoRoute(
        path: '/tasks/doctor',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskDoctor'),
      ),
      GoRoute(
        path: '/stages/stage-university',
        builder: (context, state) => const StageDetailScreen(stageId: '4b'),
      ),
      GoRoute(
        path: '/stages/stage-insurance',
        builder: (context, state) => const StageDetailScreen(stageId: '6'),
      ),
      GoRoute(
        path: '/task-actions/nearby',
        builder: (context, state) => const NearbyScreen(),
      ),
      GoRoute(
        path: '/task-actions/location-detail',
        builder: (context, state) => const LocationDetailScreen(),
      ),
      GoRoute(
        path: '/task-actions/done',
        builder: (context, state) => const TaskDoneScreen(),
      ),
      GoRoute(
        path: '/onboarding/destination',
        builder: (context, state) => const OnboardingDestinationScreen(),
      ),
      GoRoute(
        path: '/onboarding/add-child',
        builder: (context, state) => const AddChildScreen(),
      ),
      GoRoute(
        path: '/onboarding/add-adult',
        builder: (context, state) => const AddAdultScreen(),
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
                builder: (context, state) => const HelpScreen(),
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
    ],
  );
}

final appRouter = createRouter();
