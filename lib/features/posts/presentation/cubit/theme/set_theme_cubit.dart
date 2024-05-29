import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_clean/core/app_enums.dart';
import 'package:posts_app_clean/core/app_failures.dart';
import 'package:posts_app_clean/core/app_strings.dart';
import 'package:posts_app_clean/core/di.dart';
import 'package:posts_app_clean/features/posts/domain/usecases/set_theme_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'set_theme_state.dart';

class SetThemeCubit extends Cubit<SetThemeState> {
  SetThemeCubit(this.setThemeUseCase) : super(InitialSetTheme());

  final SetThemeUseCase setThemeUseCase;

  void setTheme(ThemeDeviceState deviceTheme) {
    var themeSelect = setThemeUseCase.call(deviceTheme);

    themeSelect.fold(
      (failSetTheme) => emit(FailureSelectedThemeState(failSetTheme)),
      (setTheme) => setTheme == ThemeDeviceState.lightTheme
          ? emit(LightThemeState())
          : emit(DarkThemeState()),
    );
  }

  void getTheme() {
    var themeKey = di<SharedPreferences>().getString(AppStrings.initTheme);

    switch (themeKey) {
      case AppStrings.darkTheme:
        emit(DarkThemeState());

      default:
        emit(LightThemeState());
    }
  }
}
