class Data {
  final String code;
  final String message;
  final List<User> result;

  Data(this.code, this.message, this.result);

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    List<dynamic> temp = parsedJson["result"];
    List<User> result = temp.map((v) => User.fromJson(v)).toList();

    return new Data(
      parsedJson["code"],
      parsedJson["message"],
      result,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
        'result': result,
      };
}

class User {
  final String name;
  final String age;
  final String url;

  User(this.name, this.age, this.url);

  User.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        age = json["age"],
        url = json["url"];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'age': age,
        'url': url,
      };
}
