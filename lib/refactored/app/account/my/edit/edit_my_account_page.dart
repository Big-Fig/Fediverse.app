import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/refactored/app/account/my/edit/edit_my_account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/my/edit/edit_my_account_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';

class EditMyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var editMyAccountBloc = IEditMyAccountBloc.of(context, listen: false);
    return WillPopScope(
      // override back button
      onWillPop: () async {
        handleBackPressed(context, editMyAccountBloc);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              handleBackPressed(context, editMyAccountBloc);
            },
          ),
          title: Row(children: <Widget>[
            Text(AppLocalizations.of(context).tr("profile.edit.title"))
          ]),
          actions: <Widget>[
            InitialDataStreamBuilder<bool>(
                stream: editMyAccountBloc.isSomethingChangedStream,
                initialData: editMyAccountBloc.isSomethingChanged,
                builder: (context, snapshot) {
                  var isSomethingChanged = snapshot.data;
                  var onPressed;

                  if (isSomethingChanged) {
                    onPressed = ()  async {
                      // todo: progress dialog
                      var success = await editMyAccountBloc.submitChanges();

                      if(success) {
                        Navigator.pop(context);
                      } else {
                        showAlert(context: null, title: "error");
                      }
                    };
                  }
                  return FlatButton(
                    child: Text(
                      AppLocalizations.of(context)
                          .tr("profile.edit.action.save"),
                      style: TextStyle(
                          color:
                              isSomethingChanged ? Colors.white : Colors
                                  .white70),
                    ),
                    onPressed: onPressed,
                  );
                }),
          ],
        ),
        body: EditMyAccountWidget(),
      ),
    );
  }

  void handleBackPressed(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    if (editMyAccountBloc.isSomethingChanged) {
      alertUnsaved(context);
    } else {
      Navigator.pop(context);
    }
  }

  alertUnsaved(BuildContext context) {
    // todo localization
    showAlert(
      context: context, title: "You have unsaved changed", //      body: "",
      actions: [
        AlertAction(
          text: "Discard & Exit",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      cancelable: true,
    );
  }
}

void goToEditMyAccountPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IEditMyAccountBloc>(
            create: (context) => EditMyAccountBloc.createFromContext(context),
            child: EditMyAccountPage())),
  );
}
