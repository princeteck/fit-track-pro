import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/ui/assets_constants.dart';
import '../../../../../core/locale/generated/app_localizations.dart';
import '../../../../controllers/auth/auth_cubit.dart';
import '../../../../controllers/base/cubit_state.dart';
import '../../../../widgets/widgets.dart';
import '../../../dashboard/dashboard_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

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
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
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
    if (value.length < 6) {
      return l10n?.passwordMinLength ??
          'Password must be at least 6 characters';
    }
    return null;
  }

  void _signIn() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().signInWithEmailPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  void _signInWithGoogle() {
    context.read<AuthCubit>().signInWithGoogle();
  }

  void _signInWithApple() {
    final l10n = AppLocalizations.of(context);
    // Apple sign in not implemented in cubit yet
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n?.appleSignInSoon ?? 'Apple Sign In coming soon'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.signInStatus.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.signInStatus.errorMessage ??
                    (l10n?.loginFailed ?? 'Login failed'),
              ),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        } else if (state.signInStatus.isSubmitted && state.isAuthenticated) {
          // Navigate to dashboard on successful authentication
          context.goNamed(DashboardScreen.name);
        }
      },
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Email field
                CustomTextField(
                  label: l10n?.emailLabel ?? 'Email',
                  hint: l10n?.emailHint ?? 'Enter your email',
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
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Password field
                PasswordField(
                  label: l10n?.passwordLabel ?? 'Password',
                  hint: l10n?.passwordHint ?? 'Enter your password',
                  controller: _passwordController,
                  validator: _validatePassword,
                  focusNode: _passwordFocusNode,
                  onFieldSubmitted: (_) => _signIn(),
                ),

                // Forgot password link
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: Text(
                      l10n?.forgotPasswordLink ?? 'Forgot Password?',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Sign in button
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final isLoading = state.signInStatus.isSubmitting;
                    return PrimaryButton(
                      text: l10n?.signInButtonText ?? 'Sign In',
                      onPressed: isLoading ? null : _signIn,
                      isLoading: isLoading,
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

                // Social login buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(
                      iconPath: KIcons.google,
                      onPressed: _signInWithGoogle,
                    ),
                    SocialButton(
                      iconPath: KIcons.apple,
                      onPressed: _signInWithApple,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
