import 'dart:core';

import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc_impl.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_widget.dart';
import 'package:fedi/app/ui/model_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/material.dart';

void showMyAccountActionListBottomSheetDialog(BuildContext context) {
  showFediModalBottomSheetDialog(
      context: context,
      child: DisposableProvider<IAuthInstanceChooserBloc>(
        create: (context) => AuthInstanceChooserBloc.createFromContext(context),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const AuthInstanceChooserWidget(),
        ),
      ));
}
