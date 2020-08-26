import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/custom_list/custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class CustomListBloc extends DisposableOwner implements ICustomListBloc {
  @override
  final ICustomList customList;


  CustomListBloc({@required this.customList});

  @override
  Future addAccounts({List<IAccount> accounts}) {
    // TODO: implement addAccounts
    throw UnimplementedError();
  }

  @override
  // TODO: implement customListStream
  Stream<ICustomList> get customListStream => throw UnimplementedError();

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future edit({String title}) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future removeAccounts({List<IAccount> accounts}) {
    // TODO: implement removeAccounts
    throw UnimplementedError();
  }

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();

  @override
  // TODO: implement titleStream
  Stream<String> get titleStream => throw UnimplementedError();

}