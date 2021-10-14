import 'package:fedi/app/async/pleroma/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/action/status_action_counter_widget.dart';
import 'package:fedi/app/status/favourite/status_favourite_account_list_page.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusFavouriteActionWidget extends StatelessWidget {
  final bool displayCounter;

  const StatusFavouriteActionWidget({
    Key? key,
    this.displayCounter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          const _StatusFavouriteActionButtonWidget(),
          if (displayCounter) const _StatusFavouriteActionCounterWidget(),
        ],
      );
}

class _StatusFavouriteActionButtonWidget extends StatelessWidget {
  const _StatusFavouriteActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<bool?>(
      stream: statusBloc.favouritedStream,
      initialData: statusBloc.favourited,
      builder: (context, snapshot) {
        var favourited = snapshot.data;

        return PleromaAsyncOperationButtonBuilderWidget(
          showProgressDialog: false,
          builder: (context, onPressed) => FediIconButton(
            iconSize: FediSizes.bigIconSize,
            color: favourited!
                ? IFediUiColorTheme.of(context).secondary
                : IFediUiColorTheme.of(context).darkGrey,
            icon: favourited
                ? const Icon(FediIcons.heart_active)
                : const Icon(FediIcons.heart),
            onPressed: onPressed,
          ),
          asyncButtonAction: statusBloc.toggleFavourite,
        );
      },
    );
  }
}

class _StatusFavouriteActionCounterWidget extends StatelessWidget {
  const _StatusFavouriteActionCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<int?>(
      stream: statusBloc.reblogPlusOriginalFavouritesCountStream,
      builder: (context, snapshot) {
        var favouritesCount = snapshot.data;
        if (favouritesCount == null) {
          return const SizedBox.shrink();
        }

        return Provider<int>.value(
          value: favouritesCount,
          child: const StatusActionCounterWidget(
            onClick: _onCounterClick,
          ),
        );
      },
    );
  }
}

void _onCounterClick(BuildContext context) {
  var statusBloc = IStatusBloc.of(context, listen: false);
  goToStatusFavouriteAccountListPage(context, statusBloc.status);
}
