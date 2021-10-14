import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi/app/instance/trends/instance_trends_widget.dart';
import 'package:fedi/app/instance/trends/remote/remote_instance_trends_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoteInstanceTrendsPage extends StatelessWidget {
  const RemoteInstanceTrendsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: InstanceHostAppBarWidget(),
        body: SafeArea(
          child: InstanceTrendsWidget(),
        ),
      );
}

MaterialPageRoute<void> createRemoteInstanceTrendsPageRoute({
  required IRemoteInstanceBloc remoteInstanceBloc,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => Provider.value(
        value: remoteInstanceBloc,
        child: RemoteInstanceTrendsBloc.provideToContext(
          context,
          child: const RemoteInstanceTrendsPage(),
        ),
      ),
    );

Future goToRemoteInstanceTrendsPage(
  BuildContext context, {
  required Uri remoteInstanceUri,
}) async {
  var dialogResult = await PleromaAsyncOperationHelper
      .performPleromaAsyncOperation<IRemoteInstanceBloc>(
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
      createRemoteInstanceTrendsPageRoute(
        remoteInstanceBloc: remoteInstanceBloc,
      ),
    );
  }
}
