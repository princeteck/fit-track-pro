part of 'bottom_navbar_cubit.dart';

@freezed
class BottomNavbarState with _$BottomNavbarState {
  const factory BottomNavbarState({
    @Default(0) int selectedIndex,
    @Default(true) bool isVisible,
    @Default(false) bool isScrollingDown,
  }) = _BottomNavbarState;
}
