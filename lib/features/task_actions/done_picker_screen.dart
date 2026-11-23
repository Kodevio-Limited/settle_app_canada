import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DonePickerScreen extends StatefulWidget {
  final String taskTitle;

  const DonePickerScreen({
    super.key,
    this.taskTitle = 'Apply for your SIN',
  });

  @override
  State<DonePickerScreen> createState() => _DonePickerScreenState();
}

class _DonePickerScreenState extends State<DonePickerScreen> {
  final Set<String> _selectedPeople = {'Layla'};
  String _selectedWhen = 'Today';
  final List<String> _whenOptions = [
    'Today',
    'Yesterday',
    'Before we arrived',
    'Pick a date…',
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

                  // Header with Close Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Who has done this?',
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
                  Text(
                    widget.taskTitle,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 14,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // People Fieldset
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFDEDEE2)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      children: [
                        _buildPersonRow('Layla', 'L', const Color(0xFF123332), true),
                        _buildPersonRow('Omar', 'O', const Color(0xFF2E6B4F), true),
                        _buildPersonRow('Yasmin', 'Y', const Color(0xFF4A6FA5), false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // When Dropdown
                  const Text(
                    'When',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF123332),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFC8C8CE)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedWhen,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF123332)),
                        items: _whenOptions.map((opt) {
                          return DropdownMenuItem<String>(
                            value: opt,
                            child: Text(
                              opt,
                              style: const TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 16,
                                color: Color(0xFF123332),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _selectedWhen = val;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Info box
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2ECEB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'This only updates your checklist. Nothing is sent to Service Canada or anyone else.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 13,
                        height: 1.45,
                        color: Color(0xFF123332),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Save Button
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () => context.push('/task-done'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF123332),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Save',
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

  Widget _buildPersonRow(String name, String initial, Color bg, bool hasBorder) {
    final isChecked = _selectedPeople.contains(name);
    return InkWell(
      onTap: () {
        setState(() {
          if (isChecked) {
            _selectedPeople.remove(name);
          } else {
            _selectedPeople.add(name);
          }
        });
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 56),
        decoration: BoxDecoration(
          border: hasBorder
              ? const Border(bottom: BorderSide(color: Color(0xFFEAEAEC)))
              : null,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: bg,
              child: Text(
                initial,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 16,
                  color: Color(0xFF123332),
                ),
              ),
            ),
            Checkbox(
              value: isChecked,
              activeColor: const Color(0xFF2E6B4F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (val) {
                setState(() {
                  if (val == true) {
                    _selectedPeople.add(name);
                  } else {
                    _selectedPeople.remove(name);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
