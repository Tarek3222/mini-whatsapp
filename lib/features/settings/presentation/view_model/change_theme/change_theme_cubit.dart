import 'package:clone_chat/features/settings/presentation/view_model/change_theme/change_theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitialState());
  bool isDarkMode = false;

  late SharedPreferences storage;
  void changeTheme() {
    isDarkMode = !isDarkMode;
    storage.setBool('isDarkMode', isDarkMode);
    emit(ChangeThemeSuccessState());
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    isDarkMode = storage.getBool('isDarkMode') ?? false;
    emit(ChangeThemeSuccessState());
  }
}
