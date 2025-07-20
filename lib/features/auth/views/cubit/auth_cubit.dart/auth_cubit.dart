import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/data/models/user_model.dart';
import 'package:restaurant/features/auth/data/repos/auth_repo.dart';
import 'package:restaurant/features/auth/views/cubit/auth_cubit.dart/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  Future<void> register({required UserModel userModel}) async {
    emit(AuthLoading());
    var result = await authRepo.userRegister(userModel: userModel);
    result.fold(
      (right) => emit(RegisterSuccess()),
      (left) => emit(AuthError(left.errorMessage)),
    );
  }

  Future<void> verifyEmail({required String email, required String otp}) async {
    emit(AuthLoading());
    var result = await authRepo.verifyEmail(email: email, otp: otp);
    result.fold(
      (right) => emit(VerifyEmailSuccess()),
      (left) => emit(AuthError(left.errorMessage)),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    var result = await authRepo.userLogin(email: email, password: password);
    result.fold(
      (right) => emit(LoginSuccess(right)),
      (left) => emit(AuthError(left.errorMessage)),
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());

    try {
      // 1️⃣ First, call the API logout endpoint
      final result = await authRepo
          .logout(); // Assume authRepo has a logout method

      result.fold(
        (success) async {
          // 2️⃣ Clear local storage only after API succeeds
          // await SecureCacheHelper.clearData();
          emit(LogoutSuccess());
        },
        (error) => emit(AuthError("Error")), // Handle API failure
      );
    } catch (e) {
      emit(AuthError('Failed to logout: ${e.toString()}'));
    }
  }
}

// class SecureCacheHelper {
//   static Future<void> clearData() async {
//     final storage = FlutterSecureStorage();
//     await storage.deleteAll(); // ✅ Clears all keys
//   }
// }
