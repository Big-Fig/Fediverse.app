import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/trends/instance_trends_widget.dart';
import 'package:fedi/app/instance/trends/remote/remote_instance_trends_bloc_impl.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoteInstanceTrendsPage extends StatelessWidget {
  const RemoteInstanceTrendsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstanceHostAppBarWidget(),
      body: const SafeArea(
        child: InstanceTrendsWidget(),
      ),
    );
  }
}

MaterialPageRoute createRemoteInstanceTrendsPageRoute(Uri remoteInstanceUri) =>
    MaterialPageRoute(
      builder: (context) => RemoteInstanceBloc.provideToContext(
        context,
        instanceUri: remoteInstanceUri,
        child: RemoteInstanceTrendsBloc.provideToContext(
          context,
          child: const RemoteInstanceTrendsPage(),
        ),
      ),
    );

void goToRemoteInstanceTrendsPage(
  BuildContext context, {
  required Uri remoteInstanceUri,
}) {
  Navigator.push(
    context,
    createRemoteInstanceTrendsPageRoute(remoteInstanceUri),
  );
}
