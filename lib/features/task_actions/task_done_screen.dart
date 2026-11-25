import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';

class TaskDoneScreen extends StatelessWidget {
  final String personName;
  final String taskName;

  const TaskDoneScreen({
    super.key,
    this.personName = 'Layla',
    this.taskName = 'SIN',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 48, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Large green checkmark circle
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2E6B4F),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.check, size: 38, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Title and text
              Text(
                '$taskName marked as done for $personName',
                style: const TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                  height: 1.1,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "We've noted it in your plan. We don't send anything to Service Canada for you — this is just your checklist.",
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 15,
                  height: 1.5,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 18),

              // Still open for Omar card
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: Color(0xFF2E6B4F),
                      child: Text(
                        'O',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Still open for '),
                            TextSpan(
                              text: 'Omar',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 14,
                          color: Color(0xFF123332),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push('/task-sin'),
                      child: const Text(
                        'Mark for Omar',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF123332),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Now unlocked
              const Text(
                'Now unlocked',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 10),
              _buildUnlockedCard(
                category: 'MONEY & BENEFITS',
                title: 'Apply for the Canada Child Benefit',
                sub: 'For Sami & Nour · uses your SIN',
                onTap: () => context.push('/task-ccb'),
              ),
              const SizedBox(height: 8),
              _buildUnlockedCard(
                category: 'PAPERWORK',
                title: 'Set up your CRA My Account',
                sub: 'For Layla · online',
                onTap: () => context.pushSafe('/journey'),
              ),
              const SizedBox(height: 16),

              // Progress banner
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E4E5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  "12 days in and 6 of 40 steps done. That's real progress.",
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 14,
                    height: 1.45,
                    color: Color(0xFF5C1518),
                  ),
                ),
              ),

              const Spacer(),

              // Bottom Actions
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: () => context.go('/home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF123332),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Back to my plan',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () => context.pop(),
                  child: const Text(
                    'Undo',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
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
      ),
    );
  }

  Widget _buildUnlockedCard({
    required String category,
    required String title,
    required String sub,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFE2ECEB),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: Color(0xFF123332),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF123332),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    sub,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 13,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 20, color: Color(0xFF123332)),
          ],
        ),
      ),
    );
  }
}
