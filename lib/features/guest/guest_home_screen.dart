import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';

class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF123332);
    const borderCard = Color(0xFFDEDEE2);
    const crisisRed = Color(0xFF8E1C21);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Brand and Sign In
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/settle_logo.png',
                    width: 110,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) => const Text(
                      'settle\nCANADA',
                      style: TextStyle(
                        fontFamily: 'Bricolage Grotesque',
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        height: 1.1,
                        color: primaryDark,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.push('/sign-in'),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: primaryDark,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Exploring Callout Card
              Container(
                decoration: BoxDecoration(
                  color: primaryDark,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "You're exploring",
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Read the general steps for Ontario. Create a free account to get a plan for your family, checklists and reminders.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: Color(0xFFCFE3E1),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () => context.push('/sign-up'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: primaryDark,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Create my plan',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Title
              const Text(
                'Settling in Ontario, step by step',
                style: TextStyle(
                  fontFamily: 'Bricolage Grotesque',
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  letterSpacing: -0.4,
                  color: primaryDark,
                ),
              ),
              const SizedBox(height: 12),

              // Stages list card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: borderCard),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    _buildStageItem(context, '1 · Status & arrival documents', '/stage-status', showBorder: true),
                    _buildStageItem(context, '2 · Paperwork', '/stage-paperwork', showBorder: true),
                    _buildStageItem(context, '3 · Housing', '/stage-housing', showBorder: true),
                    _buildStageItem(context, '4 · Schools & childcare', '/stage-schools', showBorder: true),
                    _buildStageItem(context, '5 · Car & driving', '/stage-car', showBorder: true),
                    _buildStageItem(context, '6 · Insurance', '/stage-insurance', showBorder: true),
                    _buildStageItem(context, '+ 4 more stages', '/journey', showBorder: false, isBold: true),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Crisis link
              InkWell(
                onTap: () => context.push('/crisis'),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: borderCard),
                  ),
                  child: const Text(
                    'Need help now? Crisis & support lines',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: crisisRed,
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

  Widget _buildStageItem(
    BuildContext context,
    String label,
    String route, {
    required bool showBorder,
    bool isBold = false,
  }) {
    return InkWell(
      onTap: () => context.pushSafe(route),
      child: Container(
        constraints: const BoxConstraints(minHeight: 46),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(bottom: BorderSide(color: Color(0xFFEAEAEC)))
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 15,
                fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
                color: const Color(0xFF123332),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: Color(0xFF7A7A83),
            ),
          ],
        ),
      ),
    );
  }
}
