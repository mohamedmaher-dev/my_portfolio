import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/models/skill_model.dart';

class SkillsSection extends StatelessWidget {
  final List<SkillModel> skills;
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const SkillsSection({
    super.key,
    required this.skills,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  // Map of icon names to FontAwesome icons
  static final Map<String, IconData> _iconMap = {
    'flutter': FontAwesomeIcons.flutter,
    'dart': FontAwesomeIcons.dev,
    'kotlin': FontAwesomeIcons.java,
    'android': FontAwesomeIcons.android,
    'firebase': FontAwesomeIcons.fire,
    'api': FontAwesomeIcons.server,
    'database': FontAwesomeIcons.database,
    'git': FontAwesomeIcons.gitAlt,
    'provider': FontAwesomeIcons.cubes,
    'bloc': FontAwesomeIcons.layerGroup,
  };

  Color _parseColor(String colorString, BuildContext context) {
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Theme.of(context).colorScheme.primary;
    }
  }

  IconData _getIconData(String iconName) {
    return _iconMap[iconName] ?? FontAwesomeIcons.code;
  }

  // Calculate responsive grid parameters based on screen width
  Map<String, dynamic> _getGridParameters(double screenWidth) {
    if (screenWidth > 1800) {
      // Ultra-wide screens
      return {
        'crossAxisCount': 6,
        'childAspectRatio': 2.0,
        'crossAxisSpacing': 16.0,
        'mainAxisSpacing': 16.0,
      };
    } else if (screenWidth > 1400) {
      // Very large screens
      return {
        'crossAxisCount': 5,
        'childAspectRatio': 2.2,
        'crossAxisSpacing': 16.0,
        'mainAxisSpacing': 16.0,
      };
    } else if (screenWidth > 1000) {
      // Large screens
      return {
        'crossAxisCount': 4,
        'childAspectRatio': 2.4,
        'crossAxisSpacing': 16.0,
        'mainAxisSpacing': 16.0,
      };
    } else if (screenWidth > 768) {
      // Medium screens
      return {
        'crossAxisCount': 3,
        'childAspectRatio': 2.6,
        'crossAxisSpacing': 16.0,
        'mainAxisSpacing': 16.0,
      };
    } else if (screenWidth > 480) {
      // Small tablets
      return {
        'crossAxisCount': 2,
        'childAspectRatio': 2.8,
        'crossAxisSpacing': 12.0,
        'mainAxisSpacing': 12.0,
      };
    } else {
      // Mobile phones
      return {
        'crossAxisCount': 1,
        'childAspectRatio': 4.0,
        'crossAxisSpacing': 8.0,
        'mainAxisSpacing': 8.0,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final gridParams = _getGridParameters(screenWidth);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Skills header with modern design
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Theme.of(context).colorScheme.secondary.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with icon
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.3),
                      ),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.tools,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Skills & Technologies',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Modern category filters
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter by Category:',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: categories.map((category) {
                      final isSelected = category == selectedCategory;
                      return _ModernFilterChip(
                        label: category,
                        isSelected: isSelected,
                        onSelected: () => onCategorySelected(category),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Responsive Skills grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridParams['crossAxisCount'],
            crossAxisSpacing: gridParams['crossAxisSpacing'],
            mainAxisSpacing: gridParams['mainAxisSpacing'],
            childAspectRatio: gridParams['childAspectRatio'],
          ),
          itemCount: skills.length,
          itemBuilder: (context, index) {
            final skill = skills[index];
            return _SkillCard(
              skill: skill,
              skillColor: _parseColor(skill.color, context),
              iconData: _getIconData(skill.icon),
            );
          },
        ),
      ],
    );
  }
}

class _SkillCard extends StatefulWidget {
  final SkillModel skill;
  final Color skillColor;
  final IconData iconData;

  const _SkillCard({
    required this.skill,
    required this.skillColor,
    required this.iconData,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive padding and icon size
    final cardPadding = screenWidth > 1400
        ? 18.0
        : (screenWidth > 768 ? 16.0 : 14.0);
    final iconSize = screenWidth > 1400
        ? 18.0
        : (screenWidth > 768 ? 16.0 : 14.0);
    final iconPadding = screenWidth > 1400 ? 7.0 : 6.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Transform.scale(
        scale: _isHovered ? 1.02 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered
                  ? widget.skillColor.withOpacity(0.5)
                  : theme.colorScheme.outline.withOpacity(0.2),
              width: _isHovered ? 2 : 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.skillColor.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Padding(
            padding: EdgeInsets.all(cardPadding),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(iconPadding),
                  decoration: BoxDecoration(
                    color: widget.skillColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FaIcon(
                    widget.iconData,
                    color: widget.skillColor,
                    size: iconSize,
                  ),
                ),
                SizedBox(width: screenWidth > 1400 ? 10 : 8),
                Expanded(
                  child: Text(
                    widget.skill.name,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                      fontSize: screenWidth > 1400
                          ? 14
                          : (screenWidth > 768 ? 13 : 12),
                    ),
                    overflow: TextOverflow.ellipsis,
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

class _ModernFilterChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const _ModernFilterChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  State<_ModernFilterChip> createState() => _ModernFilterChipState();
}

class _ModernFilterChipState extends State<_ModernFilterChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onSelected,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            gradient: widget.isSelected
                ? LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                  )
                : null,
            color: widget.isSelected
                ? null
                : (_isHovered
                      ? theme.colorScheme.primary.withOpacity(0.1)
                      : theme.colorScheme.surface),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: widget.isSelected
                  ? Colors.transparent
                  : (_isHovered
                        ? theme.colorScheme.primary.withOpacity(0.5)
                        : theme.colorScheme.outline.withOpacity(0.3)),
              width: 1.5,
            ),
            boxShadow: widget.isSelected || _isHovered
                ? [
                    BoxShadow(
                      color:
                          (widget.isSelected
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.outline)
                              .withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isSelected) ...[
                FaIcon(FontAwesomeIcons.check, size: 12, color: Colors.white),
                const SizedBox(width: 6),
              ] else if (_isHovered) ...[
                FaIcon(
                  _getCategoryIcon(widget.label),
                  size: 12,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 6),
              ],
              Text(
                widget.label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: widget.isSelected
                      ? Colors.white
                      : theme.colorScheme.onSurface,
                  fontWeight: widget.isSelected
                      ? FontWeight.w600
                      : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'all':
        return FontAwesomeIcons.th;
      case 'mobile development':
        return FontAwesomeIcons.mobile;
      case 'programming language':
        return FontAwesomeIcons.code;
      case 'backend':
        return FontAwesomeIcons.server;
      case 'database':
        return FontAwesomeIcons.database;
      case 'tools':
        return FontAwesomeIcons.wrench;
      case 'state management':
        return FontAwesomeIcons.sitemap;
      case 'ide':
        return FontAwesomeIcons.laptop;
      case 'ui/ux':
        return FontAwesomeIcons.paintBrush;
      default:
        return FontAwesomeIcons.tag;
    }
  }
}
