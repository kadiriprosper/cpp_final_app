import 'package:cpp_final_app/enums/status_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';

const updateSuccess = {AuthStatusEnum.success: 'success'};
Map<AuthStatusEnum, String> updateFailed(String error) =>
    {AuthStatusEnum.failed: 'failed'};

class ProfileUpdate {
  ProfileUpdate({required this.firebaseAuth});
  FirebaseAuth firebaseAuth;

  Future<Map<AuthStatusEnum, String>> updateUsername(String newUsername) async {
    try {
      await firebaseAuth.currentUser?.updateDisplayName(newUsername);
    } on FirebaseAuthException catch (_) {
      return updateFailed('Error Updating Display Name');
    }
    return updateSuccess;
  }

    Future<Map<AuthStatusEnum, String>> updateUserImage(String photoUrl) async {
    try {
      await firebaseAuth.currentUser?.updatePhotoURL(photoUrl);
    } on FirebaseAuthException catch (_) {
      return updateFailed('Error updating user profile picture');
    }
    return updateSuccess;
  }
}
