import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:
          MediaQuery.of(context).size.height -
          87, // Subtract title bar and status bar height
      padding: const EdgeInsets.all(0),
      color: const Color(0xFF1E1E1E), // Editor background
      child: Row(
        children: [
          // Line numbers
          Container(
            width: 60,
            color: const Color(0xFF1E1E1E),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ...List.generate(35, (index) {
                  return Container(
                    height: 20,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      '${index + 1}',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12,
                        color: const Color(0xFF858585),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),

          // Vertical separator
          Container(width: 1, color: const Color(0xFF464647)),

          // Code content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // File content
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 14,
                        height: 1.4,
                        color: const Color(0xFFCCCCCC),
                      ),
                      children: [
                        // Import statements
                        TextSpan(
                          text: 'import ',
                          style: TextStyle(color: Colors.purple[300]),
                        ),
                        TextSpan(
                          text: "'package:flutter/material.dart'",
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ';\n'),
                        TextSpan(
                          text: 'import ',
                          style: TextStyle(color: Colors.purple[300]),
                        ),
                        TextSpan(
                          text: "'package:flutter_bloc/flutter_bloc.dart'",
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ';\n\n'),

                        // Comments
                        TextSpan(
                          text: '/// 📱 Mobile Developer Portfolio\n',
                          style: TextStyle(color: Colors.green[400]),
                        ),
                        TextSpan(
                          text:
                              '/// Specializing in Flutter & Kotlin Development\n',
                          style: TextStyle(color: Colors.green[400]),
                        ),
                        TextSpan(
                          text: '/// Building amazing mobile experiences! 🚀\n',
                          style: TextStyle(color: Colors.green[400]),
                        ),
                        const TextSpan(text: '\n'),

                        // Class definition
                        TextSpan(
                          text: 'class ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        TextSpan(
                          text: 'MobileDeveloper',
                          style: TextStyle(color: Colors.yellow[300]),
                        ),
                        const TextSpan(text: ' {\n'),

                        // Properties
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: 'final String ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        const TextSpan(text: 'name = '),
                        TextSpan(
                          text: '"Mohamed Maher"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ';\n'),

                        const TextSpan(text: '  '),
                        TextSpan(
                          text: 'final String ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        const TextSpan(text: 'role = '),
                        TextSpan(
                          text: '"Mobile Developer"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ';\n'),

                        const TextSpan(text: '  '),
                        TextSpan(
                          text: 'final List<String> ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        const TextSpan(text: 'specializations = [\n'),

                        // Specializations array
                        const TextSpan(text: '    '),
                        TextSpan(
                          text: '"Flutter Development"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ',\n'),

                        const TextSpan(text: '    '),
                        TextSpan(
                          text: '"Kotlin Development"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ',\n'),

                        const TextSpan(text: '    '),
                        TextSpan(
                          text: '"Cross-platform Apps"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ',\n'),

                        const TextSpan(text: '    '),
                        TextSpan(
                          text: '"Native Android"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ',\n'),

                        const TextSpan(text: '    '),
                        TextSpan(
                          text: '"UI/UX Implementation"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: '\n'),

                        const TextSpan(text: '  ];\n\n'),

                        const TextSpan(text: '  '),
                        TextSpan(
                          text: 'final Map<String, int> ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        const TextSpan(text: 'experience = {\n'),

                        const TextSpan(text: '    '),
                        TextSpan(
                          text: '"Flutter"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ': '),
                        TextSpan(
                          text: '4',
                          style: TextStyle(color: Colors.cyan[300]),
                        ),
                        const TextSpan(text: ', '),
                        TextSpan(
                          text: '// years\n',
                          style: TextStyle(color: Colors.green[400]),
                        ),

                        const TextSpan(text: '    '),
                        TextSpan(
                          text: '"Kotlin"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ': '),
                        TextSpan(
                          text: '3',
                          style: TextStyle(color: Colors.cyan[300]),
                        ),
                        const TextSpan(text: ', '),
                        TextSpan(
                          text: '// years\n',
                          style: TextStyle(color: Colors.green[400]),
                        ),

                        const TextSpan(text: '    '),
                        TextSpan(
                          text: '"Mobile Development"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ': '),
                        TextSpan(
                          text: '5',
                          style: TextStyle(color: Colors.cyan[300]),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: '// years\n',
                          style: TextStyle(color: Colors.green[400]),
                        ),

                        const TextSpan(text: '  };\n\n'),

                        // Methods
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: 'Future<Widget> ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        TextSpan(
                          text: 'buildFlutterApp',
                          style: TextStyle(color: Colors.yellow[300]),
                        ),
                        const TextSpan(text: '() '),
                        TextSpan(
                          text: 'async ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        const TextSpan(text: '{\n'),

                        const TextSpan(text: '    '),
                        TextSpan(
                          text: 'return ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        TextSpan(
                          text: 'MaterialApp',
                          style: TextStyle(color: Colors.yellow[300]),
                        ),
                        const TextSpan(text: '(\n'),

                        const TextSpan(text: '      title: '),
                        TextSpan(
                          text: '"Amazing Mobile App"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ',\n'),

                        const TextSpan(text: '      theme: '),
                        TextSpan(
                          text: 'ThemeData',
                          style: TextStyle(color: Colors.yellow[300]),
                        ),
                        const TextSpan(text: '.\n'),

                        const TextSpan(text: '        '),
                        TextSpan(
                          text: 'material3',
                          style: TextStyle(color: Colors.yellow[300]),
                        ),
                        const TextSpan(text: '(),\n'),

                        const TextSpan(text: '      home: '),
                        TextSpan(
                          text: 'MyHomePage',
                          style: TextStyle(color: Colors.yellow[300]),
                        ),
                        const TextSpan(text: '(),\n'),

                        const TextSpan(text: '    );\n'),
                        const TextSpan(text: '  }\n\n'),

                        // Another method
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: 'void ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        TextSpan(
                          text: 'deployToPlayStore',
                          style: TextStyle(color: Colors.yellow[300]),
                        ),
                        const TextSpan(text: '() {\n'),

                        const TextSpan(text: '    '),
                        TextSpan(
                          text: 'print',
                          style: TextStyle(color: Colors.purple[300]),
                        ),
                        const TextSpan(text: '('),
                        TextSpan(
                          text: '"📱 App deployed successfully!"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ');\n'),

                        const TextSpan(text: '    '),
                        TextSpan(
                          text: 'print',
                          style: TextStyle(color: Colors.purple[300]),
                        ),
                        const TextSpan(text: '('),
                        TextSpan(
                          text: '"🚀 Ready for millions of users!"',
                          style: TextStyle(color: Colors.orange[300]),
                        ),
                        const TextSpan(text: ');\n'),

                        const TextSpan(text: '  }\n'),

                        const TextSpan(text: '}\n\n'),

                        // Main function
                        TextSpan(
                          text: 'void ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        TextSpan(
                          text: 'main',
                          style: TextStyle(color: Colors.yellow[300]),
                        ),
                        const TextSpan(text: '() '),
                        TextSpan(
                          text: 'async ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        const TextSpan(text: '{\n'),

                        const TextSpan(text: '  '),
                        TextSpan(
                          text: 'final ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        const TextSpan(text: 'developer = '),
                        TextSpan(
                          text: 'MobileDeveloper',
                          style: TextStyle(color: Colors.yellow[300]),
                        ),
                        const TextSpan(text: '();\n'),

                        const TextSpan(text: '  '),
                        TextSpan(
                          text: 'final ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        const TextSpan(text: 'app = '),
                        TextSpan(
                          text: 'await ',
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        const TextSpan(text: 'developer.'),
                        TextSpan(
                          text: 'buildFlutterApp',
                          style: TextStyle(color: Colors.yellow[300]),
                        ),
                        const TextSpan(text: '();\n'),

                        const TextSpan(text: '  '),
                        TextSpan(
                          text: 'runApp',
                          style: TextStyle(color: Colors.purple[300]),
                        ),
                        const TextSpan(text: '(app);\n'),

                        const TextSpan(text: '}\n'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Action buttons styled as VS Code suggestions
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF252526),
                      border: Border.all(color: const Color(0xFF464647)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '📱',
                              style: GoogleFonts.jetBrainsMono(fontSize: 16),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Mobile Development Portfolio',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 14,
                                color: const Color(0xFFFFCC02),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Action buttons
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _ActionButton(
                              icon: Icons.smartphone,
                              text: 'View Mobile Apps',
                              onPressed: () => context.go('/projects'),
                              isPrimary: true,
                            ),
                            _ActionButton(
                              icon: Icons.person_outline,
                              text: 'About Me',
                              onPressed: () => context.go('/about'),
                            ),
                            _ActionButton(
                              icon: Icons.contact_mail_outlined,
                              text: 'Hire Me',
                              onPressed: () => context.go('/contact'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const _ActionButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    this.isPrimary = false,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? const Color(0xFF007ACC)
                : _isHovered
                ? const Color(0xFF094771)
                : const Color(0xFF2D2D30),
            border: Border.all(
              color: widget.isPrimary
                  ? const Color(0xFF007ACC)
                  : const Color(0xFF464647),
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 16, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                widget.text,
                style: GoogleFonts.sourceCodePro(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
