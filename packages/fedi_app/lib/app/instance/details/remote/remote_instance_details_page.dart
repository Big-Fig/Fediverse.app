import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi_app/app/instance/details/instance_details_widget.dart';
import 'package:fedi_app/app/instance/details/remote/remote_instance_details_bloc_impl.dart';
import 'package:fedi_app/app/instance/details/remote/remote_instance_details_page_keys.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoteInstanceDetailsPage extends StatelessWidget {
  const RemoteInstanceDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: InstanceHostAppBarWidget(),
        body: SafeArea(
          child: InstanceDetailsWidget(
            key: Key(
              RemoteInstanceDetailsPageKeys.instanceDetailsWidgetKey,
            ),
          ),
        ),
      );
}

MaterialPageRoute<void> createRemoteInstanceDetailsPageRoute({
  required IRemoteInstanceBloc remoteInstanceBloc,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => Provider.value(
        value: remoteInstanceBloc,
        child: RemoteInstanceDetailsBloc.provideToContext(
          context,
          child: const RemoteInstanceDetailsPage(),
        ),
      ),
    );

Future<void> goToRemoteInstanceDetailsPage(
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
      createRemoteInstanceDetailsPageRoute(
        remoteInstanceBloc: remoteInstanceBloc,
      ),
    );
  }
}
