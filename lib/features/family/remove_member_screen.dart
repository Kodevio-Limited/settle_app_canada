import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_typography.dart';

class RemoveMemberScreen extends StatelessWidget {
  final String memberName;

  const RemoveMemberScreen({
    super.key,
    this.memberName = 'Nour',
  });

  @override
  Widget build(BuildContext context) {
    final initial = memberName.isNotEmpty ? memberName[0].toUpperCase() : 'N';

    return Scaffold(
      backgroundColor: const Color(0xFF4A4D55),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Avatar
                  Container(
                    width: 52,
                    height: 52,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF6B4C8A),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      initial,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Title
                  Text(
                    'Remove $memberName from your household?',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF123332),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Subtitle
                  Text(
                    "$memberName's tasks, ticks and reminders will be deleted. Your plan updates to match. This can't be undone.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.45,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Actions
                  InkWell(
                    onTap: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/family');
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA3261C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Remove $memberName',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  InkWell(
                    onTap: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/family');
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF123332),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
