import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settle_app/core/router/app_router.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  Widget createTestApp(String initialLocation) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: createRouter(initialLocation: initialLocation),
      ),
    );
  }

  testWidgets('S01: 1.1 Main -> Get started -> SignUp', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(createTestApp('/'));
    await tester.pumpAndSettle();
    expect(find.text('Get started'), findsOneWidget);
    await tester.tap(find.text('Get started'));
    await tester.pumpAndSettle();
    expect(find.text('Create your account'), findsOneWidget);
  });

  testWidgets('S01: 1.1 Main -> I already have an account -> SignIn', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(createTestApp('/'));
    await tester.pumpAndSettle();
    expect(find.text('I already have an account'), findsOneWidget);
    await tester.tap(find.text('I already have an account'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome back'), findsOneWidget);
  });

  testWidgets('S01: 1.1 Main -> Explore without an account -> GuestHome', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(createTestApp('/'));
    await tester.pumpAndSettle();
    expect(find.text('Explore without an account'), findsOneWidget);
    await tester.tap(find.text('Explore without an account'));
    await tester.pumpAndSettle();
    expect(find.textContaining("You're exploring"), findsOneWidget);
  });

  testWidgets('S01: 1.2 SignUp -> Social auth & terms navigate to Consent', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Continue with Apple
    await tester.pumpWidget(createTestApp('/sign-up'));
    await tester.pumpAndSettle();
    expect(find.text('Continue with Apple'), findsOneWidget);
    await tester.tap(find.text('Continue with Apple'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Your privacy, in plain'), findsOneWidget);

    // Continue with Google
    await tester.pumpWidget(createTestApp('/sign-up'));
    await tester.pumpAndSettle();
    expect(find.text('Continue with Google'), findsOneWidget);
    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Your privacy, in plain'), findsOneWidget);
  });

  testWidgets('S01: 1.2 SignUp -> Send me a code -> VerifyEmail', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(createTestApp('/sign-up'));
    await tester.pumpAndSettle();
    expect(find.text('Send me a code'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'layla@example.com');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Send me a code'));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();
    expect(find.text('Check your email'), findsOneWidget);
  });

  testWidgets('S01: 1.2 SignUp -> Back button -> Main', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(createTestApp('/sign-up'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Get started'), findsOneWidget);
  });

  testWidgets('S01: 1.3 VerifyEmail -> navigation buttons', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Back to SignUp
    await tester.pumpWidget(createTestApp('/verify-email'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Create your account'), findsOneWidget);

    // Use a different email
    await tester.pumpWidget(createTestApp('/verify-email'));
    await tester.pumpAndSettle();
    expect(find.text('Use a different email'), findsOneWidget);
    await tester.tap(find.text('Use a different email'));
    await tester.pumpAndSettle();
    expect(find.text('Create your account'), findsOneWidget);

    // Verify code
    await tester.pumpWidget(createTestApp('/verify-email'));
    await tester.pumpAndSettle();
    final textFields = find.byType(TextField);
    expect(textFields, findsNWidgets(6));
    for (int i = 0; i < 6; i++) {
      await tester.enterText(textFields.at(i), '${i + 1}');
    }
    await tester.pumpAndSettle();

    expect(find.text('Verify'), findsOneWidget);
    await tester.tap(find.text('Verify'));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();
    expect(find.textContaining('Your privacy, in plain'), findsOneWidget);
  });

  testWidgets('S01: 1.4 SignIn -> navigation buttons', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Sign in with Apple -> Home
    await tester.pumpWidget(createTestApp('/sign-in'));
    await tester.pumpAndSettle();
    expect(find.text('Sign in with Apple'), findsOneWidget);
    await tester.tap(find.text('Sign in with Apple'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Good morning'), findsOneWidget);

    // Sign in with Google -> Home
    await tester.pumpWidget(createTestApp('/sign-in'));
    await tester.pumpAndSettle();
    expect(find.text('Sign in with Google'), findsOneWidget);
    await tester.tap(find.text('Sign in with Google'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Good morning'), findsOneWidget);

    // Can't get into your email? Contact support -> /how-guidance
    await tester.pumpWidget(createTestApp('/sign-in'));
    await tester.pumpAndSettle();
    expect(find.text("Can't get into your email? Contact support"), findsOneWidget);
    await tester.tap(find.text("Can't get into your email? Contact support"));
    await tester.pumpAndSettle();
    expect(find.textContaining('guidance works'), findsOneWidget);

    // New here? Create an account -> /sign-up
    await tester.pumpWidget(createTestApp('/sign-in'));
    await tester.pumpAndSettle();
    expect(find.text('New here? Create an account'), findsOneWidget);
    await tester.tap(find.text('New here? Create an account'));
    await tester.pumpAndSettle();
    expect(find.text('Create your account'), findsOneWidget);

    // Send me a code -> /verify-email
    await tester.pumpWidget(createTestApp('/sign-in'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'layla@example.com');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Send me a code'));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();
    expect(find.text('Check your email'), findsOneWidget);
  });

  testWidgets('S01: 1.5 Consent, 1.6 Notif, 1.7 Location navigation', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // 1.5 Consent -> Agree and continue -> 1.6 NotifPermission
    await tester.pumpWidget(createTestApp('/consent'));
    await tester.pumpAndSettle();
    expect(find.text('Agree and continue'), findsOneWidget);
    await tester.tap(find.text('Agree and continue'));
    await tester.pumpAndSettle();
    expect(find.text('Never miss an important step'), findsOneWidget);

    // 1.5 Consent -> Read the full Privacy Policy -> 8.12 PrivacyPolicy
    await tester.pumpWidget(createTestApp('/consent'));
    await tester.pumpAndSettle();
    expect(find.text('Read the full Privacy Policy'), findsOneWidget);
    await tester.tap(find.text('Read the full Privacy Policy'));
    await tester.pumpAndSettle();
    expect(find.text('Full Privacy Policy (Phase 12)'), findsOneWidget);

    // 1.6 NotifPermission -> Turn on reminders -> 1.7 LocationPermission
    await tester.pumpWidget(createTestApp('/notif-permission'));
    await tester.pumpAndSettle();
    expect(find.text('Turn on reminders'), findsOneWidget);
    await tester.tap(find.text('Turn on reminders'));
    await tester.pumpAndSettle();
    expect(find.text('Find services near you'), findsOneWidget);

    // 1.6 NotifPermission -> Not now -> 1.7 LocationPermission
    await tester.pumpWidget(createTestApp('/notif-permission'));
    await tester.pumpAndSettle();
    expect(find.text('Not now'), findsOneWidget);
    await tester.tap(find.text('Not now'));
    await tester.pumpAndSettle();
    expect(find.text('Find services near you'), findsOneWidget);

    // 1.7 LocationPermission -> Use approximate location -> 2.1 Stage
    await tester.pumpWidget(createTestApp('/location-permission'));
    await tester.pumpAndSettle();
    expect(find.text('Use approximate location'), findsOneWidget);
    await tester.tap(find.text('Use approximate location'));
    await tester.pumpAndSettle();
    expect(find.text('Where are you in your move?'), findsOneWidget);

    // 1.7 LocationPermission -> Use this -> 2.1 Stage
    await tester.pumpWidget(createTestApp('/location-permission'));
    await tester.pumpAndSettle();
    expect(find.text('Use this'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'L5B');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Use this'));
    await tester.pumpAndSettle();
    expect(find.text('Where are you in your move?'), findsOneWidget);
  });
}
