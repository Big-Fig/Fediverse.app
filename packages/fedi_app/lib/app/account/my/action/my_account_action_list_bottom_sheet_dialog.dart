import 'dart:core';

import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/chooser/access_chooser_bloc.dart';
import 'package:fedi_app/app/access/chooser/access_chooser_bloc_impl.dart';
import 'package:fedi_app/app/access/chooser/access_chooser_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

Future<void> showMyAccountActionListBottomSheetDialog(BuildContext context) =>
    showFediModalBottomSheetDialog<void>(
      context: context,
      child: DisposableProvider<IAccessChooserBloc>(
        create: AccessChooserBloc.createFromContext,
        child: const Padding(
          padding: FediPadding.allBigPadding,
          child: AccessChooserWidget(),
        ),
      ),
    );
