import 'package:flutter/material.dart';
import '../../../core/models/experience_model.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceModel> experience;

  const ExperienceSection({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Experience',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),

        ...experience.map(
          (exp) => Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${exp.company} • ${exp.duration}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    exp.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: exp.technologies
                        .map(
                          (tech) => Chip(
                            label: Text(tech),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.surface,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
