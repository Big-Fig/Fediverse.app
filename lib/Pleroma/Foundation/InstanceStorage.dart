import 'dart:core';
import 'package:phaze/Pleroma/Models/ClientSettings.dart';

import './Client.dart';
import '../Models/Account.dart';
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
  Account currentAccount;
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
     Account acc = await box.get("$account-account");
     AccountAuth auth = await box.get("$account-auth");
     Client client = await box.get("$account-client");
     ClientSettings settings = await box.get("$account-clientSettings");
     client.clientSettings = settings;
     InstanceStorage data = InstanceStorage(currentAuth: auth, currentClient: client, currentAccount: acc, account: account);
     return data;
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

  Future<void> clearAll() async {
     var box = await Hive.openBox('InstanceStorage');
     await box.clear();
  }

}