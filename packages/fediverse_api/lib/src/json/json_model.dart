typedef JsonParser<T extends IJsonObj?> = T Function(Map<String, dynamic> json);

// ignore: one_member_abstracts
abstract class IJsonObj {
  Map<String, dynamic> toJson();
}
