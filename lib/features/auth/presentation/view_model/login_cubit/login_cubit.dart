import 'package:clone_chat/features/auth/data/repos/my_repo.dart';
import 'package:clone_chat/features/auth/presentation/view_model/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.myRepo) : super(LoginInitial());
  MyRepo myRepo;

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    final result = await myRepo.loginUser(email: email, password: password);
    result.fold(
      (fail) => emit(
        LoginFailure(
          fail.errorMessege,
        ),
      ),
      (userCred) => emit(
        LoginSuccess(
          userCred,
        ),
      ),
    );
  }
}
