import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/details/instance_details_widget.dart';
import 'package:fedi/app/instance/details/remote/remote_instance_details_bloc_impl.dart';
import 'package:fedi/app/instance/details/remote/remote_instance_details_page_keys.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoteInstanceDetailsPage extends StatelessWidget {
  const RemoteInstanceDetailsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstanceHostAppBarWidget(),
      body: const SafeArea(
        child: InstanceDetailsWidget(
          key: Key(
            RemoteInstanceDetailsPageKeys.instanceDetailsWidgetKey,
          ),
        ),
      ),
    );
  }
}

MaterialPageRoute createRemoteInstanceDetailsPageRoute(Uri remoteInstanceUri) =>
    MaterialPageRoute(
      builder: (context) => RemoteInstanceBloc.provideToContext(
        context,
        instanceUri: remoteInstanceUri,
        child: RemoteInstanceDetailsBloc.provideToContext(
          context,
          child: const RemoteInstanceDetailsPage(),
        ),
      ),
    );

void goToRemoteInstanceDetailsPage(
  BuildContext context, {
  required Uri remoteInstanceUri,
}) {
  Navigator.push(
    context,
    createRemoteInstanceDetailsPageRoute(remoteInstanceUri),
  );
}
