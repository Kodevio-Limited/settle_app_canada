import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportOutdatedScreen extends StatefulWidget {
  final String taskTitle;

  const ReportOutdatedScreen({
    super.key,
    this.taskTitle = 'Apply for your SIN',
  });

  @override
  State<ReportOutdatedScreen> createState() => _ReportOutdatedScreenState();
}

class _ReportOutdatedScreenState extends State<ReportOutdatedScreen> {
  int _selectedReason = 1;
  final TextEditingController _noteController = TextEditingController();

  final List<String> _reasons = [
    'A link is broken',
    'Steps or documents have changed',
    "An office's hours or address is wrong",
    'Something else',
  ];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Report outdated info',
                      style: TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF123332),
                      ),
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
              const SizedBox(height: 6),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'About: '),
                    TextSpan(
                      text: widget.taskTitle,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: const TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 16),

              // What looks wrong fieldset
              const Text(
                'What looks wrong?',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF123332),
                ),
              ),
              const SizedBox(height: 8),
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
                        constraints: const BoxConstraints(minHeight: 50),
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
              const SizedBox(height: 12),

              // Textarea
              Row(
                children: const [
                  Text(
                    'Tell us more ',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF123332),
                    ),
                  ),
                  Text(
                    '(optional)',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 14,
                      color: Color(0xFF5A5F6B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFC8C8CE)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: TextField(
                  controller: _noteController,
                  maxLines: 4,
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 15,
                    color: Color(0xFF123332),
                  ),
                  decoration: const InputDecoration(
                    hintText: "What did you see? Please don't include personal details.",
                    hintStyle: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      color: Color(0xFF5A5F6B),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Information text
              const Text(
                'Our content team checks the official source before changing anything. We\'ll mark the task "under review" meanwhile.',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 13,
                  height: 1.45,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 24),

              // Send report button
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Thank you! Report received and under review."),
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
                    'Send report',
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
      ),
    );
  }
}
