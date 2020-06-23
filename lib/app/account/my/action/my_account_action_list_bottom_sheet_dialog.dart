import 'dart:core';

import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc_impl.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/material.dart';

void showMyAccountActionListBottomSheetDialog(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) => ClipRRect(
            borderRadius: FediSizes.defaultClipRRectBorderRadius,
            child: Container(
              color: Colors.white,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 4.0 * 3.0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: DisposableProvider<IAuthInstanceChooserBloc>(
                  create: (context) =>
                      AuthInstanceChooserBloc.createFromContext(context),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: const AuthInstanceChooserWidget(),
                  ),
                ),
              ),
            ),
          ));
}
