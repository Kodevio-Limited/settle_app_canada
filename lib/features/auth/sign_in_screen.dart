import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'auth_provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      if (_errorMessage != null) {
        setState(() => _errorMessage = null);
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool get _isEmailValid {
    final email = _emailController.text.trim();
    return RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);
  }

  void _handleSendCode() {
    final email = _emailController.text.trim();
    if (!_isEmailValid) {
      setState(() {
        _errorMessage = 'Please enter a valid email address';
      });
      return;
    }

    setState(() => _isLoading = true);
    ref.read(authProvider.notifier).setEmail(email);

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() => _isLoading = false);
        context.push('/verify-email');
      }
    });
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
                FigmaAuthHeader(
                  onBack: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/main');
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTypography.fontHeading,
                    fontWeight: FontWeight.w500,
                    fontSize: 33,
                    height: 1.3,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    'Sign in the same way you did before. Your plan and checklists are waiting.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTypography.fontHeading,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      height: 1.4,
                      color: Color(0xFF888888),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const FigmaInputLabel('Email'),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.email],
                  onSubmitted: (_) => _handleSendCode(),
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 16,
                    color: AppColors.mainFont,
                  ),
                  decoration: figmaPillInputDecoration(
                    hintText: 'you@example.com',
                    errorText: _errorMessage,
                    radius: 61,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 16, right: 8),
                      child: Icon(
                        Icons.mail_outline_rounded,
                        size: 22,
                        color: AppColors.dark200,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'No password to remember — we email you a one-time code each time.',
                  style: TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 13,
                    color: AppColors.dark300,
                  ),
                ),
                const SizedBox(height: 24),
                SettleButton(
                  label: 'Send me a code',
                  isLoading: _isLoading,
                  onPressed:
                      _emailController.text.trim().isEmpty ? null : _handleSendCode,
                ),
                const SizedBox(height: 28),
                // Divider matching Figma "Or continue with" / email option
                const Row(
                  children: [
                    Expanded(child: Divider(color: Color(0xFFD6D6DB), height: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'or with your email',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13,
                          color: AppColors.dark300,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Color(0xFFD6D6DB), height: 1)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: FigmaSocialPillButton(
                        label: 'Sign in with Google',
                        svgAssetPath: 'assets/icons/google_logo.svg',
                        onTap: _isLoading
                            ? null
                            : () {
                                setState(() => _isLoading = true);
                                ref.read(authProvider.notifier).verifyAndSignIn();
                                context.go('/home');
                              },
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: FigmaSocialPillButton(
                        label: 'Sign in with Apple',
                        svgAssetPath: 'assets/icons/apple_logo.svg',
                        onTap: _isLoading
                            ? null
                            : () {
                                setState(() => _isLoading = true);
                                ref.read(authProvider.notifier).verifyAndSignIn();
                                context.go('/home');
                              },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Center(
                  child: TextButton(
                    onPressed: () => context.push('/how-guidance'),
                    child: const Text(
                      "Can't get into your email? Contact support",
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () => context.push('/sign-up'),
                    child: const Text(
                      'New here? Create an account',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
