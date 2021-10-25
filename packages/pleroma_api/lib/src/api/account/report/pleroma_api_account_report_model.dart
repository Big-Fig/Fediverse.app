import '../../pleroma_api_model.dart';
import '../../status/pleroma_api_status_model.dart';
import '../pleroma_api_account_model.dart';

abstract class IPleromaApiAccountReport implements IPleromaApiResponse {
  List<IPleromaApiStatus>? get statuses;

  IPleromaApiAccount? get account;

  IPleromaApiAccount? get user;
}
