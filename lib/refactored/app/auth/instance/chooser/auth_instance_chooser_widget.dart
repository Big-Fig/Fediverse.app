import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/join/add_more/add_more_join_auth_instance_page.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("instance_chooser_widget.dart");

class AuthInstanceChooserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc =
        IAuthInstanceChooserBloc.of(context, listen: false);

    _logger.finest(() => "build");

    return InitialDataStreamBuilder<List<AuthInstance>>(
        stream: instanceChooserBloc.instancesAvailableToChooseStream,
        initialData: instanceChooserBloc.instancesAvailableToChoose,
        builder: (context, snapshot) {
          var instancesAvailableToChoose = snapshot.data;

          if (instancesAvailableToChoose == null) {
            return SizedBox.shrink();
          }
          _logger.finest(() => "build instancesAvailableToChoose "
              "${instancesAvailableToChoose.length}");
          var itemCount = instancesAvailableToChoose.length + 2;
          return ListView.builder(
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                var instance = instanceChooserBloc.selectedInstance;
                return buildCurrentInstanceRow(
                    context, instanceChooserBloc, instance);
              } else if (index == itemCount - 1) {
                return buildAddAccountRow(context);
              } else {
                index -= 1;
                var instance = instancesAvailableToChoose[index];
                return buildInstanceToChooseRow(
                    context, instanceChooserBloc, instance);
              }
            },
          );
        });
  }

  Widget buildAddAccountRow(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            goToAddMoreJoinAuthInstancePage(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.add),
              Text(AppLocalizations.of(context)
                  .tr("auth.instance.chooser.action.add_account")),
            ],
          ),
        ),
      );

  Widget buildInstanceToChooseRow(
          BuildContext context,
          IAuthInstanceChooserBloc instanceChooserBloc,
          AuthInstance instance) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
              onPressed: () {
                // todo: alert dialog
                instanceChooserBloc.removeInstance(instance);
              },
            ),
            Text(instance.userAtHost),
          ],
        ),
      );

  Widget buildCurrentInstanceRow(
          BuildContext context,
          IAuthInstanceChooserBloc instanceChooserBloc,
          AuthInstance instance) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    var authHostBloc = AuthHostBloc.createFromContext(context,
                        instanceBaseUrl: instance.url);
// todo: alert dialog
                    authHostBloc.logout();
                  },
                ),
                Text(instance.userAtHost),
              ],
            ),
            Icon(
              Icons.check_circle,
              color: Colors.blueAccent,
            )
          ],
        ),
      );
}
