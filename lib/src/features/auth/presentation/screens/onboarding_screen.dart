import 'package:bd_app_v0/src/app/theme/color_palette.dart';
import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/auth/presentation/widgets/auth_sheet.dart';
import 'package:bd_app_v0/src/features/auth/presentation/widgets/segment_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _selectedIndex = 0; // 0 = Login, 1 = Register

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/onboarding/onboarding1.png',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black54,
                  ColorPalette.petrol0,
                ],
                stops: [0.35, 0.75, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/logo/bd_logo_text0.png',
                      width: 160,
                      height: 160,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'BrainDump',
                      textAlign: TextAlign.center,
                      style: TextStyles.appTitle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Für Menschen, die viel leisten - und trotzdem ihr Wohnzimmer suchen.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 32),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.35),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.08),
                        ),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Expanded(
                            child: SegmentButton(
                              label: 'Login',
                              selected: _selectedIndex == 0,
                              onTap: () {
                                setState(() => _selectedIndex = 0);
                                _showAuthSheet(context, register: false);
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SegmentButton(
                              label: 'Registrieren',
                              selected: _selectedIndex == 1,
                              onTap: () {
                                setState(() => _selectedIndex = 1);
                                _showAuthSheet(context, register: true);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAuthSheet(BuildContext context, {required bool register}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => AuthSheet(register: register),
    );
  }
}
