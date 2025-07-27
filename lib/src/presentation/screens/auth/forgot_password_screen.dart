import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/di/di.dart';
import '../../controllers/auth/auth_cubit.dart';
import '../../controllers/base/cubit_state.dart';
import '../../widgets/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const name = '/forgot-password';
  static const path = '/forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return context.l10n?.emailRequired ?? 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return context.l10n?.emailInvalid ?? 'Please enter a valid email';
    }
    return null;
  }

  void _resetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      locator<AuthCubit>().sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Semantics(
          button: true,
          label: 'Go back',
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: locator<AuthCubit>(),
        listener: (context, state) {
          if (state.passwordResetStatus.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.passwordResetStatus.errorMessage ??
                      context.l10n?.passwordResetEmailFailed ??
                      'Failed to send reset email',
                ),
                backgroundColor: theme.colorScheme.error,
              ),
            );
          } else if (state.passwordResetStatus.isSubmitted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  context.l10n?.passwordResetEmailSent ??
                      'Password reset email sent! Check your inbox.',
                ),
                backgroundColor: theme.colorScheme.primary,
              ),
            );
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              height:
                  size.height -
                  kToolbarHeight -
                  MediaQuery.of(context).padding.top,
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // Header Section
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        // Icon
                        Semantics(
                          label: 'Password reset icon',
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.lock_reset,
                              size: 40,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Title
                        Text(
                          context.l10n?.forgotPasswordTitle ??
                              'Forgot Password?',
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Subtitle
                        Text(
                          context.l10n?.forgotPasswordSubtitle ??
                              "Enter your email address and we'll send you a link to reset your password",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.7,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Form Section
                  Expanded(
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Email field
                            CustomTextField(
                              label: context.l10n?.emailLabel ?? 'Email',
                              hint:
                                  context.l10n?.emailHint ??
                                  'Enter your email address',
                              controller: _emailController,
                              validator: _validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (_) => _resetPassword(),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.email_outlined,
                                  size: 20,
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.6,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 32),

                            // Reset password button
                            BlocBuilder<AuthCubit, AuthState>(
                              bloc: locator<AuthCubit>(),
                              builder: (context, state) {
                                final isLoading =
                                    state.passwordResetStatus.isSubmitting;
                                return PrimaryButton(
                                  text:
                                      context.l10n?.sendResetLinkButton ??
                                      'Send Reset Link',
                                  onPressed: isLoading ? null : _resetPassword,
                                  isLoading: isLoading,
                                );
                              },
                            ),

                            const Spacer(),

                            // Back to sign in
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                context.l10n?.backToSignInButton ??
                                    'Back to Sign In',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
