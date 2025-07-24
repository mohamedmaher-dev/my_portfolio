import 'package:flutter/material.dart';

class ProjectFilters extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Search bar
          TextField(
            onChanged: onSearchChanged,
            decoration: const InputDecoration(
              hintText: 'Search projects...',
              prefixIcon: Icon(Icons.search),
            ),
          ),

          const SizedBox(height: 16),

          // Filters
          Row(
            children: [
              // Category filter
              Expanded(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  isExpanded: true,
                  items: categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) onCategoryChanged(value);
                  },
                ),
              ),

              const SizedBox(width: 16),

              // Featured toggle
              FilterChip(
                selected: showFeaturedOnly,
                label: const Text('Featured Only'),
                onSelected: (_) => onFeaturedToggled(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
