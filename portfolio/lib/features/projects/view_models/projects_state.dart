import 'package:equatable/equatable.dart';
import '../../../core/models/project_model.dart';

class ProjectsState extends Equatable {
  const ProjectsState({
    this.isLoading = false,
    this.projects = const [],
    this.selectedCategory = 'All',
    this.showFeaturedOnly = false,
    this.searchQuery = '',
    this.error,
  });

  final bool isLoading;
  final List<ProjectModel> projects;
  final String selectedCategory;
  final bool showFeaturedOnly;
  final String searchQuery;
  final String? error;

  List<ProjectModel> get filteredProjects {
    var filtered = projects;

    // Filter by featured
    if (showFeaturedOnly) {
      filtered = filtered.where((project) => project.featured).toList();
    }

    // Filter by category
    if (selectedCategory != 'All') {
      filtered = filtered
          .where((project) => project.category == selectedCategory)
          .toList();
    }

    // Filter by search query
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((project) {
        return project.title.toLowerCase().contains(
              searchQuery.toLowerCase(),
            ) ||
            project.description.toLowerCase().contains(
              searchQuery.toLowerCase(),
            ) ||
            project.technologies.any(
              (tech) => tech.toLowerCase().contains(searchQuery.toLowerCase()),
            );
      }).toList();
    }

    return filtered;
  }

  List<String> get categories {
    final categories = projects
        .map((project) => project.category)
        .toSet()
        .toList();
    categories.insert(0, 'All');
    return categories;
  }

  ProjectsState copyWith({
    bool? isLoading,
    List<ProjectModel>? projects,
    String? selectedCategory,
    bool? showFeaturedOnly,
    String? searchQuery,
    String? error,
  }) {
    return ProjectsState(
      isLoading: isLoading ?? this.isLoading,
      projects: projects ?? this.projects,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      showFeaturedOnly: showFeaturedOnly ?? this.showFeaturedOnly,
      searchQuery: searchQuery ?? this.searchQuery,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    projects,
    selectedCategory,
    showFeaturedOnly,
    searchQuery,
    error,
  ];
}
