import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi_app/app/instance/directory/instance_directory_widget.dart';
import 'package:fedi_app/app/instance/directory/remote/remote_instance_directory_bloc_impl.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc_impl.dart';
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
      createRemoteInstanceDirectoryPageRoute(
        remoteInstanceBloc: remoteInstanceBloc,
      ),
    );
  }
}
