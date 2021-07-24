import 'package:fedi/app/instance/directory/account_list/instance_directory_account_list_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstanceDirectoryWidget extends StatelessWidget {
  const InstanceDirectoryWidget();

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.horizontalBigPadding,
        child: const InstanceDirectoryAccountListWidget(),
      );
}
