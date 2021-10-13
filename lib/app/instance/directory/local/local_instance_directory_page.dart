import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/directory/instance_directory_widget.dart';
import 'package:fedi/app/instance/directory/local/local_instance_directory_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalInstanceDirectoryPage extends StatelessWidget {
  const LocalInstanceDirectoryPage();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: InstanceHostAppBarWidget(),
        body: const SafeArea(
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
