part of 'package:tally_book/models/User.dart';

User _$UserFromJson(Map<String, dynamic> json) => new User(
    json['isLogin'] as bool,
    json['id'] as int,
    json['uname'] as String,
    json['sex'] as int,
    json['avatarUrl'] as String
);

abstract class _$UserSerializerMixin {
    bool get isLogin;
    int get id;
    String get uname;
    int get sex;
    String get avatarUrl;
    Map<String, dynamic> toJson() => <String, dynamic>{
        'isLogin': isLogin,
        'id': id,
        'uname': uname,
        'sex': sex,
        'avatarUrl': avatarUrl
    };
}