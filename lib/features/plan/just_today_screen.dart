import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_typography.dart';

class JustTodayScreen extends StatelessWidget {
  const JustTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Eyebrow
              const Text(
                'JUST TODAY',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: Color(0xFFA82227),
                ),
              ),
              const SizedBox(height: 6),

              // Title
              Text(
                "One thing today. That's enough.",
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  height: 1.08,
                  letterSpacing: -0.8,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 20),

              // Focus task card
              InkWell(
                onTap: () => context.push('/checklists'),
                borderRadius: BorderRadius.circular(22),
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12123332),
                        blurRadius: 30,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'PAPERWORK',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          color: Color(0xFFA82227),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Put your SIN documents in one envelope',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                          color: Color(0xFF123332),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "About 10 minutes. Tomorrow's visit will feel easier.",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.45,
                          color: Color(0xFF3B4747),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Primary Done Button
              InkWell(
                onTap: () => context.push('/task-actions/done'),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF123332),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Done for today',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Bottom links
              Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => context.go('/home'),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Show my full plan',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => context.go('/home'),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Turn off "just today"',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
