import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DismissScreen extends StatefulWidget {
  const DismissScreen({super.key});

  @override
  State<DismissScreen> createState() => _DismissScreenState();
}

class _DismissScreenState extends State<DismissScreen> {
  int _selectedReason = 0;

  final List<String> _reasons = [
    'We did this before arriving',
    "It doesn't apply to us",
    'Someone is already helping us with it',
    'Just hide it for now',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A4D55),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF4F4F5),
                borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
              ),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Handle
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC8C8CE),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Not for you?',
                        style: TextStyle(
                          fontFamily: 'Bricolage Grotesque',
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF123332),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 22, color: Color(0xFF123332)),
                        onPressed: () => context.pop(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                      ),
                    ],
                  ),
                  const Text(
                    'Tell us why, so the rest of your plan stays right.',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 14,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Reasons List
                  Column(
                    children: List.generate(_reasons.length, (idx) {
                      final isSelected = idx == _selectedReason;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedReason = idx;
                            });
                          },
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 52),
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFFEAF2F1) : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: isSelected ? const Color(0xFF123332) : const Color(0xFFDEDEE2),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Radio<int>(
                                  value: idx,
                                  groupValue: _selectedReason,
                                  activeColor: const Color(0xFF123332),
                                  onChanged: (val) {
                                    if (val != null) {
                                      setState(() {
                                        _selectedReason = val;
                                      });
                                    }
                                  },
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _reasons[idx],
                                    style: TextStyle(
                                      fontFamily: 'IBM Plex Sans',
                                      fontSize: 15,
                                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                      color: const Color(0xFF123332),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 6),

                  // Information note
                  const Text(
                    "If it doesn't apply, we may ask one question to fix your answers. Hidden tasks stay in Settings → My plan.",
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 13,
                      height: 1.45,
                      color: Color(0xFF5A5F6B),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Update my plan Button
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/home');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Plan updated! Task has been removed.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF123332),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Update my plan',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
