import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isIntroAnimationCompleted = false,
    this.isMobileMenuOpen = false,
    this.scrollOffset = 0.0,
  });

  final bool isIntroAnimationCompleted;
  final bool isMobileMenuOpen;
  final double scrollOffset;

  HomeState copyWith({
    bool? isIntroAnimationCompleted,
    bool? isMobileMenuOpen,
    double? scrollOffset,
  }) {
    return HomeState(
      isIntroAnimationCompleted:
          isIntroAnimationCompleted ?? this.isIntroAnimationCompleted,
      isMobileMenuOpen: isMobileMenuOpen ?? this.isMobileMenuOpen,
      scrollOffset: scrollOffset ?? this.scrollOffset,
    );
  }

  @override
  List<Object?> get props => [
    isIntroAnimationCompleted,
    isMobileMenuOpen,
    scrollOffset,
  ];
}
