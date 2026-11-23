import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'auth_provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: AppColors.primary,
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  letterSpacing: -0.6,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in the same way you did before. Your plan and checklists are waiting.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 16,
                  height: 1.45,
                  color: Color(0xFF3B4747),
                ),
              ),
              const SizedBox(height: 18),
              // Social Auth Buttons matching SignIn.dc.html
              InkWell(
                onTap: () {
                  ref.read(authProvider.notifier).verifyAndSignIn();
                  context.go('/home');
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Continue with Apple',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  ref.read(authProvider.notifier).verifyAndSignIn();
                  context.go('/home');
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFC8C8CE)),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              // Divider with 'or with your email' verbatim
              const Row(
                children: [
                  Expanded(child: Divider(color: Color(0xFFD6D6DB), height: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'or with your email',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 14,
                        color: Color(0xFF5A5F6B),
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xFFD6D6DB), height: 1)),
                ],
              ),
              const SizedBox(height: 18),
              // Email input
              const Text(
                'Email',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 16,
                  color: AppColors.primary,
                ),
                decoration: InputDecoration(
                  hintText: 'you@example.com',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFC8C8CE)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFC8C8CE)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SettleButton(
                label: 'Send me a code',
                onPressed: () {
                  final email = _emailController.text.trim();
                  ref.read(authProvider.notifier).setEmail(
                        email.isEmpty ? 'layla@example.com' : email,
                      );
                  context.push('/verify-email');
                },
              ),
              const SizedBox(height: 14),
              const Text(
                'No password to remember — we email you a one-time code each time.',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 13,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 36),
              Center(
                child: TextButton(
                  onPressed: () => context.push('/how-guidance'),
                  child: const Text(
                    "Can't get into your email?",
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 15,
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
                      fontFamily: AppTypography.fontBody,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
