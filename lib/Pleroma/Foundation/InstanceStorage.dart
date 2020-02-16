import 'dart:core';
import 'package:fedi/Pleroma/Models/ClientSettings.dart';

import './Client.dart';
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import '../Models/AccountAuth.dart';
import 'package:hive/hive.dart';

class InstanceStorage {

  InstanceStorage._privateConstructor();

  static final InstanceStorage _instance = InstanceStorage._privateConstructor();
  static InstanceStorage get instance { return _instance;}

  InstanceStorage({
        this.account,
        this.currentClient,
        this.currentAccount,
        this.currentAuth,
    });

  String account;
  Client currentClient;
  PleromaAccount currentAccount;
  AccountAuth currentAuth;

  
  static Future<void> setCurrentAccount(String account) async {
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    await box.put("currentAccount", account);
  }

  static Future<String> getCurrentAccount() async {
    var box = await  Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    String account = await box.get("currentAccount");
    return account;
  }

  static Future<void> addAccountAlert(String account, String type) async {
    print("PUTTING ALERT");
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    await box.put("$account-$type", 1);
    return print("done");
  }

  static Future<void> addAccountSubscribedToNotifications(String account, bool subscribed) async {
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    await box.put("$account-notifications-subscribed", true);
    return print("done");
  }

  static Future<bool> getAccountSubscribedToNotifications(String account) async {
     var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
     bool status = await box.get("$account-notifications-subscribed");
     if (status == null){
       return false;
     }
    return status;
  }

  static Future<int> getAccountAlert(String account, String type) async {
     var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
     int alerts = await box.get("$account-$type");
     if (alerts == null){
       return 0;
     }
    return alerts;
  }

   static Future<void> clearAccountAlert(String account, String type) async {
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    await box.put("$account-$type", 0);
    return print("done");
  }





  static Future<void> removeInstanceData(InstanceStorage instance) async {

    print("REMOVING INSTANCE DATA");
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    String account = await box.get("currentAccount");
    if (account == instance.account){
      box.put("currentAccount", null);
    }
    await InstanceStorage.removeAccountFromInstanceList(instance.account);
    await box.delete("${instance.account}-account");
    await box.delete("${instance.account}-auth");
    await box.delete("${instance.account}-client");
    await box.delete("${instance.account}-clientSettings");

    
  }

  Future<void> saveInstanceData(InstanceStorage instance) async {

    print("SAVING INSTANCE DATA");
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    await box.put("${instance.account}-account", instance.currentAccount);
    await box.put("${instance.account}-auth", instance.currentAuth);
    await box.put("${instance.account}-client", instance.currentClient);
    await box.put("${instance.account}-clientSettings", instance.currentClient.clientSettings);
    await addAccountToInstanceList(instance.account);
  }

  
  
  static Future<InstanceStorage> getInstanceStorageByAccount(String account) async {
     var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
     PleromaAccount acc = await box.get("$account-account");
     AccountAuth auth = await box.get("$account-auth");
     Client client = await box.get("$account-client");
     ClientSettings settings = await box.get("$account-clientSettings");
     client.clientSettings = settings;
     InstanceStorage data = InstanceStorage(currentAuth: auth, currentClient: client, currentAccount: acc, account: account);
     return data;
  }

    static Future<void> updateAccount(String account, PleromaAccount acc) async {
       var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
        await box.put("$account-account", acc);
    }


  static Future<void> saveNewInstanceClient(Client client) async {

    print("SAVING NEW INSTANCE DATA");
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    await box.put("new-client", client);
    await box.put("new-clientSettings", client.clientSettings);
    
  }
  
  static Future<Client> getNewInstanceClient() async {
     var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
     Client client = await box.get("new-client");
     ClientSettings settings = await box.get("new-clientSettings");
     client.clientSettings = settings;
     return client;
  }

  Future<void> clearAllNewInstance() async {
     var box = await Hive.openBox('NewInstanceStorage');
     await box.clear();
  }


  Future<void> addAccountToInstanceList(String account) async {
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    List<String> stringList = await box.get("InstanceList");
    if (stringList == null){
      stringList = <String>[];
    }
    stringList.add(account);
    await box.put("InstanceList", stringList);
  }

  static Future<void> removeAccountFromInstanceList(String account) async {
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    List<String> stringList = await box.get("InstanceList");
    if (stringList == null){
      stringList = <String>[];
    }
    stringList.remove(account);
    print("AFTER LIST");
    for(int i = 0; i < stringList.length; i++){
      print("${stringList[i]}");
    }
    await box.put("InstanceList", stringList);
    
  }

  static Future<List<InstanceStorage>> getInstanceList() async {
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    List<String> stringList = await box.get("InstanceList");
    List<InstanceStorage> instanceStorage = <InstanceStorage>[];
    for(var i = 0; i < stringList.length; i++ ){
      print("getting instance ${stringList[i]}");
      var instance = await getInstanceStorageByAccount(stringList[i]);
      instanceStorage.add(instance);
    }
    print("My Length");
    print(instanceStorage.length);
    return instanceStorage;
  }

  static Future<InstanceStorage> getNextInstance() async {
    var box = await Hive.openBox('InstanceStorage', lazy: true) as LazyBox;
    List<String> stringList = await box.get("InstanceList");
    List<InstanceStorage> instanceStorage = <InstanceStorage>[];
    for(var i = 0; i < stringList.length; i++ ){
      print("getting instance ${stringList[i]}");
      var instance = await getInstanceStorageByAccount(stringList[i]);
      instanceStorage.add(instance);
    }
    if (instanceStorage.length > 0){
       InstanceStorage.setCurrentAccount( instanceStorage.first.account );
      return instanceStorage.first;
    } else {
      return null;
    }
    
  }

  Future<void> clearAll() async {
     var box = await Hive.openBox('InstanceStorage');
     await box.clear();
  }

}