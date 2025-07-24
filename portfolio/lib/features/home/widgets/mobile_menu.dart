import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileMenu extends StatelessWidget {
  final VoidCallback onClose;

  const MobileMenu({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(24.0),
              color: Theme.of(context).cardTheme.color,
              child: Row(
                children: [
                  Text(
                    '< Developer />',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(icon: const Icon(Icons.close), onPressed: onClose),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: Container(
                color: Theme.of(context).cardTheme.color,
                child: Column(
                  children: [
                    _MenuItem(
                      text: 'Home',
                      icon: Icons.home,
                      onTap: () {
                        onClose();
                        context.go('/');
                      },
                    ),
                    _MenuItem(
                      text: 'About',
                      icon: Icons.person,
                      onTap: () {
                        onClose();
                        context.go('/about');
                      },
                    ),
                    _MenuItem(
                      text: 'Projects',
                      icon: Icons.work,
                      onTap: () {
                        onClose();
                        context.go('/projects');
                      },
                    ),
                    _MenuItem(
                      text: 'Contact',
                      icon: Icons.contact_mail,
                      onTap: () {
                        onClose();
                        context.go('/contact');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuItem({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: Icon(icon), title: Text(text), onTap: onTap);
  }
}
