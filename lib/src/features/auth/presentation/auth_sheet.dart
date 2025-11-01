import 'package:bd_app_v0/src/core/routing/route_names.dart';
import 'package:bd_app_v0/src/core/theme/color_palette.dart';
import 'package:bd_app_v0/src/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthSheet extends ConsumerStatefulWidget {
  final bool register;
  const AuthSheet({super.key, required this.register});

  @override
  ConsumerState<AuthSheet> createState() => _AuthSheetState();
}

class _AuthSheetState extends ConsumerState<AuthSheet> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _pwCtrl = TextEditingController();
  final _pw2Ctrl = TextEditingController();

  bool _obscure1 = true;
  bool _obscure2 = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _pwCtrl.dispose();
    _pw2Ctrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailCtrl.text.trim();
    final password = _pwCtrl.text;

    if (widget.register) {
      await ref.read(authNotifierProvider.notifier).register(email, password);
    } else {
      await ref.read(authNotifierProvider.notifier).signIn(email, password);
    }
  }

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _closeSheet() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void _navigateToHome() {
    GoRouter.of(context).goNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    // Listen to auth state changes
    ref.listen(authNotifierProvider, (previous, next) {
      if (next is AuthStateAuthenticated && mounted) {
        _dismissKeyboard();
        _closeSheet();
        _navigateToHome();
      }
    });

    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState is AuthStateLoading;
    final errorMessage = authState is AuthStateError ? authState.message : null;

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.petrol0.withValues(alpha: 0.98),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHandle(),
                  const SizedBox(height: 12),
                  _buildTitle(),
                  const SizedBox(height: 16),
                  _buildEmailField(),
                  const SizedBox(height: 12),
                  _buildPasswordField(isLoading),
                  if (widget.register) ...[
                    const SizedBox(height: 12),
                    _buildConfirmPasswordField(isLoading),
                  ],
                  const SizedBox(height: 20),
                  if (errorMessage != null) _buildErrorMessage(errorMessage),
                  _buildSubmitButton(isLoading),
                  const SizedBox(height: 8),
                  _buildCloseButton(isLoading),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        width: 36,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.24),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.register ? 'Registrieren' : 'Login',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: ColorPalette.text0,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      decoration: const InputDecoration(labelText: 'E-Mail'),
      validator: _validateEmail,
    );
  }

  Widget _buildPasswordField(bool isLoading) {
    return TextFormField(
      controller: _pwCtrl,
      obscureText: _obscure1,
      textInputAction: widget.register
          ? TextInputAction.next
          : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (!widget.register && !isLoading) _submit();
      },
      autofillHints: const [AutofillHints.password],
      decoration: InputDecoration(
        labelText: 'Passwort',
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscure1 = !_obscure1),
          icon: Icon(_obscure1 ? Icons.visibility : Icons.visibility_off),
          tooltip: _obscure1 ? 'Passwort zeigen' : 'Passwort verbergen',
        ),
      ),
      validator: _validatePassword,
    );
  }

  Widget _buildConfirmPasswordField(bool isLoading) {
    return TextFormField(
      controller: _pw2Ctrl,
      obscureText: _obscure2,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) {
        if (!isLoading) _submit();
      },
      autofillHints: const [AutofillHints.newPassword],
      decoration: InputDecoration(
        labelText: 'Passwort bestätigen',
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscure2 = !_obscure2),
          icon: Icon(_obscure2 ? Icons.visibility : Icons.visibility_off),
          tooltip: _obscure2 ? 'Passwort zeigen' : 'Passwort verbergen',
        ),
      ),
      validator: _validateConfirmPassword,
    );
  }

  Widget _buildErrorMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
    );
  }

  Widget _buildSubmitButton(bool isLoading) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: ColorPalette.petrol2,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: isLoading ? null : _submit,
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(
              widget.register ? 'Registrieren' : 'Login',
              style: const TextStyle(color: ColorPalette.text0),
            ),
    );
  }

  Widget _buildCloseButton(bool isLoading) {
    return TextButton(
      onPressed: isLoading ? null : _closeSheet,
      child: Text(
        'Schließen',
        style: TextStyle(color: ColorPalette.text1.withValues(alpha: 0.9)),
      ),
    );
  }

  // Validators
  String? _validateEmail(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Bitte E-Mail eingeben';
    }
    final v = val.trim();
    if (!v.contains('@') || !v.contains('.')) {
      return 'Bitte gültige E-Mail eingeben';
    }
    return null;
  }

  String? _validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'Bitte Passwort eingeben';
    }
    if (val.length < 6) {
      return 'Mindestens 6 Zeichen';
    }
    return null;
  }

  String? _validateConfirmPassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'Bitte erneut eingeben';
    }
    if (val != _pwCtrl.text) {
      return 'Passwörter stimmen nicht überein';
    }
    return null;
  }
}
