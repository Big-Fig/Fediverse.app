import 'package:unifedi_api/unifedi_api.dart';

class DisabledRegistrationAuthHostException implements Exception {
  const DisabledRegistrationAuthHostException();
}

class InvitesOnlyRegistrationAuthHostException implements Exception {
  const InvitesOnlyRegistrationAuthHostException();
}

class EmailConfirmationRequiredAuthHostException implements Exception {
  const EmailConfirmationRequiredAuthHostException();
}

class CantRetrieveAppTokenAuthHostException implements Exception {
  const CantRetrieveAppTokenAuthHostException();
}

class CantRegisterAppAuthHostException implements Exception {
  const CantRegisterAppAuthHostException();
}

class AuthHostRegistrationResult {
  final DisabledRegistrationAuthHostException?
      disabledRegistrationAuthHostException;
  final InvitesOnlyRegistrationAuthHostException?
      invitesOnlyRegistrationAuthHostException;
  final EmailConfirmationRequiredAuthHostException?
      emailConfirmationRequiredAuthHostException;
  final CantRetrieveAppTokenAuthHostException?
      cantRetrieveAppTokenAuthHostException;
  final CantRegisterAppAuthHostException? cantRegisterAppAuthHostException;
  final dynamic unknownHostException;
  final UnifediApiOAuthToken? token;
  final IUnifediApiInstance unifediApiInstance;
  final UnifediApiAccess? authInstance;

  AuthHostRegistrationResult({
    required this.disabledRegistrationAuthHostException,
    required this.invitesOnlyRegistrationAuthHostException,
    required this.emailConfirmationRequiredAuthHostException,
    required this.cantRetrieveAppTokenAuthHostException,
    required this.cantRegisterAppAuthHostException,
    required this.unknownHostException,
    required this.token,
    required this.unifediApiInstance,
    required this.authInstance,
  });

  AuthHostRegistrationResult.noErrors({
    required UnifediApiOAuthToken? token,
    required IUnifediApiInstance unifediApiInstance,
    required UnifediApiAccess? authInstance,
  }) : this(
          token: token,
          unifediApiInstance: unifediApiInstance,
          authInstance: authInstance,
          disabledRegistrationAuthHostException: null,
          invitesOnlyRegistrationAuthHostException: null,
          emailConfirmationRequiredAuthHostException: null,
          cantRetrieveAppTokenAuthHostException: null,
          cantRegisterAppAuthHostException: null,
          unknownHostException: null,
        );

  dynamic get anyError =>
      disabledRegistrationAuthHostException ??
      invitesOnlyRegistrationAuthHostException ??
      emailConfirmationRequiredAuthHostException ??
      cantRetrieveAppTokenAuthHostException ??
      cantRegisterAppAuthHostException ??
      unknownHostException;

  bool get approvalRequired => unifediApiInstance.approvalRequired == true;

  bool get isHaveNoErrors =>
      disabledRegistrationAuthHostException == null &&
      invitesOnlyRegistrationAuthHostException == null &&
      emailConfirmationRequiredAuthHostException == null &&
      cantRetrieveAppTokenAuthHostException == null &&
      cantRegisterAppAuthHostException == null &&
      unknownHostException == null;

  bool get isUnifediApiAccessExist => authInstance != null;

  bool get isPossibleToLogin =>
      isUnifediApiAccessExist &&
      !approvalRequired &&
      !emailConfirmationRequired &&
      isHaveNoErrors;

  bool get emailConfirmationRequired =>
      emailConfirmationRequiredAuthHostException != null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthHostRegistrationResult &&
          runtimeType == other.runtimeType &&
          disabledRegistrationAuthHostException ==
              other.disabledRegistrationAuthHostException &&
          invitesOnlyRegistrationAuthHostException ==
              other.invitesOnlyRegistrationAuthHostException &&
          emailConfirmationRequiredAuthHostException ==
              other.emailConfirmationRequiredAuthHostException &&
          cantRetrieveAppTokenAuthHostException ==
              other.cantRetrieveAppTokenAuthHostException &&
          cantRegisterAppAuthHostException ==
              other.cantRegisterAppAuthHostException &&
          unknownHostException == other.unknownHostException &&
          token == other.token &&
          unifediApiInstance == other.unifediApiInstance &&
          authInstance == other.authInstance;

  @override
  int get hashCode =>
      disabledRegistrationAuthHostException.hashCode ^
      invitesOnlyRegistrationAuthHostException.hashCode ^
      emailConfirmationRequiredAuthHostException.hashCode ^
      cantRetrieveAppTokenAuthHostException.hashCode ^
      cantRegisterAppAuthHostException.hashCode ^
      unknownHostException.hashCode ^
      token.hashCode ^
      unifediApiInstance.hashCode ^
      authInstance.hashCode;

  @override
  String toString() => 'AuthHostRegistrationResult{'
      'disabledRegistrationAuthHostException: '
      '$disabledRegistrationAuthHostException, '
      'invitesOnlyRegistrationAuthHostException: '
      '$invitesOnlyRegistrationAuthHostException, '
      'emailConfirmationRequiredAuthHostException: '
      '$emailConfirmationRequiredAuthHostException, '
      'cantRetrieveAppTokenAuthHostException: '
      '$cantRetrieveAppTokenAuthHostException, '
      'cantRegisterAppAuthHostException: '
      '$cantRegisterAppAuthHostException, '
      'unknownHostException: $unknownHostException, '
      'token: $token, '
      'unifediApiInstance: $unifediApiInstance, '
      'authInstance: $authInstance'
      '}';
}
