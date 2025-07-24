import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class VSCodeActivityBar extends StatelessWidget {
  final String selectedActivity;
  final Function(String) onActivitySelected;

  const VSCodeActivityBar({
    super.key,
    required this.selectedActivity,
    required this.onActivitySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppTheme.activityBarWidth,
      color: AppTheme.activityBarBackground,
      child: Column(
        children: [
          const SizedBox(height: 8),

          // Activity items
          _ActivityItem(
            icon: Icons.folder_outlined,
            isActive: selectedActivity == 'explorer',
            onPressed: () => onActivitySelected('explorer'),
            tooltip: 'Explorer',
          ),

          _ActivityItem(
            icon: Icons.search,
            isActive: selectedActivity == 'search',
            onPressed: () => onActivitySelected('search'),
            tooltip: 'Search',
          ),

          _ActivityItem(
            icon: Icons.source,
            isActive: selectedActivity == 'git',
            onPressed: () => onActivitySelected('git'),
            tooltip: 'Source Control',
          ),

          _ActivityItem(
            icon: Icons.bug_report_outlined,
            isActive: selectedActivity == 'debug',
            onPressed: () => onActivitySelected('debug'),
            tooltip: 'Run and Debug',
          ),

          _ActivityItem(
            icon: Icons.extension,
            isActive: selectedActivity == 'extensions',
            onPressed: () => onActivitySelected('extensions'),
            tooltip: 'Extensions',
          ),

          const Spacer(),

          // Settings
          _ActivityItem(
            icon: Icons.settings_outlined,
            isActive: selectedActivity == 'settings',
            onPressed: () => onActivitySelected('settings'),
            tooltip: 'Settings',
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatefulWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onPressed;
  final String tooltip;

  const _ActivityItem({
    required this.icon,
    required this.isActive,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  State<_ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<_ActivityItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      preferBelow: false,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            width: AppTheme.activityBarWidth,
            height: AppTheme.activityBarWidth,
            decoration: BoxDecoration(
              color: widget.isActive
                  ? AppTheme.primaryBackground
                  : _isHovered
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.transparent,
              border: widget.isActive
                  ? const Border(
                      left: BorderSide(color: AppTheme.accentColor, width: 2),
                    )
                  : null,
            ),
            child: Icon(
              widget.icon,
              size: 24,
              color: widget.isActive
                  ? AppTheme.primaryText
                  : AppTheme.secondaryText,
            ),
          ),
        ),
      ),
    );
  }
}
