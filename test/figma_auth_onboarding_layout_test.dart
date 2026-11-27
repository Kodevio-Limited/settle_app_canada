import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/router/app_router.dart';

void main() {
  const routesToVerify = [
    '/',
    '/sign-in',
    '/sign-up',
    '/verify-email',
    '/consent',
    '/notif-permission',
    '/location-permission',
    '/stage',
    '/destination',
    '/status',
    '/household',
    '/add-child',
    '/add-adult',
    '/add-student',
    '/priorities',
    '/plan-ready',
  ];

  testWidgets('All 16 redesigned Auth & Onboarding screens render cleanly at 375x812 without overflow',
      (tester) async {
    tester.view.physicalSize = const Size(750, 1624);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    for (final route in routesToVerify) {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routerConfig: createRouter(initialLocation: route),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: 'Unexpected layout error on $route');
    }

    // Verify Figma SVGs/Images are wired on key screens
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          routerConfig: createRouter(initialLocation: '/notif-permission'),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SvgPicture), findsWidgets);

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          routerConfig: createRouter(initialLocation: '/plan-ready'),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SvgPicture), findsWidgets);
  });
}

