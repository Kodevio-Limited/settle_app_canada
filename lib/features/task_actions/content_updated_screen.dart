import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContentUpdatedScreen extends StatelessWidget {
  const ContentUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Close button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF123332)),
                  onPressed: () => context.pop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                ),
              ),
              const SizedBox(height: 8),

              // Title block
              const Text(
                'UPDATE · VERIFIED [DATE]',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: Color(0xFFA82227),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "A step you're working on changed",
                style: TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                  height: 1.1,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Service Canada updated its page for Apply for your SIN. We checked the change and updated your task.",
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 15,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 16),

              // What changed card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'What changed',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4E0DD),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'Before',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8A2418),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            '[Previous wording from the official page]',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 14,
                              height: 1.45,
                              color: Color(0xFF5A5F6B),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3EFE8),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'Now',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F4A36),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            '[Updated wording from the official page]',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 14,
                              height: 1.45,
                              color: Color(0xFF123332),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // What this means for you
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2ECEB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'What this means for you',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'One item was added to your "What to bring" list. Your earlier ticks are kept.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: Color(0xFF123332),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Bottom Actions
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: () => context.push('/task-sin'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF123332),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Review the task',
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
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Notification settings (Phase 8)'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text(
                    'Change update alerts',
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
}
