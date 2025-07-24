import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../view_models/projects_cubit.dart';
import '../view_models/projects_state.dart';
import '../widgets/project_grid.dart';
import '../widgets/project_filters.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProjectsCubit>()..loadProjects(),
      child: const ProjectsViewContent(),
    );
  }
}

class ProjectsViewContent extends StatelessWidget {
  const ProjectsViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  state.error!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<ProjectsCubit>().loadProjects(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            // Filters
            ProjectFilters(
              categories: state.categories,
              selectedCategory: state.selectedCategory,
              showFeaturedOnly: state.showFeaturedOnly,
              searchQuery: state.searchQuery,
              onCategoryChanged: (category) =>
                  context.read<ProjectsCubit>().filterByCategory(category),
              onFeaturedToggled: () =>
                  context.read<ProjectsCubit>().toggleFeaturedOnly(),
              onSearchChanged: (query) =>
                  context.read<ProjectsCubit>().searchProjects(query),
            ),

            // Projects Grid
            Expanded(child: ProjectGrid(projects: state.filteredProjects)),
          ],
        );
      },
    );
  }
}
