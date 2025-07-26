import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        const SizedBox(height: 24),

        // Timeline layout
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: experience.length,
          itemBuilder: (context, index) {
            final exp = experience[index];
            final isLast = index == experience.length - 1;

            return _ExperienceTimelineItem(
              experience: exp,
              isLast: isLast,
              index: index,
            );
          },
        ),
      ],
    );
  }
}

class _ExperienceTimelineItem extends StatefulWidget {
  final ExperienceModel experience;
  final bool isLast;
  final int index;

  const _ExperienceTimelineItem({
    required this.experience,
    required this.isLast,
    required this.index,
  });

  @override
  State<_ExperienceTimelineItem> createState() =>
      _ExperienceTimelineItemState();
}

class _ExperienceTimelineItemState extends State<_ExperienceTimelineItem> {
  bool _isHovered = false;

  // Get icon based on experience type
  IconData _getExperienceIcon() {
    if (widget.experience.title.toLowerCase().contains('senior') ||
        widget.experience.title.toLowerCase().contains('lead')) {
      return FontAwesomeIcons.crown;
    } else if (widget.experience.title.toLowerCase().contains('freelance') ||
        widget.experience.title.toLowerCase().contains('consultant')) {
      return FontAwesomeIcons.userTie;
    } else if (widget.experience.title.toLowerCase().contains('developer')) {
      return FontAwesomeIcons.code;
    } else {
      return FontAwesomeIcons.briefcase;
    }
  }

  Color _getExperienceColor() {
    if (widget.index == 0) {
      return const Color(0xFF4EC9B0); // Current/Latest - Teal
    } else if (widget.index == 1) {
      return const Color(0xFF007ACC); // Recent - Blue
    } else if (widget.index == 2) {
      return const Color(0xFFFFCC02); // Mid - Yellow
    } else {
      return const Color(0xFF969696); // Early - Gray
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final experienceColor = _getExperienceColor();

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline line and icon
          SizedBox(
            width: 60,
            child: Column(
              children: [
                // Icon container
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: experienceColor.withOpacity(_isHovered ? 0.2 : 0.1),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: experienceColor,
                      width: _isHovered ? 3 : 2,
                    ),
                    boxShadow: _isHovered
                        ? [
                            BoxShadow(
                              color: experienceColor.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: FaIcon(
                      _getExperienceIcon(),
                      color: experienceColor,
                      size: 18,
                    ),
                  ),
                ),

                // Timeline line
                if (!widget.isLast)
                  Container(
                    width: 2,
                    height: 120,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          experienceColor.withOpacity(0.8),
                          _getNextExperienceColor().withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Experience content
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _isHovered
                        ? experienceColor.withOpacity(0.5)
                        : theme.colorScheme.outline.withOpacity(0.2),
                    width: _isHovered ? 2 : 1,
                  ),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: experienceColor.withOpacity(0.15),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Job title
                                Text(
                                  widget.experience.title,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                // Company and duration
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.building,
                                      size: 14,
                                      color: experienceColor,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        widget.experience.company,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                              color: experienceColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Duration badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: experienceColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: experienceColor.withOpacity(0.3),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.calendar,
                                  size: 12,
                                  color: experienceColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  widget.experience.duration,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: experienceColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Description
                      Text(
                        widget.experience.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.6,
                          color: theme.colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Technologies
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.experience.technologies.map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: theme.colorScheme.primary.withOpacity(
                                  0.3,
                                ),
                                width: 0.5,
                              ),
                            ),
                            child: Text(
                              tech,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getNextExperienceColor() {
    if (widget.index + 1 < 4) {
      final nextIndex = widget.index + 1;
      if (nextIndex == 0) return const Color(0xFF4EC9B0);
      if (nextIndex == 1) return const Color(0xFF007ACC);
      if (nextIndex == 2) return const Color(0xFFFFCC02);
      if (nextIndex == 3) return const Color(0xFF969696);
    }
    return const Color(0xFF969696);
  }
}
