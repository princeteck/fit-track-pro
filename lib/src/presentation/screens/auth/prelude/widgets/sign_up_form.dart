import 'package:fittrack_pro/src/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../core/locale/generated/app_localizations.dart';
import '../../../../controllers/auth/auth_cubit.dart';
import '../../../../controllers/base/cubit_state.dart';
import '../../../../widgets/widgets.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

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
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
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
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final l10n = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return l10n?.emailRequired ?? 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return l10n?.emailInvalid ?? 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final l10n = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return l10n?.passwordRequired ?? 'Password is required';
    }
    if (value.length < 8) {
      return l10n?.passwordStrong ?? 'Password must be at least 8 characters';
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
      return l10n?.passwordComplexity ??
          'Password must contain uppercase, lowercase and number';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    final l10n = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return l10n?.confirmPasswordRequired ?? 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return l10n?.passwordsDoNotMatch ?? 'Passwords do not match';
    }
    return null;
  }

  void _signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().signUpWithEmailPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  void _signUpWithGoogle() {
    context.read<AuthCubit>().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return BlocListener<AuthCubit, AuthState>(
      bloc: context.read<AuthCubit>(),
      listener: (context, state) {
        if (state.signUpStatus.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.signUpStatus.errorMessage ??
                    (l10n?.signUpFailed ?? 'Sign up failed'),
              ),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        } else if (state.signUpStatus.isSubmitted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                l10n?.accountCreatedSuccess ?? 'Account created successfully!',
              ),
              backgroundColor: theme.colorScheme.primary,
            ),
          );
          context.goNamed(DashboardScreen.name);
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Email field
                  CustomTextField(
                    label: l10n?.emailLabel ?? 'Email',
                    hint: l10n?.enterYourEmail ?? 'Enter your email',
                    controller: _emailController,
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
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

                  const SizedBox(height: 16),

                  // Password field
                  PasswordField(
                    label: l10n?.passwordLabel ?? 'Password',
                    hint:
                        l10n?.createStrongPassword ??
                        'Create a strong password',
                    controller: _passwordController,
                    validator: _validatePassword,
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(
                        context,
                      ).requestFocus(_confirmPasswordFocusNode);
                    },
                  ),

                  const SizedBox(height: 16),

                  // Confirm Password field
                  PasswordField(
                    label: l10n?.confirmPasswordLabel ?? 'Confirm Password',
                    hint: l10n?.confirmPasswordHint ?? 'Confirm your password',
                    controller: _confirmPasswordController,
                    validator: _validateConfirmPassword,
                    focusNode: _confirmPasswordFocusNode,
                    onFieldSubmitted: (_) => _signUp(),
                  ),

                  const SizedBox(height: 24),

                  // Sign up button
                  BlocBuilder<AuthCubit, AuthState>(
                    bloc: context.read<AuthCubit>(),
                    builder: (context, state) {
                      return PrimaryButton(
                        text: l10n?.createAccountButton ?? 'Create Account',
                        onPressed:
                            (state.signUpStatus == CubitState.submitting())
                            ? null
                            : _signUp,
                        isLoading:
                            (state.signUpStatus == CubitState.submitting()),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // Divider with text
                  Row(
                    children: [
                      Expanded(child: Divider(color: theme.dividerColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          l10n?.orText ?? 'or',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: theme.dividerColor)),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Social login button
                  Center(
                    child: SocialButton(
                      iconPath: KIcons.google,
                      onPressed: _signUpWithGoogle,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Terms and conditions
                  Text(
                    l10n?.termsAndConditions ??
                        'By creating an account, you agree to our Terms of Service and Privacy Policy',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    textAlign: TextAlign.center,
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
