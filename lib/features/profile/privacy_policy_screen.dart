import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF123332)),
                  onPressed: () => context.pop(),
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(minWidth: 44, minHeight: 44),
                ),
              ),
              const SizedBox(height: 8),

              // Title block
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'LEGAL & PRIVACY',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                      color: Color(0xFFA82227),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Terms and Privacy Policy',
                    style: TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.08,
                      color: Color(0xFF123332),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Plain language first, legal text below. Last updated October 2024.',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      height: 1.45,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 3 core principles card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Our 3 commitments to you',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '1. Your data is yours',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'We never sell your personal information. Vault documents and financial answers stay on your device unless you choose cloud backup.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '2. Partners never see your answers',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Sponsored partners only see that a link was tapped. They never receive your immigration status, timeline, or household details.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '3. Instant and complete deletion',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'When you delete your account, we erase all profile data immediately. No dark patterns, no 30-day retention.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Full legal text container
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Full Legal Terms & Policy',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Settle App is a non-governmental settlement assistant created to guide newcomers to Canada. Information provided in this app does not constitute legal, immigration, or financial advice. Immigration regulations and provincial policies are subject to change without notice; users should confirm requirements with official government portals (IRCC, Service Canada, provincial health authorities).\n\n'
                      'By using Settle App, you agree to the collection and use of information in accordance with this policy. We comply with Canadian PIPEDA and provincial privacy standards.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 13,
                        height: 1.5,
                        color: Color(0xFF5A5F6B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              OutlinedButton(
                onPressed: () => context.pop(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF123332),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFC8C8CE)),
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('Back'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
