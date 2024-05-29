part of 'set_theme_cubit.dart';

abstract class SetThemeState {
  const SetThemeState();
}

final class InitialSetTheme extends SetThemeState {}

final class LightThemeState extends SetThemeState {}

final class DarkThemeState extends SetThemeState {}

final class FailureSelectedThemeState extends SetThemeState {
  Failure errorMsg;
  FailureSelectedThemeState(this.errorMsg);
}
