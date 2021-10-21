import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/directory/instance_directory_widget.dart';
import 'package:fedi/app/instance/directory/remote/remote_instance_directory_bloc_impl.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoteInstanceDirectoryPage extends StatelessWidget {
  const RemoteInstanceDirectoryPage({
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

MaterialPageRoute<void> createRemoteInstanceDirectoryPageRoute({
  required IRemoteInstanceBloc remoteInstanceBloc,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => Provider.value(
        value: remoteInstanceBloc,
        child: RemoteInstanceDirectoryBloc.provideToContext(
          context,
          child: const RemoteInstanceDirectoryPage(),
        ),
      ),
    );

Future<void> goToRemoteInstanceDirectoryPage(
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
      createRemoteInstanceDirectoryPageRoute(
        remoteInstanceBloc: remoteInstanceBloc,
      ),
    );
  }
}
