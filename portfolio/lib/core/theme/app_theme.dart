import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // VSCode Dark Theme Colors - More Authentic
  static const Color primaryBackground = Color(0xFF1E1E1E); // Editor background
  static const Color secondaryBackground = Color(
    0xFF252526,
  ); // Sidebar background
  static const Color surfaceBackground = Color(0xFF2D2D30); // Panel background
  static const Color activityBarBackground = Color(0xFF333333); // Activity bar
  static const Color tabBarBackground = Color(0xFF2D2D30); // Tab bar
  static const Color statusBarBackground = Color(0xFF007ACC); // Status bar
  static const Color accentColor = Color(0xFF007ACC); // VSCode blue
  static const Color primaryText = Color(0xFFCCCCCC); // Main text
  static const Color secondaryText = Color(0xFF969696); // Secondary text
  static const Color borderColor = Color(0xFF464647); // Borders
  static const Color successColor = Color(0xFF4EC9B0); // Success green
  static const Color warningColor = Color(0xFFFFCC02); // Warning yellow
  static const Color errorColor = Color(0xFFF44747); // Error red
  static const Color highlightColor = Color(0xFF094771); // Selection
  static const Color activeTabColor = Color(0xFF1E1E1E); // Active tab
  static const Color inactiveTabColor = Color(0xFF2D2D30); // Inactive tab
  static const Color sidebarItemHover = Color(0xFF2A2D2E); // Hover state

  // VSCode Measurements
  static const double activityBarWidth = 48.0;
  static const double sidebarWidth = 240.0;
  static const double tabHeight = 35.0;
  static const double statusBarHeight = 22.0;
  static const double titleBarHeight = 30.0;

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      primaryColor: accentColor,
      scaffoldBackgroundColor: primaryBackground,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: accentColor,
        secondary: successColor,
        surface: secondaryBackground,
        onPrimary: Colors.white,
        onSecondary: primaryBackground,
        onSurface: primaryText,
        error: errorColor,
        onError: Colors.white,
        outline: borderColor,
      ),

      // AppBar Theme (for VSCode title bar)
      appBarTheme: AppBarTheme(
        backgroundColor: secondaryBackground,
        foregroundColor: primaryText,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.sourceCodePro(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: primaryText,
        ),
        toolbarHeight: titleBarHeight,
      ),

      // Text Theme (VSCode Typography)
      textTheme: TextTheme(
        displayLarge: GoogleFonts.sourceCodePro(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        displayMedium: GoogleFonts.sourceCodePro(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        displaySmall: GoogleFonts.sourceCodePro(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),
        headlineLarge: GoogleFonts.sourceCodePro(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        headlineMedium: GoogleFonts.sourceCodePro(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),
        headlineSmall: GoogleFonts.sourceCodePro(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),
        titleLarge: GoogleFonts.sourceCodePro(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),
        titleMedium: GoogleFonts.sourceCodePro(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),
        titleSmall: GoogleFonts.sourceCodePro(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: secondaryText,
        ),
        bodyLarge: GoogleFonts.sourceCodePro(fontSize: 14, color: primaryText),
        bodyMedium: GoogleFonts.sourceCodePro(fontSize: 13, color: primaryText),
        bodySmall: GoogleFonts.sourceCodePro(
          fontSize: 12,
          color: secondaryText,
        ),
        labelLarge: GoogleFonts.sourceCodePro(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),
        labelMedium: GoogleFonts.sourceCodePro(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),
        labelSmall: GoogleFonts.sourceCodePro(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: secondaryText,
        ),
      ),

      // Card Theme (for editor panels)
      cardTheme: CardThemeData(
        color: primaryBackground,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(color: borderColor, width: 1),
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          textStyle: GoogleFonts.sourceCodePro(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryText,
          textStyle: GoogleFonts.sourceCodePro(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(color: accentColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(color: errorColor),
        ),
        labelStyle: GoogleFonts.sourceCodePro(
          color: secondaryText,
          fontSize: 13,
        ),
        hintStyle: GoogleFonts.sourceCodePro(
          color: secondaryText,
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      // List Tile Theme (for sidebar items)
      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        selectedTileColor: sidebarItemHover,
        textColor: primaryText,
        iconColor: primaryText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        dense: true,
        visualDensity: VisualDensity.compact,
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarThemeData(
        labelColor: primaryText,
        unselectedLabelColor: secondaryText,
        indicatorColor: accentColor,
        labelStyle: GoogleFonts.sourceCodePro(fontSize: 13),
        unselectedLabelStyle: GoogleFonts.sourceCodePro(fontSize: 13),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(color: primaryText, size: 16),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: borderColor,
        thickness: 1,
        space: 1,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: surfaceBackground,
        selectedColor: accentColor.withValues(alpha: 0.3),
        labelStyle: GoogleFonts.sourceCodePro(fontSize: 12, color: primaryText),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: const BorderSide(color: borderColor),
        ),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: accentColor,
        linearTrackColor: surfaceBackground,
      ),
    );
  }
}
