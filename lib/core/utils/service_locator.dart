import 'package:clone_chat/core/utils/chat_user_services.dart';
import 'package:clone_chat/core/utils/user_services.dart';
import 'package:clone_chat/features/auth/data/repos/my_repo.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<AuthServices>(AuthServices());
  getIt.registerSingleton<UserServices>(UserServices());
  getIt.registerSingleton<ChatUserServices>(ChatUserServices());
  getIt.registerSingleton<MyRepo>(
    MyRepo(
      authServices: getIt<AuthServices>(),
    ),
  );
}
