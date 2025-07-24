import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class VSCodeTabBar extends StatelessWidget {
  final String currentRoute;

  const VSCodeTabBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppTheme.tabHeight,
      color: AppTheme.tabBarBackground,
      child: Row(
        children: [
          _VSCodeTab(
            title: 'home.dart',
            route: '/',
            isActive: currentRoute == '/',
            icon: Icons.home_outlined,
          ),
          _VSCodeTab(
            title: 'about.dart',
            route: '/about',
            isActive: currentRoute == '/about',
            icon: Icons.person_outline,
          ),
          _VSCodeTab(
            title: 'projects.dart',
            route: '/projects',
            isActive: currentRoute == '/projects',
            icon: Icons.work_outline,
          ),
          _VSCodeTab(
            title: 'contact.dart',
            route: '/contact',
            isActive: currentRoute == '/contact',
            icon: Icons.contact_mail_outlined,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppTheme.borderColor, width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VSCodeTab extends StatefulWidget {
  final String title;
  final String route;
  final bool isActive;
  final IconData icon;

  const _VSCodeTab({
    required this.title,
    required this.route,
    required this.isActive,
    required this.icon,
  });

  @override
  State<_VSCodeTab> createState() => _VSCodeTabState();
}

class _VSCodeTabState extends State<_VSCodeTab> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: Container(
          height: AppTheme.tabHeight,
          constraints: const BoxConstraints(minWidth: 120, maxWidth: 200),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppTheme.activeTabColor
                : _isHovered
                ? AppTheme.inactiveTabColor.withValues(alpha: 0.8)
                : AppTheme.inactiveTabColor,
            border: const Border(
              right: BorderSide(color: AppTheme.borderColor, width: 1),
              bottom: BorderSide(color: AppTheme.borderColor, width: 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  size: 16,
                  color: widget.isActive
                      ? AppTheme.primaryText
                      : AppTheme.secondaryText,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: widget.isActive
                          ? AppTheme.primaryText
                          : AppTheme.secondaryText,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 6),
                if (widget.isActive)
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryText,
                      shape: BoxShape.circle,
                    ),
                  ),
                if (_isHovered && !widget.isActive)
                  GestureDetector(
                    onTap: () {
                      // Close tab functionality would go here
                    },
                    child: const Icon(
                      Icons.close,
                      size: 14,
                      color: AppTheme.secondaryText,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
