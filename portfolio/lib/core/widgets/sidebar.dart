import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class VSCodeSidebar extends StatelessWidget {
  final String selectedActivity;
  final String currentRoute;

  const VSCodeSidebar({
    super.key,
    required this.selectedActivity,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppTheme.sidebarWidth,
      color: AppTheme.secondaryBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar header
          _SidebarHeader(activity: selectedActivity),

          // Sidebar content
          Expanded(child: _buildSidebarContent(context)),
        ],
      ),
    );
  }

  Widget _buildSidebarContent(BuildContext context) {
    switch (selectedActivity) {
      case 'explorer':
        return _ExplorerPanel(currentRoute: currentRoute);
      case 'search':
        return _SearchPanel();
      case 'git':
        return _GitPanel();
      case 'debug':
        return _DebugPanel();
      case 'extensions':
        return _ExtensionsPanel();
      case 'settings':
        return _SettingsPanel();
      default:
        return _ExplorerPanel(currentRoute: currentRoute);
    }
  }
}

class _SidebarHeader extends StatelessWidget {
  final String activity;

  const _SidebarHeader({required this.activity});

  String _getTitle(String activity) {
    switch (activity) {
      case 'explorer':
        return 'EXPLORER';
      case 'search':
        return 'SEARCH';
      case 'git':
        return 'SOURCE CONTROL';
      case 'debug':
        return 'RUN AND DEBUG';
      case 'extensions':
        return 'EXTENSIONS';
      case 'settings':
        return 'SETTINGS';
      default:
        return 'EXPLORER';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        _getTitle(activity),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _ExplorerPanel extends StatelessWidget {
  final String currentRoute;

  const _ExplorerPanel({required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FolderHeader(title: 'PORTFOLIO', isExpanded: true),

          const SizedBox(height: 4),

          // Folder structure
          _FileItem(
            icon: Icons.folder_outlined,
            name: 'src',
            isFolder: true,
            isExpanded: true,
            level: 1,
          ),

          _FileItem(
            icon: Icons.home_outlined,
            name: 'home.dart',
            isActive: currentRoute == '/',
            onTap: () => context.go('/'),
            level: 2,
          ),

          _FileItem(
            icon: Icons.person_outline,
            name: 'about.dart',
            isActive: currentRoute == '/about',
            onTap: () => context.go('/about'),
            level: 2,
          ),

          _FileItem(
            icon: Icons.work_outline,
            name: 'projects.dart',
            isActive: currentRoute == '/projects',
            onTap: () => context.go('/projects'),
            level: 2,
          ),

          _FileItem(
            icon: Icons.contact_mail_outlined,
            name: 'contact.dart',
            isActive: currentRoute == '/contact',
            onTap: () => context.go('/contact'),
            level: 2,
          ),

          const SizedBox(height: 8),

          _FileItem(
            icon: Icons.folder_outlined,
            name: 'assets',
            isFolder: true,
            level: 1,
          ),

          _FileItem(
            icon: Icons.settings_outlined,
            name: 'pubspec.yaml',
            level: 1,
          ),

          _FileItem(
            icon: Icons.description_outlined,
            name: 'README.md',
            level: 1,
          ),
        ],
      ),
    );
  }
}

class _FolderHeader extends StatelessWidget {
  final String title;
  final bool isExpanded;

  const _FolderHeader({required this.title, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          Icon(
            isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
            size: 16,
            color: AppTheme.secondaryText,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _FileItem extends StatefulWidget {
  final IconData icon;
  final String name;
  final bool isFolder;
  final bool isExpanded;
  final bool isActive;
  final VoidCallback? onTap;
  final int level;

  const _FileItem({
    required this.icon,
    required this.name,
    this.isFolder = false,
    this.isExpanded = false,
    this.isActive = false,
    this.onTap,
    this.level = 0,
  });

  @override
  State<_FileItem> createState() => _FileItemState();
}

class _FileItemState extends State<_FileItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 22,
          padding: EdgeInsets.only(left: 12 + (widget.level * 16.0)),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppTheme.accentColor.withValues(alpha: 0.3)
                : _isHovered
                ? AppTheme.sidebarItemHover
                : Colors.transparent,
          ),
          child: Row(
            children: [
              if (widget.isFolder)
                Icon(
                  widget.isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  size: 16,
                  color: AppTheme.secondaryText,
                ),
              if (widget.isFolder) const SizedBox(width: 2),
              Icon(
                widget.icon,
                size: 16,
                color: widget.isActive
                    ? AppTheme.accentColor
                    : AppTheme.primaryText,
              ),
              const SizedBox(width: 6),
              Text(
                widget.name,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: widget.isActive
                      ? AppTheme.accentColor
                      : AppTheme.primaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder panels for other activities
class _SearchPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Search functionality coming soon...'));
  }
}

class _GitPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Source control integration coming soon...'),
    );
  }
}

class _DebugPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Debug configuration coming soon...'));
  }
}

class _ExtensionsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Extensions marketplace coming soon...'));
  }
}

class _SettingsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings panel coming soon...'));
  }
}
