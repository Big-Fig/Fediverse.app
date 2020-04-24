import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/refactored/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/refactored/app/status/favourite/status_favourite_account_list_page.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusFavouriteActionWidget extends StatelessWidget {
  final bool displayCounter;

  StatusFavouriteActionWidget({this.displayCounter = true});

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);
    return Row(
      children: <Widget>[
        StreamBuilder<bool>(
            stream: statusBloc.favouritedStream,
            initialData: statusBloc.favourited,
            builder: (context, snapshot) {
              var favourited = snapshot.data;
              return PleromaAsyncOperationButtonBuilderWidget(
                  showProgressDialog: false,
                  builder: (context, onPressed) => IconButton(
                        color: favourited ? Colors.blue : Colors.black,
                        icon: Icon(Icons.favorite_border),
                        tooltip: AppLocalizations.of(context)
                            .tr("app.status.action.favourite"),
                        onPressed: onPressed,
                      ),
                  asyncButtonAction: statusBloc.requestToggleFavourite);
            }),
        if (displayCounter)
          StreamBuilder<int>(
              stream: statusBloc.reblogPlusOriginalFavouritesCountStream,
              initialData: statusBloc.reblogPlusOriginalFavouritesCount,
              builder: (context, snapshot) {
                var favouritesCount = snapshot.data;
                if (favouritesCount == null) {
                  return SizedBox.shrink();
                }
                return GestureDetector(
                    onTap: () {
                      goToStatusFavouriteAccountListPage(
                          context, statusBloc.status);
                    },
                    child: Text(favouritesCount.toString()));
              }),
      ],
    );
  }
}
