import 'dart:core';

import 'package:fedi/refactored/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/chooser/auth_instance_chooser_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/chooser/auth_instance_chooser_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/material.dart';

showMyAccountActionListBottomSheetDialog(BuildContext context) {
  showModalBottomSheet(
      builder: (BuildContext context) => BottomSheet(
            onClosing: () {},
            builder: (BuildContext context) {
              return Container(
                height: 300,
                child: DisposableProvider<IAuthInstanceChooserBloc>(
                    create: (context) =>
                        AuthInstanceChooserBloc.createFromContext(context),
                    child: AuthInstanceChooserWidget()),
              );
            },
          ),
      context: context);
}
