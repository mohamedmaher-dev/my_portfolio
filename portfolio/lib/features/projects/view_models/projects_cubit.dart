import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/portfolio_service.dart';
import 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  final PortfolioService _portfolioService;

  ProjectsCubit(this._portfolioService)
    : super(const ProjectsState(isLoading: true));

  void loadProjects() {
    try {
      final projects = _portfolioService.getProjects();
      emit(state.copyWith(isLoading: false, projects: projects, error: null));
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, error: 'Failed to load projects: $e'),
      );
    }
  }

  void filterByCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void toggleFeaturedOnly() {
    emit(state.copyWith(showFeaturedOnly: !state.showFeaturedOnly));
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }

  void searchProjects(String query) {
    emit(state.copyWith(searchQuery: query));
  }
}
