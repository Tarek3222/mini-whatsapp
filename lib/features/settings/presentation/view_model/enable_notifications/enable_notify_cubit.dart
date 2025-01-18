import 'package:clone_chat/core/utils/service_locator.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/features/settings/presentation/view_model/enable_notifications/enable_notify_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnableNotifyCubit extends Cubit<EnableNotifyState> {
  EnableNotifyCubit() : super(EnableNotifyInitialState());
  bool isEnabled = true;

  late SharedPreferences storage;
  void changeEnabledNotify(bool value) async {
    isEnabled = value;
    storage.setBool('isEnabled', isEnabled);
    await getIt.get<UserServices>().updateEnableNotification(isEnabled: value);
    emit(EnableNotifySuccessState());
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    isEnabled = storage.getBool('isEnabled') ?? true;
    emit(EnableNotifySuccessState());
  }
}
