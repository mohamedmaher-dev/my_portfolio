import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/portfolio_service.dart';
import 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  final PortfolioService _portfolioService;

  AboutCubit(this._portfolioService) : super(const AboutState(isLoading: true));

  void loadAboutData() {
    try {
      final skills = _portfolioService.getSkills();
      final experience = _portfolioService.getExperience();

      emit(
        state.copyWith(
          isLoading: false,
          skills: skills,
          experience: experience,
          error: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to load about data: $e',
        ),
      );
    }
  }

  void selectSkillCategory(String category) {
    emit(state.copyWith(selectedSkillCategory: category));
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }
}
