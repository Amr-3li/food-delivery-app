import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/customer_profile_model.dart';

abstract class MenuRepo {
  Future<Either<String, UserModel>> getCustomerProfile();
  Future<Either<String, String>> editCustomerProfile({
    required XFile? profileImage,
    required String? name,
    required String? email,
    required String? phone,
    required String? bio,
  });
}
