import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'auth_provider.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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

  bool _isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  Future<void> _handleSendCode() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter your email address.';
      });
      return;
    }
    if (!_isValidEmail(email)) {
      setState(() {
        _errorMessage = 'Please enter a valid email address.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;

    ref.read(authProvider.notifier).setEmail(email);
    setState(() {
      _isLoading = false;
    });
    context.push('/verify-email');
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FigmaAuthHeader(
                    onBack: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/');
                      }
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Create your account',
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
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Save your household plan and get reminders. You can also look around first without an account.',
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
                  const SizedBox(height: 28),
                  const FigmaInputLabel('Email'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.email],
                    onFieldSubmitted: (_) => _handleSendCode(),
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
                  const SizedBox(height: 18),
                  SettleButton(
                    label: _isLoading ? 'Sending...' : 'Send me a code',
                    onPressed: _isLoading ? null : _handleSendCode,
                  ),
                  const SizedBox(height: 24),
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
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: FigmaSocialPillButton(
                          label: 'Continue with Google',
                          svgAssetPath: 'assets/icons/google_logo.svg',
                          onTap: _isLoading
                              ? null
                              : () {
                                  ref
                                      .read(authProvider.notifier)
                                      .setEmail('google.user@example.com');
                                  context.push('/consent');
                                },
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: FigmaSocialPillButton(
                          label: 'Continue with Apple',
                          svgAssetPath: 'assets/icons/apple_logo.svg',
                          onTap: _isLoading
                              ? null
                              : () {
                                  ref
                                      .read(authProvider.notifier)
                                      .setEmail('apple.user@example.com');
                                  context.push('/consent');
                                },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  // Privacy Guarantee Card
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.softTeal,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.shield_outlined, color: AppColors.primary, size: 22),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'We will never ask you to upload documents or type in passport, UCI, SIN or application numbers.',
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              height: 1.45,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Footer Terms & Privacy Policy links
                  Center(
                    child: Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontFamily: AppTypography.fontHeading,
                          fontSize: 13,
                          height: 1.45,
                          color: AppColors.mainFont,
                        ),
                        children: [
                          const TextSpan(text: 'By continuing you agree to the '),
                          TextSpan(
                            text: 'Terms',
                            style: const TextStyle(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.push('/consent'),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.push('/consent'),
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
