import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class VSCodeTitleBar extends StatelessWidget {
  final VoidCallback onToggleSidebar;
  final String currentRoute;

  const VSCodeTitleBar({
    super.key,
    required this.onToggleSidebar,
    required this.currentRoute,
  });

  String _getFileTitle(String route) {
    switch (route) {
      case '/':
        return 'home.dart';
      case '/about':
        return 'about.dart';
      case '/projects':
        return 'projects.dart';
      case '/contact':
        return 'contact.dart';
      default:
        return 'portfolio.dart';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppTheme.titleBarHeight,
      color: AppTheme.secondaryBackground,
      child: Row(
        children: [
          // Menu and title
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 8),
                Icon(Icons.menu, size: 16, color: AppTheme.secondaryText),
                const SizedBox(width: 12),
                Text(
                  _getFileTitle(currentRoute),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppTheme.primaryText),
                ),
                const SizedBox(width: 8),
                if (currentRoute != '/')
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryText,
                      shape: BoxShape.circle,
                    ),
                  ),
                const Spacer(),
                Text(
                  'Flutter Developer Portfolio',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.secondaryText,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),

          // Window controls (mockup)
          Row(
            children: [
              _WindowControl(
                icon: Icons.remove,
                onPressed: () {},
                color: AppTheme.secondaryText,
              ),
              _WindowControl(
                icon: Icons.crop_square,
                onPressed: () {},
                color: AppTheme.secondaryText,
              ),
              _WindowControl(
                icon: Icons.close,
                onPressed: () {},
                color: AppTheme.secondaryText,
                isClose: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WindowControl extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final bool isClose;

  const _WindowControl({
    required this.icon,
    required this.onPressed,
    required this.color,
    this.isClose = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      hoverColor: isClose
          ? Colors.red.withValues(alpha: 0.2)
          : Colors.white.withValues(alpha: 0.1),
      child: SizedBox(
        width: 46,
        height: AppTheme.titleBarHeight,
        child: Icon(icon, size: 12, color: color),
      ),
    );
  }
}
