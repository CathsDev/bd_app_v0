import 'package:bd_app_v0/src/app/app_routes.dart';
import 'package:bd_app_v0/src/app/theme/app_colors.dart';
import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:bd_app_v0/src/features/auth/presentation/widgets/segment_button.dart';
import 'package:bd_app_v0/src/features/auth/state/auth_controller.dart';
import 'package:bd_app_v0/src/features/auth/state/auth_provider.dart';
import 'package:bd_app_v0/src/features/settings/presentation/widgets/name_edit_sheet.dart';
import 'package:bd_app_v0/src/features/settings/state/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountSettingsScreen extends ConsumerWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(currentUserProvider);
    final userAsync = ref.watch(userNotifierProvider);
    final String userEmail = (authUser?.email.trim().isNotEmpty ?? false)
        ? authUser!.email.trim()
        : (authUser?.id ?? 'Nicht angemeldet!');
    final scheme = Theme.of(context).colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight * 0.39;
    int selectedIndex = 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: headerHeight,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 8,
                          start: 12,
                        ),
                        child: Material(
                          color: scheme.secondary,
                          shape: const CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: Semantics(
                            button: true,
                            label: 'Zurück',
                            hint: 'Geht zur vorherigen Ansicht',
                            child: IconButton(
                              constraints: BoxConstraints.tightFor(
                                width: 44,
                                height: 44,
                              ),
                              icon: Icon(
                                Icons.arrow_back,
                                color: scheme.onSecondary,
                              ),
                              tooltip: 'Zurück',
                              onPressed: () {
                                final router = GoRouter.of(context);
                                router.canPop()
                                    ? router.pop()
                                    : context.goNamed(AppRoutes.home);
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 8,
                          end: 12,
                        ),
                        child: Material(
                          color: scheme.secondary,
                          shape: const CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: Semantics(
                            button: true,
                            label: 'Startseite',
                            hint:
                                'Öffnet die Startseite und löscht den Verlauf',
                            child: IconButton(
                              constraints: BoxConstraints.tightFor(
                                width: 44,
                                height: 44,
                              ),
                              icon: Icon(Icons.home, color: scheme.onSecondary),
                              tooltip: 'Home',
                              onPressed: () {
                                final router = GoRouter.of(context);
                                router.canPop()
                                    ? router.pop()
                                    : context.goNamed(AppRoutes.home);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: scheme.tertiary,
                        foregroundColor: scheme.onPrimary,
                        child: Icon(Icons.person, size: 80),
                      ),
                      SizedBox(height: 16),
                      userAsync.when(
                        data: (user) {
                          return Text(
                            user.name,
                            style: TextStyles.textTheme.headlineSmall,
                          );
                        },
                        error: (e, _) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: scheme.outline),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Namen eingeben',
                                  style: TextStyles.textTheme.bodyLarge,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (ctx) =>
                                        NameEditSheet(initialName: ''),
                                  );
                                },
                                icon: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      /* Text(
                        'Max Mustermann',
                        style: TextStyles.textTheme.headlineSmall,
                      ), */
                      SizedBox(height: 8),
                      Text(userEmail, style: TextStyles.textTheme.bodyLarge),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        SizedBox(height: 8),
                        userAsync.when(
                          data: (user) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: scheme.outline),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      user.name.isNotEmpty
                                          ? user.name
                                          : 'Namen eingeben',
                                      style: TextStyles.textTheme.bodyLarge,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (ctx) => NameEditSheet(
                                          initialName: user.name,
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                ],
                              ),
                            );
                          },
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (e, _) => Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: scheme.outline),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Namen eingeben',
                                    style: TextStyles.textTheme.bodyLarge,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (ctx) =>
                                          NameEditSheet(initialName: ''),
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Email'),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: scheme.outline),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  userEmail.isNotEmpty
                                      ? userEmail
                                      : 'Email eingeben',
                                  style: TextStyles.textTheme.bodyLarge,
                                ),
                              ),
                              IconButton(
                                onPressed: null,
                                /* onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (ctx) =>
                                        NameEditSheet(initialName: userEmail),
                                  );
                                }, */
                                icon: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    child: Container(
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
                              label: 'Ausloggen',
                              selected: selectedIndex == 0,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Ausloggen'),
                                    content: Text('Wirklich ausloggen?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: Text(
                                          'Abbrechen',
                                          style: TextStyle(
                                            color: AppColors
                                                .darkColorScheme
                                                .onSurface,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ref
                                              .read(
                                                authNotifierProvider.notifier,
                                              )
                                              .signOut();
                                        },
                                        child: Text(
                                          'Ok',
                                          style: TextStyle(
                                            color: AppColors
                                                .darkColorScheme
                                                .onSurface,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SegmentButton(
                              label: 'Konto löschen',
                              selected: selectedIndex == 1,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
