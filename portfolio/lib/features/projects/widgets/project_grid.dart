import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/models/project_model.dart';

class ProjectGrid extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectGrid({super.key, required this.projects});

  // Calculate responsive grid parameters based on screen width
  Map<String, dynamic> _getGridParameters(double screenWidth) {
    if (screenWidth > 1600) {
      // Ultra-wide screens
      return {
        'crossAxisCount': 4,
        'childAspectRatio': 0.8,
        'crossAxisSpacing': 20.0,
        'mainAxisSpacing': 20.0,
      };
    } else if (screenWidth > 1200) {
      // Large screens
      return {
        'crossAxisCount': 3,
        'childAspectRatio': 0.75,
        'crossAxisSpacing': 18.0,
        'mainAxisSpacing': 18.0,
      };
    } else if (screenWidth > 768) {
      // Medium screens
      return {
        'crossAxisCount': 2,
        'childAspectRatio': 0.7,
        'crossAxisSpacing': 16.0,
        'mainAxisSpacing': 16.0,
      };
    } else {
      // Small screens
      return {
        'crossAxisCount': 1,
        'childAspectRatio': 1.2,
        'crossAxisSpacing': 12.0,
        'mainAxisSpacing': 12.0,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.folder_open, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No projects found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final gridParams = _getGridParameters(screenWidth);

    return GridView.builder(
      padding: EdgeInsets.all(screenWidth > 1200 ? 24.0 : 16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridParams['crossAxisCount'],
        crossAxisSpacing: gridParams['crossAxisSpacing'],
        mainAxisSpacing: gridParams['mainAxisSpacing'],
        childAspectRatio: gridParams['childAspectRatio'],
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return _ProjectCard(project: project);
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _isHovered
                      ? theme.colorScheme.primary.withOpacity(0.5)
                      : theme.colorScheme.outline.withOpacity(0.2),
                  width: _isHovered ? 2 : 1,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: theme.colorScheme.primary.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Image with overlay
                    Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  theme.colorScheme.primary.withOpacity(0.8),
                                  theme.colorScheme.secondary.withOpacity(0.6),
                                ],
                              ),
                            ),
                            child: widget.project.imageUrl.startsWith('assets/')
                                ? Image.asset(
                                    widget.project.imageUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return _buildPlaceholderImage(theme);
                                    },
                                  )
                                : _buildPlaceholderImage(theme),
                          ),

                          // Featured badge
                          if (widget.project.featured)
                            Positioned(
                              top: 12,
                              left: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.amber.withOpacity(0.4),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'Featured',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          // Category badge
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.surface.withOpacity(
                                  0.9,
                                ),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: theme.colorScheme.outline.withOpacity(
                                    0.3,
                                  ),
                                ),
                              ),
                              child: Text(
                                widget.project.category,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Project Content
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width > 1200
                              ? 20.0
                              : 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              widget.project.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onSurface,
                                fontSize:
                                    MediaQuery.of(context).size.width > 1200
                                    ? 16
                                    : 15,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width > 1200
                                  ? 10
                                  : 8,
                            ),

                            // Description
                            Expanded(
                              child: Text(
                                widget.project.description,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.8),
                                  height: 1.4,
                                  fontSize:
                                      MediaQuery.of(context).size.width > 1200
                                      ? 13
                                      : 12,
                                ),
                                maxLines:
                                    MediaQuery.of(context).size.width > 1200
                                    ? 4
                                    : 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            const SizedBox(height: 12),

                            // Technologies
                            Wrap(
                              spacing: 6,
                              runSpacing: 4,
                              children: widget.project.technologies
                                  .take(4)
                                  .map(
                                    (tech) => Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: theme.colorScheme.primary
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: theme.colorScheme.primary
                                              .withOpacity(0.3),
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Text(
                                        tech,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),

                            const SizedBox(height: 12),

                            // Action buttons
                            Row(
                              children: [
                                if (widget.project.githubUrl != null)
                                  Expanded(
                                    child: _ActionButton(
                                      icon: FontAwesomeIcons.github,
                                      label: 'Code',
                                      onPressed: () =>
                                          _launchUrl(widget.project.githubUrl!),
                                      isPrimary: false,
                                    ),
                                  ),
                                if (widget.project.githubUrl != null &&
                                    widget.project.liveUrl != null)
                                  const SizedBox(width: 8),
                                if (widget.project.liveUrl != null)
                                  Expanded(
                                    child: _ActionButton(
                                      icon: FontAwesomeIcons.externalLinkAlt,
                                      label: 'Live',
                                      onPressed: () =>
                                          _launchUrl(widget.project.liveUrl!),
                                      isPrimary: true,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaceholderImage(ThemeData theme) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary.withOpacity(0.3),
            theme.colorScheme.secondary.withOpacity(0.2),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.code,
              size: 32,
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(height: 8),
            Text(
              widget.project.title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.isPrimary,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isHovered
                      ? theme.colorScheme.primary.withOpacity(0.9)
                      : theme.colorScheme.primary)
                : (_isHovered
                      ? theme.colorScheme.outline.withOpacity(0.1)
                      : Colors.transparent),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: widget.isPrimary
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                widget.icon,
                size: 12,
                color: widget.isPrimary
                    ? Colors.white
                    : theme.colorScheme.onSurface,
              ),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: widget.isPrimary
                      ? Colors.white
                      : theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
