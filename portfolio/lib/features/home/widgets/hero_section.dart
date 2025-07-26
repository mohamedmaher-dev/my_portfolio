import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: screenSize.height - 87,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E1E1E),
            const Color(0xFF252526),
            const Color(0xFF2D2D30),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
        child: Row(
          children: [
            // Left side - Hero content
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting
                  Text(
                    '👋 Hello, I\'m',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Name
                  Text(
                    'Mohamed Maher',
                    style: GoogleFonts.inter(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Role
                  Row(
                    children: [
                      Text(
                        'I\'m a ',
                        style: GoogleFonts.inter(
                          fontSize: 28,
                          color: Colors.white70,
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [
                            theme.colorScheme.primary,
                            theme.colorScheme.secondary,
                          ],
                        ).createShader(bounds),
                        child: Text(
                          'Mobile Developer',
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Description
                  Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Text(
                      'Passionate about creating beautiful, performant mobile applications using Flutter and Kotlin. I turn ideas into reality with clean code and stunning user experiences.',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        height: 1.6,
                        color: Colors.white70,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Stats row
                  _buildStatsRow(),

                  const SizedBox(height: 40),

                  // Action buttons
                  _buildActionButtons(context),
                ],
              ),
            ),

            const SizedBox(width: 60),

            // Right side - Visual elements
            Expanded(flex: 2, child: _buildRightSideVisuals()),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _StatItem(
          number: '5+',
          label: 'Years Experience',
          icon: FontAwesomeIcons.calendar,
        ),
        const SizedBox(width: 40),
        _StatItem(
          number: '20+',
          label: 'Projects Built',
          icon: FontAwesomeIcons.code,
        ),
        const SizedBox(width: 40),
        _StatItem(
          number: '99%',
          label: 'Client Satisfaction',
          icon: FontAwesomeIcons.heart,
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        _ModernActionButton(
          text: 'View My Work',
          icon: FontAwesomeIcons.rocket,
          onPressed: () => context.go('/projects'),
          isPrimary: true,
        ),
        const SizedBox(width: 16),
        _ModernActionButton(
          text: 'Let\'s Talk',
          icon: FontAwesomeIcons.commentDots,
          onPressed: () => context.go('/contact'),
          isPrimary: false,
        ),
        const SizedBox(width: 16),
        _ModernActionButton(
          text: 'About Me',
          icon: FontAwesomeIcons.user,
          onPressed: () => context.go('/about'),
          isPrimary: false,
        ),
      ],
    );
  }

  Widget _buildRightSideVisuals() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Device mockup
        _buildDeviceMockup(),
      ],
    );
  }

  Widget _buildDeviceMockup() {
    return Container(
      width: 200,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFF007ACC), const Color(0xFF4EC9B0)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF007ACC).withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Screen content
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // App bar
                  Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF007ACC), Color(0xFF4EC9B0)],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Mobile App',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Content area
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Cards
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Home indicator
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatItem({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF252526),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF464647)),
          ),
          child: FaIcon(icon, color: const Color(0xFF007ACC), size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          number,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 12, color: Colors.white70),
        ),
      ],
    );
  }
}

class _ModernActionButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isPrimary;

  const _ModernActionButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.isPrimary,
  });

  @override
  State<_ModernActionButton> createState() => _ModernActionButtonState();
}

class _ModernActionButtonState extends State<_ModernActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            gradient: widget.isPrimary
                ? LinearGradient(
                    colors: [const Color(0xFF007ACC), const Color(0xFF4EC9B0)],
                  )
                : null,
            color: widget.isPrimary ? null : Colors.transparent,
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.transparent
                  : (_isHovered
                        ? const Color(0xFF007ACC)
                        : const Color(0xFF464647)),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: widget.isPrimary && _isHovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF007ACC).withValues(alpha: 0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(widget.icon, size: 16, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                widget.text,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
