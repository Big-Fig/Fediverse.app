import '../../pleroma_api_model.dart';

abstract class IPleromaApiCustomEmoji implements IPleromaApiResponse {
  List<String>? get tags;

  String get imageUrl;

  String get name;
}
