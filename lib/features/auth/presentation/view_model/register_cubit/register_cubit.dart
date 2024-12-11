import 'package:clone_chat/features/auth/data/repos/my_repo.dart';
import 'package:clone_chat/features/auth/presentation/view_model/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.myRepo) : super(RegisterInitial());
  MyRepo myRepo;

  Future<void> registerUser(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(RegisterLoading());
    final result = await myRepo.registerUser(
        email: email, password: password, name: name, phone: phone);
    result.fold(
      (fail) => emit(
        RegisterFailure(
          fail.errorMessege,
        ),
      ),
      (userCred) => emit(
        RegisterSuccess(
          userCred,
        ),
      ),
    );
  }
}
