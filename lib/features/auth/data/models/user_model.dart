import 'package:spotify_clone/core/entities/user_entity.dart';
import 'package:spotify_clone/features/auth/domain/entities/auth_user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends AuthUserEntity {
  const UserModel({
    required super.core,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      core: UserEntity(
        id: json['id'] ?? '',
        fullName: json['full_name'] ?? '',
      ),
      email: json['email'] ?? '',
    );
  }

  factory UserModel.fromSupabaseUser(User user) {
    return UserModel(
      core: UserEntity(
        id: user.id,
        fullName: user.userMetadata?['full_name'] ?? 'Unknown',
      ),
      email: user.email ?? '',
    );
  }
}
