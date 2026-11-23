import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeleteConfirmScreen extends StatefulWidget {
  const DeleteConfirmScreen({super.key});

  @override
  State<DeleteConfirmScreen> createState() => _DeleteConfirmScreenState();
}

class _DeleteConfirmScreenState extends State<DeleteConfirmScreen> {
  final Set<String> _selectedReasons = {};

  final List<String> _reasons = [
    "I've settled in",
    'Not useful',
    'Too many reminders',
    'Privacy',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF123332);
    const dangerColor = Color(0xFFA3261C);
    const borderCard = Color(0xFFDEDEE2);
    const noticeBg = Color(0xFFE2ECEB);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/deactivate');
                  }
                },
                icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: primaryDark),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 8),
              const Text(
                'Delete your account?',
                style: TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  letterSpacing: -0.6,
                  color: primaryDark,
                ),
              ),
              const SizedBox(height: 16),
              // Deletion summary card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderCard),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'This deletes',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: primaryDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBullet('Your account and sign-in'),
                    _buildBullet('Your household (5 people)'),
                    _buildBullet('Task progress, checklists and reminders'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Apple ID and legal notice
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: noticeBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: const Text(
                  'You signed in with Apple, so we\'ll also disconnect this app from your Apple ID. [Anything kept for legal reasons, and for how long — wording from privacy counsel.]',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 13,
                    height: 1.45,
                    color: primaryDark,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Why are you leaving?
              const Text(
                'Why are you leaving? (optional)',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: primaryDark,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _reasons.map((reason) {
                  final isSelected = _selectedReasons.contains(reason);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedReasons.remove(reason);
                        } else {
                          _selectedReasons.add(reason);
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFE2ECEB) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? primaryDark : const Color(0xFFC8C8CE),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                            size: 18,
                            color: isSelected ? primaryDark : const Color(0xFF5A5F6B),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            reason,
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              color: primaryDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => context.push('/deleted'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: dangerColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Delete permanently',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/settings');
                    }
                  },
                  child: const Text(
                    'Keep my account',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: primaryDark,
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

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 15, color: Color(0xFF3B4747))),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 15,
                height: 1.5,
                color: Color(0xFF3B4747),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
