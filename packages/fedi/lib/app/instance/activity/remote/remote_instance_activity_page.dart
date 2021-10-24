import 'package:fedi/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi/app/instance/activity/instance_activity_widget.dart';
import 'package:fedi/app/instance/activity/remote/remote_instance_activity_bloc_impl.dart';
import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoteInstanceActivityPage extends StatelessWidget {
  const RemoteInstanceActivityPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: InstanceHostAppBarWidget(),
        body: SafeArea(
          child: InstanceActivityWidget(),
        ),
      );
}

MaterialPageRoute<void> createRemoteInstanceActivityPageRoute({
  required IRemoteInstanceBloc remoteInstanceBloc,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => Provider.value(
        value: remoteInstanceBloc,
        child: RemoteInstanceActivityBloc.provideToContext(
          context,
          child: const RemoteInstanceActivityPage(),
        ),
      ),
    );

Future<void> goToRemoteInstanceActivityPage(
  BuildContext context, {
  required Uri remoteInstanceUri,
}) async {
  var dialogResult = await UnifediAsyncOperationHelper
      .performUnifediAsyncOperation<IRemoteInstanceBloc>(
    context: context,
    asyncCode: () async {
      var remoteInstanceBloc = RemoteInstanceBloc.createFromContext(
        context,
        instanceUri: remoteInstanceUri,
      );

      await remoteInstanceBloc.performAsyncInit();

      return remoteInstanceBloc;
    },
  );

  var remoteInstanceBloc = dialogResult.result;
  if (remoteInstanceBloc != null) {
    await Navigator.push(
      context,
      createRemoteInstanceActivityPageRoute(
        remoteInstanceBloc: remoteInstanceBloc,
      ),
    );
  }
}
