import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.go('/'),
      ),
      actions: [
        TextButton(onPressed: () => context.go('/'), child: const Text('Home')),
        TextButton(
          onPressed: () => context.go('/about'),
          child: const Text('About'),
        ),
        TextButton(
          onPressed: () => context.go('/projects'),
          child: const Text('Projects'),
        ),
        TextButton(
          onPressed: () => context.go('/contact'),
          child: const Text('Contact'),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
