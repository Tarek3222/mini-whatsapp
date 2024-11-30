import 'package:clone_chat/features/auth/data/repos/my_repo.dart';
import 'package:clone_chat/features/auth/data/services/auth_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<AuthServices>(AuthServices());
  getIt.registerSingleton<MyRepo>(
    MyRepo(
      authServices: getIt<AuthServices>(),
    ),
  );
}
