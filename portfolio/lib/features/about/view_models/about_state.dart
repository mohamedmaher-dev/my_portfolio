import 'package:equatable/equatable.dart';
import '../../../core/models/skill_model.dart';
import '../../../core/models/experience_model.dart';

class AboutState extends Equatable {
  const AboutState({
    this.isLoading = false,
    this.skills = const [],
    this.experience = const [],
    this.selectedSkillCategory = 'All',
    this.error,
  });

  final bool isLoading;
  final List<SkillModel> skills;
  final List<ExperienceModel> experience;
  final String selectedSkillCategory;
  final String? error;

  List<SkillModel> get filteredSkills {
    if (selectedSkillCategory == 'All') {
      return skills;
    }
    return skills
        .where((skill) => skill.category == selectedSkillCategory)
        .toList();
  }

  List<String> get skillCategories {
    final categories = skills.map((skill) => skill.category).toSet().toList();
    categories.insert(0, 'All');
    return categories;
  }

  AboutState copyWith({
    bool? isLoading,
    List<SkillModel>? skills,
    List<ExperienceModel>? experience,
    String? selectedSkillCategory,
    String? error,
  }) {
    return AboutState(
      isLoading: isLoading ?? this.isLoading,
      skills: skills ?? this.skills,
      experience: experience ?? this.experience,
      selectedSkillCategory:
          selectedSkillCategory ?? this.selectedSkillCategory,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    skills,
    experience,
    selectedSkillCategory,
    error,
  ];
}
