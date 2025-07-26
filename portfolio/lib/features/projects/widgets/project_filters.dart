import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectFilters extends StatefulWidget {
  final List<String> categories;
  final String selectedCategory;
  final bool showFeaturedOnly;
  final String searchQuery;
  final Function(String) onCategoryChanged;
  final VoidCallback onFeaturedToggled;
  final Function(String) onSearchChanged;

  const ProjectFilters({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.showFeaturedOnly,
    required this.searchQuery,
    required this.onCategoryChanged,
    required this.onFeaturedToggled,
    required this.onSearchChanged,
  });

  @override
  State<ProjectFilters> createState() => _ProjectFiltersState();
}

class _ProjectFiltersState extends State<ProjectFilters> {
  late TextEditingController _searchController;
  bool _isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.searchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.surface,
            theme.colorScheme.surface.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.colorScheme.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.filter,
                    color: theme.colorScheme.primary,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Find Your Project',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Modern search bar
            _buildModernSearchBar(theme),

            const SizedBox(height: 24),

            // Filter section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.tags,
                      size: 14,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Categories',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.9,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Category chips
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.categories.map((category) {
                    final isSelected = category == widget.selectedCategory;
                    return _ModernCategoryChip(
                      label: category,
                      isSelected: isSelected,
                      onSelected: () => widget.onCategoryChanged(category),
                    );
                  }).toList(),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Featured toggle section
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.star,
                  size: 14,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                const SizedBox(width: 8),
                Text(
                  'Special Filters',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.9),
                  ),
                ),
                const Spacer(),
                _ModernFeaturedToggle(
                  isSelected: widget.showFeaturedOnly,
                  onToggle: widget.onFeaturedToggled,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernSearchBar(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _isSearchFocused
              ? theme.colorScheme.primary.withValues(alpha: 0.5)
              : theme.colorScheme.outline.withValues(alpha: 0.3),
          width: _isSearchFocused ? 2 : 1,
        ),
        boxShadow: _isSearchFocused
            ? [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: TextField(
        controller: _searchController,
        onChanged: widget.onSearchChanged,
        onTap: () => setState(() => _isSearchFocused = true),
        onTapOutside: (_) => setState(() => _isSearchFocused = false),
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          hintText: 'Search projects by name, description, or technology...',
          hintStyle: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),

          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 16,
              color: _isSearchFocused
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          suffixIcon: widget.searchQuery.isNotEmpty
              ? IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.xmark,
                    size: 14,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  onPressed: () {
                    _searchController.clear();
                    widget.onSearchChanged('');
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}

class _ModernCategoryChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const _ModernCategoryChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  State<_ModernCategoryChip> createState() => _ModernCategoryChipState();
}

class _ModernCategoryChipState extends State<_ModernCategoryChip> {
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
                      ? theme.colorScheme.primary.withValues(alpha: 0.1)
                      : theme.colorScheme.surface),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.isSelected
                  ? Colors.transparent
                  : (_isHovered
                        ? theme.colorScheme.primary.withValues(alpha: 0.5)
                        : theme.colorScheme.outline.withValues(alpha: 0.3)),
              width: 1.5,
            ),
            boxShadow: widget.isSelected || _isHovered
                ? [
                    BoxShadow(
                      color:
                          (widget.isSelected
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.outline)
                              .withValues(alpha: 0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isSelected) ...[
                FaIcon(FontAwesomeIcons.check, size: 10, color: Colors.white),
                const SizedBox(width: 6),
              ] else if (_isHovered) ...[
                FaIcon(
                  _getCategoryIcon(widget.label),
                  size: 10,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 6),
              ],
              Text(
                widget.label,
                style: theme.textTheme.bodySmall?.copyWith(
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
        return FontAwesomeIcons.tableCells;
      case 'e-commerce':
        return FontAwesomeIcons.cartShopping;
      case 'productivity':
        return FontAwesomeIcons.listCheck;
      case 'utility':
        return FontAwesomeIcons.wrench;
      case 'social':
        return FontAwesomeIcons.users;
      case 'lifestyle':
        return FontAwesomeIcons.heart;
      default:
        return FontAwesomeIcons.folder;
    }
  }
}

class _ModernFeaturedToggle extends StatefulWidget {
  final bool isSelected;
  final VoidCallback onToggle;

  const _ModernFeaturedToggle({
    required this.isSelected,
    required this.onToggle,
  });

  @override
  State<_ModernFeaturedToggle> createState() => _ModernFeaturedToggleState();
}

class _ModernFeaturedToggleState extends State<_ModernFeaturedToggle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onToggle,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            gradient: widget.isSelected
                ? const LinearGradient(colors: [Colors.amber, Colors.orange])
                : null,
            color: widget.isSelected
                ? null
                : (_isHovered
                      ? Colors.amber.withValues(alpha: 0.1)
                      : theme.colorScheme.surface),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: widget.isSelected
                  ? Colors.transparent
                  : (_isHovered
                        ? Colors.amber.withValues(alpha: 0.5)
                        : theme.colorScheme.outline.withValues(alpha: 0.3)),
              width: 1.5,
            ),
            boxShadow: widget.isSelected || _isHovered
                ? [
                    BoxShadow(
                      color:
                          (widget.isSelected
                                  ? Colors.amber
                                  : theme.colorScheme.outline)
                              .withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.star,
                size: 12,
                color: widget.isSelected
                    ? Colors.white
                    : (_isHovered
                          ? Colors.amber
                          : theme.colorScheme.onSurface.withValues(alpha: 0.7)),
              ),
              const SizedBox(width: 8),
              Text(
                'Featured Only',
                style: theme.textTheme.bodySmall?.copyWith(
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
}
