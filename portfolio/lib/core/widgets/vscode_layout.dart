import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'activity_bar.dart';
import 'sidebar.dart';
import 'tab_bar.dart';
import 'status_bar.dart';
import 'title_bar.dart';

class VSCodeLayout extends StatefulWidget {
  final Widget child;
  final String currentRoute;

  const VSCodeLayout({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  State<VSCodeLayout> createState() => _VSCodeLayoutState();
}

class _VSCodeLayoutState extends State<VSCodeLayout> {
  bool _isSidebarVisible = true;
  String _selectedActivity = 'explorer';

  void _toggleSidebar() {
    setState(() {
      _isSidebarVisible = !_isSidebarVisible;
    });
  }

  void _selectActivity(String activity) {
    setState(() {
      _selectedActivity = activity;
      if (!_isSidebarVisible) {
        _isSidebarVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Title Bar
          VSCodeTitleBar(
            onToggleSidebar: _toggleSidebar,
            currentRoute: widget.currentRoute,
          ),

          // Main Content Area
          Expanded(
            child: Row(
              children: [
                // Activity Bar
                VSCodeActivityBar(
                  selectedActivity: _selectedActivity,
                  onActivitySelected: _selectActivity,
                ),

                // Sidebar
                if (_isSidebarVisible)
                  VSCodeSidebar(
                    selectedActivity: _selectedActivity,
                    currentRoute: widget.currentRoute,
                  ),

                // Editor Area
                Expanded(
                  child: Column(
                    children: [
                      // Tab Bar
                      VSCodeTabBar(currentRoute: widget.currentRoute),

                      // Editor Content
                      Expanded(
                        child: Container(
                          color: AppTheme.primaryBackground,
                          child: widget.child,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Status Bar
          const VSCodeStatusBar(),
        ],
      ),
    );
  }
}
