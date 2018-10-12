import 'package:json_annotation/json_annotation.dart';

part 'package:tally_book/models/User.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
    bool isLogin;
    int id;
    String uname;
    int sex;
    String avatarUrl;

    User(
        this.isLogin,
        this.id,
        this.uname,
        this.sex,
        this.avatarUrl
    );

    // A necessary factory constructor for creating a new User instance
    // from a map. We pass the map to the generated _$UserFromJson constructor.
    // The constructor is named after the source class, in this case User.
    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    User.empty();
}