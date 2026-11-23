import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnoozeScreen extends StatefulWidget {
  const SnoozeScreen({super.key});

  @override
  State<SnoozeScreen> createState() => _SnoozeScreenState();
}

class _SnoozeScreenState extends State<SnoozeScreen> {
  int _selectedOption = 0;
  bool _addToCalendar = false;

  final List<Map<String, String>> _options = [
    {'title': 'Tomorrow morning', 'sub': '9:00 am'},
    {'title': 'This weekend', 'sub': 'Sat'},
    {'title': 'Next week', 'sub': 'Mon'},
    {'title': 'Pick a date and time', 'sub': ''},
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
                        'Remind me…',
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
                  const SizedBox(height: 14),

                  // Options List
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFDEDEE2)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      children: List.generate(_options.length, (idx) {
                        final opt = _options[idx];
                        final hasBorder = idx < _options.length - 1;

                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedOption = idx;
                            });
                          },
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 54),
                            decoration: BoxDecoration(
                              border: hasBorder
                                  ? const Border(bottom: BorderSide(color: Color(0xFFEAEAEC)))
                                  : null,
                            ),
                            child: Row(
                              children: [
                                Radio<int>(
                                  value: idx,
                                  groupValue: _selectedOption,
                                  activeColor: const Color(0xFF123332),
                                  onChanged: (val) {
                                    if (val != null) {
                                      setState(() {
                                        _selectedOption = val;
                                      });
                                    }
                                  },
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    opt['title']!,
                                    style: const TextStyle(
                                      fontFamily: 'IBM Plex Sans',
                                      fontSize: 16,
                                      color: Color(0xFF123332),
                                    ),
                                  ),
                                ),
                                if (opt['sub']!.isNotEmpty)
                                  Text(
                                    opt['sub']!,
                                    style: const TextStyle(
                                      fontFamily: 'IBM Plex Sans',
                                      fontSize: 14,
                                      color: Color(0xFF5A5F6B),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Calendar Switch Card
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFDEDEE2)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Also add to my iPhone Calendar',
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 15,
                                  color: Color(0xFF123332),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Saved on your phone, not by Settle',
                                style: TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 12,
                                  color: Color(0xFF5A5F6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: _addToCalendar,
                          activeColor: const Color(0xFF2E6B4F),
                          onChanged: (val) {
                            setState(() {
                              _addToCalendar = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Set reminder Button
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Reminder set! We'll notify you."),
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
                        'Set reminder',
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
