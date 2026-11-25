import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../onboarding/onboarding_provider.dart';

class DebugMenuSheet extends ConsumerWidget {
  const DebugMenuSheet({super.key});

  static void show(BuildContext context) {
    if (!kDebugMode) return;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const DebugMenuSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboarding = ref.read(onboardingProvider.notifier);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '🛠️ Developer Presets',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF123332),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.person_add_outlined),
                title: const Text('New user'),
                subtitle: const Text('Empty profile, starts onboarding'),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/');
                },
              ),
              ListTile(
                leading: const Icon(Icons.star_outline),
                title: const Text('Demo Layla'),
                subtitle: const Text('5 family members, Mississauga, PR, Day 12'),
                onTap: () {
                  onboarding.setDestination(
                    province: 'Ontario',
                    city: 'Mississauga',
                    arrivalMonth: 'September 2026',
                    everyoneTogether: true,
                  );
                  onboarding.setStatus('Permanent Resident');
                  Navigator.pop(context);
                  context.go('/home');
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_city_outlined),
                title: const Text('Québec persona'),
                subtitle: const Text('Montréal destination, CSQ stage'),
                onTap: () {
                  onboarding.setDestination(
                    province: 'Québec',
                    city: 'Montréal',
                    arrivalMonth: 'October 2026',
                    everyoneTogether: true,
                  );
                  onboarding.setStatus('Permanent Resident');
                  Navigator.pop(context);
                  context.go('/home');
                },
              ),
              ListTile(
                leading: const Icon(Icons.language_outlined),
                title: const Text('Arabic locale'),
                subtitle: const Text('Arabic language selection'),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/language-access');
                },
              ),
              ListTile(
                leading: const Icon(Icons.wifi_off_outlined),
                title: const Text('Offline state'),
                subtitle: const Text('9.2 Offline fallback screen'),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/offline');
                },
              ),
              ListTile(
                leading: const Icon(Icons.error_outline),
                title: const Text('Server error'),
                subtitle: const Text('9.4 Server error fallback screen'),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/server-error');
                },
              ),
              ListTile(
                leading: const Icon(Icons.check_circle_outline),
                title: const Text('Settled user'),
                subtitle: const Text('All early tasks complete, settled home'),
                onTap: () {
                  onboarding.setDestination(
                    province: 'Ontario',
                    city: 'Mississauga',
                    arrivalMonth: 'January 2025',
                    everyoneTogether: true,
                  );
                  Navigator.pop(context);
                  context.go('/home');
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.grid_view),
                title: const Text('Open 271-Screen Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/gallery');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
