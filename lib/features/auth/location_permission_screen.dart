import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'auth_provider.dart';

class LocationPermissionScreen extends ConsumerStatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  ConsumerState<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState
    extends ConsumerState<LocationPermissionScreen> {
  final _postalController = TextEditingController();
  String? _postalError;

  @override
  void initState() {
    super.initState();
    _postalController.addListener(() {
      if (_postalError != null) {
        setState(() => _postalError = null);
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _postalController.dispose();
    super.dispose();
  }

  bool get _isPostalValid {
    final code = _postalController.text.trim().toUpperCase();
    return RegExp(r'^[A-Z]\d[A-Z]$').hasMatch(code);
  }

  void _handleUsePostal() {
    final postal = _postalController.text.trim().toUpperCase();
    if (!_isPostalValid) {
      setState(() {
        _postalError = 'Enter 3 characters, e.g. L5B';
      });
      return;
    }
    ref.read(authProvider.notifier).setLocation(false, postal);
    context.go('/stage');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white600,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: FigmaCircleBackButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/notif-permission');
                      }
                    },
                  ),
                ),
                const SizedBox(height: 8),
                // Large Figma red map pin illustration
                SvgPicture.asset(
                  'assets/images/location_pin.svg',
                  height: 204,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 18),
                const Text(
                  'Find services near you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTypography.fontHeading,
                    fontWeight: FontWeight.w500,
                    fontSize: 31,
                    height: 1.25,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Each task shows the closest Service Canada, ServiceOntario, DriveTest, school board and settlement offices.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.45,
                      color: AppColors.dark300,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.white500,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bulletItem('Approximate location only'),
                      const SizedBox(height: 8),
                      _bulletItem('Only while the app is open'),
                      const SizedBox(height: 8),
                      _bulletItem('Never stored or shared'),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                SettleButton(
                  label: 'Use approximate location',
                  onPressed: () {
                    ref.read(authProvider.notifier).setLocation(true);
                    context.go('/stage');
                  },
                ),
                const SizedBox(height: 14),
                // Postal area fallback card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white500,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Or enter your postal area',
                        style: TextStyle(
                          fontFamily: AppTypography.fontHeading,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainFont,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _postalController,
                              textCapitalization: TextCapitalization.characters,
                              maxLength: 3,
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 16,
                                color: AppColors.mainFont,
                              ),
                              decoration: figmaPillInputDecoration(
                                hintText: 'First 3 characters, e.g. L5B',
                                errorText: _postalError,
                                counterText: '',
                                radius: 35,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: _handleUsePostal,
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.dark50,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: AppColors.primary),
                              ),
                              child: const Text(
                                'Use this',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bulletItem(String text) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.check, color: Colors.white, size: 13),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: AppTypography.fontBody,
              fontSize: 14.5,
              height: 1.4,
              color: AppColors.mainFont,
            ),
          ),
        ),
      ],
    );
  }
}
