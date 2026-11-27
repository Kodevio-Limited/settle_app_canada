import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:settle_app/core/widgets/content_screen.dart';
import 'package:settle_app/core/widgets/figma_onboarding_widgets.dart';
import 'package:settle_app/core/widgets/settle_button.dart';
import 'package:settle_app/features/guest/guest_home_screen.dart';
import 'package:settle_app/features/home/home_screen.dart';
import 'package:settle_app/features/profile/delete_confirm_screen.dart';
import 'package:settle_app/features/tasks/task_detail_screen.dart';

Widget _wrap(Widget child) => ProviderScope(child: MaterialApp(home: child));

void main() {
  testWidgets('Path 1: New user reaches HomeScreen', (tester) async {
    await tester.pumpWidget(_wrap(const HomeScreen()));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Path 2: Task detail renders', (tester) async {
    await tester.pumpWidget(_wrap(const TaskDetailScreen(taskId: 'sin')));
    await tester.pumpAndSettle();
    expect(find.byType(TaskDetailScreen), findsOneWidget);
  });

  testWidgets('Path 3: Guest home renders', (tester) async {
    await tester.pumpWidget(_wrap(const GuestHomeScreen()));
    await tester.pumpAndSettle();
    expect(find.byType(GuestHomeScreen), findsOneWidget);
  });

  testWidgets('Path 4: Delete account confirmation renders', (tester) async {
    await tester.pumpWidget(_wrap(const DeleteConfirmScreen()));
    await tester.pumpAndSettle();
    expect(find.byType(DeleteConfirmScreen), findsOneWidget);
  });

  testWidgets('Path 5: ContentScreen & shared Figma widgets render', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const ContentScreen(
          title: 'Test Guide',
          routePath: '/test-guide',
          lines: ['Step 1', 'Step 2'],
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(FigmaSubPageHeader), findsOneWidget);
    expect(find.byType(FigmaSurfaceCard), findsOneWidget);
  });

  testWidgets('Shared widgets: SettleButton and FigmaCircleBackButton', (tester) async {
    await tester.pumpWidget(
      _wrap(
        Scaffold(
          body: Column(
            children: [
              FigmaCircleBackButton(onPressed: () {}),
              SettleButton(label: 'Continue', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
    expect(find.text('Continue'), findsOneWidget);
    expect(find.byType(FigmaCircleBackButton), findsOneWidget);
  });
}
