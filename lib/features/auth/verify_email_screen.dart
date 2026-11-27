import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'auth_provider.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  ConsumerState<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  static const bool _isDemo = bool.fromEnvironment('DEMO', defaultValue: false);

  late final List<TextEditingController> _codeControllers;
  late final List<FocusNode> _focusNodes;
  int _secondsRemaining = 42;
  Timer? _resendTimer;
  bool _isLoading = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _codeControllers = List.generate(6, (i) {
      if (_isDemo) {
        return TextEditingController(text: i == 0 ? '4' : i == 1 ? '8' : i == 2 ? '2' : '');
      }
      return TextEditingController();
    });
    _focusNodes = List.generate(6, (i) {
      final node = FocusNode();
      node.addListener(() {
        if (mounted) setState(() {});
      });
      return node;
    });
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 42;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    for (final c in _codeControllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  bool get _isComplete => _codeControllers.every((c) => c.text.isNotEmpty);

  void _handlePaste(String text) {
    final digits = text.replaceAll(RegExp(r'\D'), '');
    if (digits.length >= 6) {
      for (int i = 0; i < 6; i++) {
        _codeControllers[i].text = digits[i];
      }
      _focusNodes[5].requestFocus();
      setState(() {
        _errorText = null;
      });
    }
  }

  Future<void> _handleVerify() async {
    if (!_isComplete) {
      setState(() {
        _errorText = 'Please enter the 6-digit code.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;

    ref.read(authProvider.notifier).verifyAndSignIn();
    setState(() {
      _isLoading = false;
    });
    context.push('/consent');
  }

  @override
  Widget build(BuildContext context) {
    final email = ref.watch(authProvider).email ?? 'l•••••@example.com';

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
                      context.go('/sign-up');
                    }
                  },
                ),
                const SizedBox(height: 28),
                const Text(
                  'Check your email',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: AppTypography.fontHeading,
                        fontSize: 15,
                        height: 1.45,
                        color: Color(0xFF888888),
                      ),
                      children: [
                        const TextSpan(text: 'We sent a 6-digit code to '),
                        TextSpan(
                          text: email,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const TextSpan(text: '. It expires in 10 minutes.'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                const FigmaInputLabel('Verification code'),
                const SizedBox(height: 10),
                // 6-digit OTP boxes matching Figma Verify OTP Screen
                Row(
                  children: List.generate(6, (index) {
                    final hasText = _codeControllers[index].text.isNotEmpty;
                    final isFocused = _focusNodes[index].hasFocus;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: index < 5 ? 8.0 : 0.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.dark50,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _errorText != null
                                  ? AppColors.error
                                  : (isFocused || hasText)
                                      ? AppColors.primary
                                      : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: KeyboardListener(
                            focusNode: FocusNode(skipTraversal: true),
                            onKeyEvent: (event) {
                              if (event is KeyDownEvent &&
                                  event.logicalKey == LogicalKeyboardKey.backspace &&
                                  _codeControllers[index].text.isEmpty &&
                                  index > 0) {
                                _focusNodes[index - 1].requestFocus();
                              }
                            },
                            child: TextField(
                              controller: _codeControllers[index],
                              focusNode: _focusNodes[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              maxLength: 1,
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: hasText ? AppColors.primary : const Color(0xFF888888),
                                height: 1.0,
                              ),
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: '0',
                                hintStyle: TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF888888),
                                ),
                                contentPadding: EdgeInsets.zero,
                                counterText: '',
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (val) {
                                if (val.length > 1) {
                                  _handlePaste(val);
                                  return;
                                }
                                setState(() {
                                  _errorText = null;
                                });
                                if (val.isNotEmpty && index < 5) {
                                  _focusNodes[index + 1].requestFocus();
                                } else if (val.isEmpty && index > 0) {
                                  _focusNodes[index - 1].requestFocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                if (_errorText != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    _errorText!,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 13,
                      color: AppColors.error,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                const SizedBox(height: 14),
                Align(
                  alignment: Alignment.centerRight,
                  child: _secondsRemaining > 0
                      ? Text(
                          "Didn't get it? You can resend in 0:${_secondsRemaining.toString().padLeft(2, '0')}.",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 12.5,
                            color: AppColors.dark300,
                          ),
                        )
                      : InkWell(
                          onTap: _startTimer,
                          child: const Text(
                            "Didn't get it? Resend code.",
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 40),
                SettleButton(
                  label: _isLoading ? 'Verifying...' : 'Verify',
                  onPressed: _isLoading ? null : _handleVerify,
                ),
                const SizedBox(height: 14),
                Center(
                  child: TextButton(
                    onPressed: () => context.push('/sign-up'),
                    child: const Text(
                      'Use a different email',
                      style: TextStyle(
                        fontFamily: AppTypography.fontHeading,
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
      ),
    );
  }
}
