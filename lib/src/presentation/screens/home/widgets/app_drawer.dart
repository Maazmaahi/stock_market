import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../providers/provider/auth_provider.dart';
import '../../../providers/provider/theme_provider.dart';
import '../../../providers/provider/user_provider.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).asData?.value;
    final themeMode = ref.watch(themeProvider);
    final colorScheme = context.colorScheme;

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user?.fullName ?? 'Guest'),
            accountEmail: Text(user?.email ?? 'Email: NA'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: colorScheme.inversePrimary,
              child: Text(user?.fullName?[0] ?? '?'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme Mode'),
            trailing: DropdownButton<ThemeMode>(
              value: themeMode,
              onChanged: (mode) =>
                  ref.read(themeProvider.notifier).toggleTheme(mode!),
              items: const [
                DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
                DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
                DropdownMenuItem(
                    value: ThemeMode.system, child: Text('System')),
              ],
            ),
          ),
          const Divider(),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              ref.read(authProvider.notifier).logout();
              Navigator.pop(context);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go(RoutesName.login);
              });
            },
          ),
          const Divider(),
          const Text('Version:- 1.0.0', style: p9),
        ],
      ),
    );
  }
}
