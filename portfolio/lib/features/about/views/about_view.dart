import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/di/service_locator.dart';
import '../view_models/about_cubit.dart';
import '../view_models/about_state.dart';
import '../widgets/skills_section.dart';
import '../widgets/experience_section.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AboutCubit>()..loadAboutData(),
      child: const AboutViewContent(),
    );
  }
}

class AboutViewContent extends StatelessWidget {
  const AboutViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
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
                  onPressed: () => context.read<AboutCubit>().loadAboutData(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Modern About introduction
              _buildAboutHeroSection(context),

              const SizedBox(height: 40),

              // Skills Section
              SkillsSection(
                skills: state.filteredSkills,
                categories: state.skillCategories,
                selectedCategory: state.selectedSkillCategory,
                onCategorySelected: (category) =>
                    context.read<AboutCubit>().selectSkillCategory(category),
              ),

              const SizedBox(height: 40),

              // Experience Section
              ExperienceSection(experience: state.experience),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAboutHeroSection(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.surface,
            theme.colorScheme.surface.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
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
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: [
            // Left side - Content
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with icon
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: theme.colorScheme.primary.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.user,
                          color: theme.colorScheme.primary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'About Me',
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Main description
                  Text(
                    'Passionate Mobile Developer & Freelancer',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'I\'m a dedicated freelance mobile developer specializing in Flutter and Kotlin development. With over 5 years of experience, I create beautiful, performant, and user-friendly mobile applications that help businesses achieve their goals.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'I love working with modern technologies, following best practices, and delivering high-quality solutions that exceed client expectations. From concept to deployment, I handle the complete development lifecycle.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Highlights
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      _buildHighlightChip(
                        context,
                        'Full-Stack Mobile',
                        FontAwesomeIcons.mobile,
                      ),
                      _buildHighlightChip(
                        context,
                        'Freelancer',
                        FontAwesomeIcons.userTie,
                      ),
                      _buildHighlightChip(
                        context,
                        '5+ Years',
                        FontAwesomeIcons.calendar,
                      ),
                      _buildHighlightChip(
                        context,
                        '20+ Projects',
                        FontAwesomeIcons.diagramProject,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 32),

            // Right side - Visual element
            Expanded(
              flex: 1,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.colorScheme.primary.withValues(alpha: 0.1),
                      theme.colorScheme.secondary.withValues(alpha: 0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: theme.colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
                child: Stack(
                  children: [
                    // Floating icons
                    Positioned(
                      top: 30,
                      left: 30,
                      child: _buildFloatingIcon(
                        context,
                        FontAwesomeIcons.flutter,
                        theme.colorScheme.primary,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 40,
                      child: _buildFloatingIcon(
                        context,
                        FontAwesomeIcons.android,
                        const Color(0xFF3DDC84),
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      left: 40,
                      child: _buildFloatingIcon(
                        context,
                        FontAwesomeIcons.fire,
                        const Color(0xFFFFCA28),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 30,
                      child: _buildFloatingIcon(
                        context,
                        FontAwesomeIcons.code,
                        theme.colorScheme.secondary,
                      ),
                    ),

                    // Center element
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.3,
                              ),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.laptop,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightChip(
    BuildContext context,
    String label,
    IconData icon,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, size: 14, color: theme.colorScheme.primary),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingIcon(BuildContext context, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: FaIcon(icon, color: color, size: 16),
    );
  }
}
