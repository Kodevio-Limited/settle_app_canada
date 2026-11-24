import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocationDeniedScreen extends StatefulWidget {
  const LocationDeniedScreen({super.key});

  @override
  State<LocationDeniedScreen> createState() => _LocationDeniedScreenState();
}

class _LocationDeniedScreenState extends State<LocationDeniedScreen> {
  final TextEditingController _fsaController = TextEditingController(text: 'L5B');

  @override
  void dispose() {
    _fsaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF123332);
    const borderCard = Color(0xFFDEDEE2);
    const textMuted = Color(0xFF3B4747);
    const textSubtle = Color(0xFF5A5F6B);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/tasks/sin');
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: primaryDark),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(width: 4),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Near you',
                        style: TextStyle(
                          fontFamily: 'Bricolage Grotesque',
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          letterSpacing: -0.5,
                          color: primaryDark,
                        ),
                      ),
                      Text(
                        'For: Apply for your SIN',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 13,
                          color: textSubtle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Location is off card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: borderCard),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEAEAEC),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.location_off_outlined,
                        size: 24,
                        color: textMuted,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Location is off for Settle',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: primaryDark,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'That\'s fine. Enter a postal area and we\'ll sort offices by distance from there. Nothing is stored.',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: textMuted,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: const Color(0xFFC8C8CE)),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            alignment: Alignment.centerLeft,
                            child: TextField(
                              controller: _fsaController,
                              maxLength: 3,
                              textCapitalization: TextCapitalization.characters,
                              style: const TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 16,
                                color: primaryDark,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: '',
                                isDense: true,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () => context.push('/nearby'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryDark,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                            ),
                            child: const Text(
                              'Show',
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Opening device settings...')),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Text(
                          'Or turn on approximate location in iPhone Settings',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: primaryDark,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Locations in Mississauga from plan
              const Text(
                'In Mississauga (from your plan)',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: primaryDark,
                ),
              ),
              const SizedBox(height: 8),
              _buildLocationTile(
                context,
                title: 'Service Canada Centre · Mississauga',
                status: 'Distance unknown · ',
                isOpen: true,
              ),
              const SizedBox(height: 8),
              _buildLocationTile(
                context,
                title: 'Service Canada Centre · Brampton',
                status: 'Distance unknown · ',
                isOpen: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationTile(
    BuildContext context, {
    required String title,
    required String status,
    required bool isOpen,
  }) {
    return InkWell(
      onTap: () => context.push('/location-detail'),
      borderRadius: BorderRadius.circular(14),
      child: Container(
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
                children: [
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
                  RichText(
                    text: TextSpan(
                      text: status,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 13,
                        color: Color(0xFF5A5F6B),
                      ),
                      children: const [
                        TextSpan(
                          text: 'Open now',
                          style: TextStyle(
                            color: Color(0xFF2E6B4F),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
