import 'package:fedi_app/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi_app/app/instance/directory/instance_directory_widget.dart';
import 'package:fedi_app/app/instance/directory/local/local_instance_directory_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalInstanceDirectoryPage extends StatelessWidget {
  const LocalInstanceDirectoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: InstanceHostAppBarWidget(),
        body: SafeArea(
          child: InstanceDirectoryWidget(),
        ),
      );
}

MaterialPageRoute<void> createLocalInstanceDirectoryPageRoute() =>
    MaterialPageRoute<void>(
      builder: (context) => LocalInstanceDirectoryBloc.provideToContext(
        context,
        child: const LocalInstanceDirectoryPage(),
      ),
    );

void goToLocalInstanceDirectoryPage(BuildContext context) {
  Navigator.push(
    context,
    createLocalInstanceDirectoryPageRoute(),
  );
}
