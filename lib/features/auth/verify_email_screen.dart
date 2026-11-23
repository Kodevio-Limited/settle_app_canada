import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import 'auth_provider.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  ConsumerState<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  final List<TextEditingController> _codeControllers =
      List.generate(6, (i) => TextEditingController(text: i == 0 ? '4' : i == 1 ? '8' : i == 2 ? '2' : ''));
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _codeControllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = ref.watch(authProvider).email ?? 'l•••••@example.com';

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
                'Check your email',
                style: TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  letterSpacing: -0.6,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 16,
                    height: 1.45,
                    color: Color(0xFF3B4747),
                  ),
                  children: [
                    const TextSpan(text: 'We sent a 6-digit code to '),
                    TextSpan(
                      text: email,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    const TextSpan(text: '. It expires in 10 minutes.'),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              // Fieldset: Verification code
              const Text(
                'Verification code',
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              // 6-digit code boxes grid with exact height 58, 8px gap
              Row(
                children: List.generate(6, (index) {
                  final hasText = _codeControllers[index].text.isNotEmpty;
                  final isFocused = _focusNodes[index].hasFocus;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: index < 5 ? 8.0 : 0.0),
                      child: Container(
                        height: 58,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: (isFocused || hasText) ? AppColors.primary : const Color(0xFFC8C8CE),
                            width: (isFocused || hasText) ? 2.0 : 1.0,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: _codeControllers[index],
                          focusNode: _focusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          maxLength: 1,
                          style: const TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                            height: 1.0,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            counterText: '',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onChanged: (val) {
                            setState(() {});
                            if (val.isNotEmpty && index < 5) {
                              _focusNodes[index + 1].requestFocus();
                            } else if (val.isEmpty && index > 0) {
                              _focusNodes[index - 1].requestFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              const Text(
                "Didn't get it? You can resend in 0:42.",
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 14,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 36),
              SettleButton(
                label: 'Verify',
                onPressed: () {
                  ref.read(authProvider.notifier).verifyAndSignIn();
                  context.push('/consent');
                },
              ),
              const SizedBox(height: 14),
              Center(
                child: TextButton(
                  onPressed: () => context.pop(),
                  child: const Text(
                    'Use a different email',
                    style: TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
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
