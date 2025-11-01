import 'package:bd_app_v0/src/core/theme/color_palette.dart';
import 'package:bd_app_v0/src/features/auth/providers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  @override
  Widget build(BuildContext context) {
    // Listen to auth state changes
    ref.listen<AuthActionState>(authNotifierProvider, (previous, next) {
      if (next is AuthActionSuccess) {
        Navigator.of(context, rootNavigator: true).pop();
        ref.read(authNotifierProvider.notifier).reset();
      }
    });

    final authActionState = ref.watch(authNotifierProvider);
    final isLoading = authActionState is AuthActionLoading;
    final errorMessage = authActionState is AuthActionError
        ? authActionState.message
        : null;

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
                  // Handle
                  Container(
                    width: 36,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.24),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Title
                  Text(
                    widget.register ? 'Registrieren' : 'Login',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ColorPalette.text0,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Email
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(labelText: 'E-Mail'),
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Bitte E-Mail eingeben';
                      }
                      if (!val.contains('@')) {
                        return 'Ungültige E-Mail';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  // Password
                  TextFormField(
                    controller: _pwCtrl,
                    obscureText: _obscure1,
                    textInputAction: widget.register
                        ? TextInputAction.next
                        : TextInputAction.done,
                    onFieldSubmitted: (_) {
                      if (!widget.register && !isLoading) _submit();
                    },
                    decoration: InputDecoration(
                      labelText: 'Passwort',
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => _obscure1 = !_obscure1),
                        icon: Icon(
                          _obscure1 ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Bitte Passwort eingeben';
                      }
                      if (val.length < 6) {
                        return 'Mindestens 6 Zeichen';
                      }
                      return null;
                    },
                  ),

                  // Confirm Password (Register only)
                  if (widget.register) ...[
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _pw2Ctrl,
                      obscureText: _obscure2,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        if (!isLoading) _submit();
                      },
                      decoration: InputDecoration(
                        labelText: 'Passwort bestätigen',
                        suffixIcon: IconButton(
                          onPressed: () =>
                              setState(() => _obscure2 = !_obscure2),
                          icon: Icon(
                            _obscure2 ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (val) {
                        if (val != _pwCtrl.text) {
                          return 'Passwörter stimmen nicht überein';
                        }
                        return null;
                      },
                    ),
                  ],
                  const SizedBox(height: 20),

                  // Error Message
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        errorMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),

                  // Submit Button
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorPalette.petrol2,
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
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
                  ),
                  const SizedBox(height: 8),

                  // Close Button
                  TextButton(
                    onPressed: isLoading ? null : () => Navigator.pop(context),
                    child: Text(
                      'Schließen',
                      style: TextStyle(
                        color: ColorPalette.text1.withValues(alpha: 0.9),
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
