import 'package:flutter/material.dart';
import '../../../core/models/project_model.dart';

class ProjectGrid extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return const Center(child: Text('No projects found'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (project.featured)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Featured',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  project.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  project.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Wrap(
                  spacing: 4,
                  children: project.technologies
                      .take(3)
                      .map(
                        (tech) => Chip(
                          label: Text(tech),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (project.githubUrl != null)
                      TextButton(onPressed: () {}, child: const Text('GitHub')),
                    if (project.liveUrl != null)
                      TextButton(
                        onPressed: () {},
                        child: const Text('Live Demo'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
