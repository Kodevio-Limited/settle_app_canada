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
import '../../features/profile/edit_profile_screen.dart';
import '../../features/gallery/gallery_screen.dart';

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
        path: '/home',
        name: 'home',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Home')),
          body: const Center(child: Text('Home (Phase 3)')),
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
    ],
  );
}

final appRouter = createRouter();
