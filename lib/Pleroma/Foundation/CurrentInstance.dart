import './Client.dart';
import '../Models/Account.dart';
import '../Models/AccountAuth.dart';

class CurrentInstance {
  CurrentInstance._privateConstructor();

  static final CurrentInstance _instance =
      CurrentInstance._privateConstructor();
  static CurrentInstance get instance {
    return _instance;
  }

  static final CurrentInstance _newInstance =
      CurrentInstance._privateConstructor();
  static CurrentInstance get newInstance {
    return _newInstance;
  }

  Client currentClient;
  Account currentAccount;
  AccountAuth currentAuth;

  setInstanceFromNewInstance() {
    CurrentInstance.instance.currentClient =
        CurrentInstance.newInstance.currentClient;
    CurrentInstance.instance.currentAccount =
        CurrentInstance.newInstance.currentAccount;
    CurrentInstance.instance.currentAuth =
        CurrentInstance.newInstance.currentAuth;
  }
}
