import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/features/auth/data/repos/my_repo.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:clone_chat/features/home/data/services/messeges_services.dart';
import 'package:clone_chat/features/home/data/services/notifications_services.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<AuthServices>(AuthServices());
  getIt.registerSingleton<MessegesServices>(MessegesServices());
  getIt.registerSingletonAsync(
      () async => await SharedPreferences.getInstance());
  getIt.registerSingleton<UserServices>(UserServices());
  getIt.registerSingleton<NotificationsServices>(NotificationsServices());
  getIt.registerSingleton<MyRepo>(
    MyRepo(
      authServices: getIt<AuthServices>(),
    ),
  );
}
