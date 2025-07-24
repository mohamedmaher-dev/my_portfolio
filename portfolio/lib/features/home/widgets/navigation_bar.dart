import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatelessWidget {
  final double scrollOffset;
  final VoidCallback onMenuToggle;

  const CustomNavigationBar({
    super.key,
    required this.scrollOffset,
    required this.onMenuToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isScrolled = scrollOffset > 50;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isScrolled
            ? Theme.of(context).cardTheme.color?.withValues(alpha: 0.95)
            : Colors.transparent,
        border: isScrolled
            ? Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              )
            : null,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            children: [
              // Logo
              Text(
                '< Developer />',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),

              const Spacer(),

              // Desktop Navigation
              if (MediaQuery.of(context).size.width > 768) ...[
                _NavButton(text: 'Home', onPressed: () => context.go('/')),
                const SizedBox(width: 24),
                _NavButton(
                  text: 'About',
                  onPressed: () => context.go('/about'),
                ),
                const SizedBox(width: 24),
                _NavButton(
                  text: 'Projects',
                  onPressed: () => context.go('/projects'),
                ),
                const SizedBox(width: 24),
                _NavButton(
                  text: 'Contact',
                  onPressed: () => context.go('/contact'),
                ),
              ] else
                // Mobile Menu Button
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: onMenuToggle,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _NavButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      child: Text(text),
    );
  }
}
