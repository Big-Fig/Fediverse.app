import 'package:unifedi_api/unifedi_api.dart';

class RegisterResponse {
  final IUnifediApiAccess? access;
  final IUnifediApiRegisterAccountResponse response;
  final IUnifediApiMyAccount? myAccount;

  RegisterResponse({
    required this.access,
    required this.response,
    required this.myAccount,
  });

  @override
  String toString() {
    return 'RegisterResponse{'
        'access: $access, '
        'response: $response, '
        'myAccount: $myAccount'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterResponse &&
          runtimeType == other.runtimeType &&
          access == other.access &&
          response == other.response &&
          myAccount == other.myAccount;

  @override
  int get hashCode => access.hashCode ^ response.hashCode ^ myAccount.hashCode;
}
