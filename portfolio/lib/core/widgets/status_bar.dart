import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class VSCodeStatusBar extends StatelessWidget {
  const VSCodeStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppTheme.statusBarHeight,
      color: AppTheme.statusBarBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            // Left side items
            _StatusItem(icon: Icons.source_outlined, text: 'main'),
            const SizedBox(width: 16),
            _StatusItem(icon: Icons.sync, text: '0↓ 0↑'),
            const SizedBox(width: 16),
            _StatusItem(icon: Icons.error_outline, text: '0'),
            const SizedBox(width: 16),
            _StatusItem(icon: Icons.warning_outlined, text: '0'),

            const Spacer(),

            // Right side items
            _StatusItem(text: 'Ln 1, Col 1'),
            const SizedBox(width: 16),
            _StatusItem(text: 'Spaces: 2'),
            const SizedBox(width: 16),
            _StatusItem(text: 'UTF-8'),
            const SizedBox(width: 16),
            _StatusItem(text: 'LF'),
            const SizedBox(width: 16),
            _StatusItem(text: 'Dart'),
            const SizedBox(width: 16),
            _StatusItem(icon: Icons.notifications_outlined),
          ],
        ),
      ),
    );
  }
}

class _StatusItem extends StatefulWidget {
  final IconData? icon;
  final String? text;

  const _StatusItem({this.icon, this.text});

  @override
  State<_StatusItem> createState() => _StatusItemState();
}

class _StatusItemState extends State<_StatusItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        height: AppTheme.statusBarHeight,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null)
              Icon(widget.icon, size: 14, color: Colors.white),
            if (widget.icon != null && widget.text != null)
              const SizedBox(width: 4),
            if (widget.text != null)
              Text(
                widget.text!,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
