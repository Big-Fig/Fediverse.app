import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/directory/instance_directory_widget.dart';
import 'package:fedi/app/instance/directory/remote/remote_instance_directory_bloc_impl.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoteInstanceDirectoryPage extends StatelessWidget {
  const RemoteInstanceDirectoryPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstanceHostAppBarWidget(),
      body: const SafeArea(
        child: InstanceDirectoryWidget(),
      ),
    );
  }
}

MaterialPageRoute createRemoteInstanceDirectoryPageRoute(Uri remoteInstanceUri) =>
    MaterialPageRoute(
      builder: (context) => RemoteInstanceBloc.provideToContext(
        context,
        instanceUri: remoteInstanceUri,
        child: RemoteInstanceDirectoryBloc.provideToContext(
          context,
          child: const RemoteInstanceDirectoryPage(),
        ),
      ),
    );

void goToRemoteInstanceDirectoryPage(
  BuildContext context, {
  required Uri remoteInstanceUri,
}) {
  Navigator.push(
    context,
    createRemoteInstanceDirectoryPageRoute(remoteInstanceUri),
  );
}
