import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills & Technologies',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),

        // Category filters
        Wrap(
          spacing: 8,
          children: categories.map((category) {
            final isSelected = category == selectedCategory;
            return FilterChip(
              selected: isSelected,
              label: Text(category),
              onSelected: (_) => onCategorySelected(category),
            );
          }).toList(),
        ),

        const SizedBox(height: 24),

        // Skills grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3,
          ),
          itemCount: skills.length,
          itemBuilder: (context, index) {
            final skill = skills[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: skill.proficiency / 100,
                      backgroundColor: Colors.grey[800],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
