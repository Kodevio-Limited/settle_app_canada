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
import '../../features/profile/settings_screen.dart';
import '../../features/profile/privacy_data_screen.dart';
import '../../features/profile/data_export_screen.dart';
import '../../features/profile/language_access_screen.dart';
import '../../features/profile/sign_out_confirm_screen.dart';
import '../../features/profile/deactivate_screen.dart';
import '../../features/profile/paused_screen.dart';
import '../../features/profile/welcome_back_screen.dart';
import '../../features/profile/delete_confirm_screen.dart';
import '../../features/profile/deleted_screen.dart';
import '../../features/guest/guest_home_screen.dart';
import '../../features/guest/integration_map_screen.dart';
import '../../features/errors/offline_screen.dart';
import '../../features/errors/location_denied_screen.dart';
import '../../features/errors/server_error_screen.dart';
import '../../features/partners/how_partners_screen.dart';
import '../../features/partners/partner_detail_screen.dart';
import '../../features/partners/legal_help_screen.dart';

import '../../features/tasks/regulated_pathway_detail_screen.dart';
import '../../features/tasks/all_professions_screen.dart';
import '../../features/plan/budget_planner_screen.dart';
import '../../features/family/join_household_screen.dart';
import '../../features/profile/privacy_policy_screen.dart';

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
        builder: (context, state) => const GuestHomeScreen(),
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

      // Phase 8: Account, Privacy, Pause & Deletion (11 Screens)
      GoRoute(
        path: '/edit-profile',
        name: 'editProfile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: '/privacy-data',
        name: 'privacyData',
        builder: (context, state) => const PrivacyDataScreen(),
      ),
      GoRoute(
        path: '/data-export',
        name: 'dataExport',
        builder: (context, state) => const DataExportScreen(),
      ),
      GoRoute(
        path: '/language-access',
        name: 'languageAccess',
        builder: (context, state) => const LanguageAccessScreen(),
      ),
      GoRoute(
        path: '/sign-out-confirm',
        name: 'signOutConfirm',
        builder: (context, state) => const SignOutConfirmScreen(),
      ),
      GoRoute(
        path: '/deactivate',
        name: 'deactivate',
        builder: (context, state) => const DeactivateScreen(),
      ),
      GoRoute(
        path: '/paused',
        name: 'paused',
        builder: (context, state) => const PausedScreen(),
      ),
      GoRoute(
        path: '/welcome-back',
        name: 'welcomeBack',
        builder: (context, state) => const WelcomeBackScreen(),
      ),
      GoRoute(
        path: '/delete-confirm',
        name: 'deleteConfirm',
        builder: (context, state) => const DeleteConfirmScreen(),
      ),
      GoRoute(
        path: '/deleted',
        name: 'deleted',
        builder: (context, state) => const DeletedScreen(),
      ),

      // Phase 9 & 10: Guest, Offline & Error States + System Data Flow
      GoRoute(
        path: '/offline',
        name: 'offline',
        builder: (context, state) => const OfflineScreen(),
      ),
      GoRoute(
        path: '/location-denied',
        name: 'locationDenied',
        builder: (context, state) => const LocationDeniedScreen(),
      ),
      GoRoute(
        path: '/server-error',
        name: 'serverError',
        builder: (context, state) => const ServerErrorScreen(),
      ),
      GoRoute(
        path: '/integration-map',
        name: 'integrationMap',
        builder: (context, state) => const IntegrationMapScreen(),
      ),

      // Phase 11: Sections 12 & 13 (Province Variants + Partners & Legal Help)
      GoRoute(
        path: '/how-partners',
        name: 'howPartners',
        builder: (context, state) => const HowPartnersScreen(),
      ),
      GoRoute(
        path: '/partner-detail',
        name: 'partnerDetail',
        builder: (context, state) => const PartnerDetailScreen(),
      ),
      GoRoute(
        path: '/legal-help',
        name: 'legalHelp',
        builder: (context, state) => const LegalHelpScreen(),
      ),

      // Province Variant Routes (BC, QC, MB)
      GoRoute(
        path: '/variants/bc-health',
        builder: (context, state) => const TaskDetailScreen(taskId: 'VarBCHealth'),
      ),
      GoRoute(
        path: '/variants/bc-health-gap',
        builder: (context, state) => const TaskDetailScreen(taskId: 'VarBCHealthGap'),
      ),
      GoRoute(
        path: '/variants/bc-icbc',
        builder: (context, state) => const TaskDetailScreen(taskId: 'VarBCICBC'),
      ),
      GoRoute(
        path: '/variants/mb-not-eligible',
        builder: (context, state) => const TaskDetailScreen(taskId: 'VarMBNotEligible'),
      ),
      GoRoute(
        path: '/variants/qc-health',
        builder: (context, state) => const TaskDetailScreen(taskId: 'VarQCHealth'),
      ),
      GoRoute(
        path: '/variants/qc-lease',
        builder: (context, state) => const TaskDetailScreen(taskId: 'VarQCLease'),
      ),
      GoRoute(
        path: '/variants/qc-school',
        builder: (context, state) => const TaskDetailScreen(taskId: 'VarQCSchool'),
      ),

      
      // Phase 12: Regulated Jobs Index & Gap Screens
      GoRoute(
        path: '/tasks/all-professions',
        builder: (context, state) => const AllProfessionsScreen(),
      ),
      GoRoute(
        path: '/tasks/engineer-pathway',
        builder: (context, state) => const OccupationPathwayScreen(),
      ),
      GoRoute(
        path: '/plan/budget-planner',
        builder: (context, state) => const BudgetPlannerScreen(),
      ),
      GoRoute(
        path: '/family/join-household',
        builder: (context, state) => const JoinHouseholdScreen(),
      ),
      GoRoute(
        path: '/profile/privacy-policy',
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: '/tasks/task-car-costs',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskCarCosts'),
      ),
      // All 44 regulated pathway detail screens
      GoRoute(
        path: '/tasks/pathway-architect',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayArchitect'),
      ),
      GoRoute(
        path: '/tasks/pathway-audiologist-slp',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayAudiologistSLP'),
      ),
      GoRoute(
        path: '/tasks/pathway-auto-body',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayAutoBody'),
      ),
      GoRoute(
        path: '/tasks/pathway-auto-tech',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayAutoTech'),
      ),
      GoRoute(
        path: '/tasks/pathway-cpa',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayCPA'),
      ),
      GoRoute(
        path: '/tasks/pathway-chiropractor',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayChiropractor'),
      ),
      GoRoute(
        path: '/tasks/pathway-crane',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayCrane'),
      ),
      GoRoute(
        path: '/tasks/pathway-dental-hygienist',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayDentalHygienist'),
      ),
      GoRoute(
        path: '/tasks/pathway-dentist',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayDentist'),
      ),
      GoRoute(
        path: '/tasks/pathway-denturist',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayDenturist'),
      ),
      GoRoute(
        path: '/tasks/pathway-dietitian',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayDietitian'),
      ),
      GoRoute(
        path: '/tasks/pathway-ece',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayECE'),
      ),
      GoRoute(
        path: '/tasks/pathway-electrician',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayElectrician'),
      ),
      GoRoute(
        path: '/tasks/pathway-geoscientist',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayGeoscientist'),
      ),
      GoRoute(
        path: '/tasks/pathway-hairstylist',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayHairstylist'),
      ),
      GoRoute(
        path: '/tasks/pathway-insurance',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayInsurance'),
      ),
      GoRoute(
        path: '/tasks/pathway-kinesiologist',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayKinesiologist'),
      ),
      GoRoute(
        path: '/tasks/pathway-lawyer',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayLawyer'),
      ),
      GoRoute(
        path: '/tasks/pathway-mlt',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayMLT'),
      ),
      GoRoute(
        path: '/tasks/pathway-mrt',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayMRT'),
      ),
      GoRoute(
        path: '/tasks/pathway-massage',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayMassage'),
      ),
      GoRoute(
        path: '/tasks/pathway-midwife',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayMidwife'),
      ),
      GoRoute(
        path: '/tasks/pathway-mortgage',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayMortgage'),
      ),
      GoRoute(
        path: '/tasks/pathway-nurse',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayNurse'),
      ),
      GoRoute(
        path: '/tasks/pathway-ot',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayOT'),
      ),
      GoRoute(
        path: '/tasks/pathway-optician',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayOptician'),
      ),
      GoRoute(
        path: '/tasks/pathway-optometrist',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayOptometrist'),
      ),
      GoRoute(
        path: '/tasks/pathway-paralegal',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayParalegal'),
      ),
      GoRoute(
        path: '/tasks/pathway-pharmacist',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayPharmacist'),
      ),
      GoRoute(
        path: '/tasks/pathway-physician',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayPhysician'),
      ),
      GoRoute(
        path: '/tasks/pathway-physio',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayPhysio'),
      ),
      GoRoute(
        path: '/tasks/pathway-plumber',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayPlumber'),
      ),
      GoRoute(
        path: '/tasks/pathway-psychologist',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayPsychologist'),
      ),
      GoRoute(
        path: '/tasks/pathway-psychotherapist',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayPsychotherapist'),
      ),
      GoRoute(
        path: '/tasks/pathway-rt',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayRT'),
      ),
      GoRoute(
        path: '/tasks/pathway-real-estate',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayRealEstate'),
      ),
      GoRoute(
        path: '/tasks/pathway-refrigeration',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayRefrigeration'),
      ),
      GoRoute(
        path: '/tasks/pathway-sheet-metal',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwaySheetMetal'),
      ),
      GoRoute(
        path: '/tasks/pathway-social-worker',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwaySocialWorker'),
      ),
      GoRoute(
        path: '/tasks/pathway-steamfitter',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwaySteamfitter'),
      ),
      GoRoute(
        path: '/tasks/pathway-surveyor',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwaySurveyor'),
      ),
      GoRoute(
        path: '/tasks/pathway-teacher',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayTeacher'),
      ),
      GoRoute(
        path: '/tasks/pathway-truck-coach',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayTruckCoach'),
      ),
      GoRoute(
        path: '/tasks/pathway-vet',
        builder: (context, state) => const RegulatedPathwayDetailScreen(pathwayId: 'PathwayVet'),
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
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskImmunization'),
      ),
      GoRoute(
        path: '/tasks/esl',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskESL'),
      ),
      GoRoute(
        path: '/tasks/aftercare',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskAfterCare'),
      ),
      GoRoute(
        path: '/tasks/bank',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskBank'),
      ),
      GoRoute(
        path: '/tasks/cra',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskCRA'),
      ),
      GoRoute(
        path: '/tasks/campusservices',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskCampusServices'),
      ),
      GoRoute(
        path: '/tasks/credentialassess',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskCredentialAssess'),
      ),
      GoRoute(
        path: '/tasks/credit',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskCredit'),
      ),
      GoRoute(
        path: '/tasks/domestictuition',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskDomesticTuition'),
      ),
      GoRoute(
        path: '/tasks/drivingrecord',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskDrivingRecord'),
      ),
      GoRoute(
        path: '/tasks/englishtest',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskEnglishTest'),
      ),
      GoRoute(
        path: '/tasks/groups',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskGroups'),
      ),
      GoRoute(
        path: '/tasks/healthcard',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskHealthCard'),
      ),
      GoRoute(
        path: '/tasks/healthgap',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskHealthGap'),
      ),
      GoRoute(
        path: '/tasks/kidsdental',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskKidsDental'),
      ),
      GoRoute(
        path: '/tasks/landingdocs',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskLandingDocs'),
      ),
      GoRoute(
        path: '/tasks/lease',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskLease'),
      ),
      GoRoute(
        path: '/tasks/prbasics',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskPRBasics'),
      ),
      GoRoute(
        path: '/tasks/presto',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskPresto'),
      ),
      GoRoute(
        path: '/tasks/roadtest',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskRoadTest'),
      ),
      GoRoute(
        path: '/tasks/scams',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskScams'),
      ),
      GoRoute(
        path: '/tasks/taxreturn',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskTaxReturn'),
      ),
      GoRoute(
        path: '/tasks/tenantinsurance',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskTenantInsurance'),
      ),
      GoRoute(
        path: '/tasks/utilities',
        builder: (context, state) => const TaskDetailScreen(taskId: 'TaskUtilities'),
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
                builder: (context, state) => const SettingsScreen(),
              ),
              GoRoute(
                path: '/me',
                name: 'me',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

final appRouter = createRouter();
