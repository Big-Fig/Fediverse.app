import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/duration/date_time/duration_date_time_form_field_row_widget.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_option_form_string_field_form_row_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger("post_status_poll_widget.dart");

class PostStatusPollWidget extends StatelessWidget {
  const PostStatusPollWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProxyProvider<IPostStatusPollBloc,
            IOneTypeFormGroupBloc<IStringValueFormFieldBloc>>(
          update: (context, pollBloc, _) => pollBloc.pollOptionsGroupBloc,
          child: const _PostStatusPollOptionsFieldWidget(),
        ),
        ProxyProvider<IPostStatusPollBloc, IBoolValueFormFieldBloc>(
          update: (context, pollBloc, _) => pollBloc.multiplyFieldBloc,
          child: const _PostStatusPollMultiplyFieldWidget(),
        ),
        ProxyProvider<IPostStatusPollBloc, IBoolValueFormFieldBloc>(
          update: (context, pollBloc, _) => pollBloc.hideTotalsFieldBloc,
          child: const _PostStatusPollHideTotalsFieldWidget(),
        ),
        ProxyProvider<IPostStatusPollBloc, IDurationDateTimeValueFormFieldBloc>(
          update: (context, pollBloc, _) =>
              pollBloc.durationDateTimeLengthFieldBloc,
          child: const _PostStatusPollLengthFieldWidget(),
        ),
      ],
    );
  }
}

class _PostStatusPollOptionsFieldWidget extends StatelessWidget {
  const _PostStatusPollOptionsFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollOptionsGroupBloc =
        IOneTypeFormGroupBloc.of<IStringValueFormFieldBloc>(context);

    return StreamBuilder<List<IStringValueFormFieldBloc>?>(
      stream: pollOptionsGroupBloc.itemsStream,
      builder: (context, snapshot) {
        var items = snapshot.data;
        if (items == null) {
          return const SizedBox.shrink();
        }

        return Provider<List<IStringValueFormFieldBloc>>.value(
          value: items,
          child: _PostStatusPollOptionsFieldItemsWidget(),
        );
      },
    );
  }
}

class _PostStatusPollOptionsFieldItemsWidget extends StatelessWidget {
  _PostStatusPollOptionsFieldItemsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<List<IStringValueFormFieldBloc>>(context);

    return Column(
      children: [
        ...items
            .map((pollItemBloc) => Provider<IStringValueFormFieldBloc>.value(
                  value: pollItemBloc,
                  child: _PostStatusPollOptionsFieldItemWidget(),
                ))
            .toList(),
      ],
    );
  }
}

class _PostStatusPollOptionsFieldItemWidget extends StatelessWidget {
  _PostStatusPollOptionsFieldItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollOptionsGroupBloc =
        IOneTypeFormGroupBloc.of<IStringValueFormFieldBloc>(context);

    var pollItemBloc = IStringValueFormFieldBloc.of(context);

    var isLast = pollOptionsGroupBloc.isLast(pollItemBloc);

    return Padding(
      padding: EdgeInsets.only(top: FediSizes.mediumPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _PostStatusPollOptionsFieldItemFieldWidget(),
          ),
          if (!isLast) const _PostStatusPollOptionRemoteItemButtonWidget(),
          if (isLast)
            StreamBuilder<bool>(
              stream: pollOptionsGroupBloc.isMaximumFieldsCountReachedStream,
              builder: (context, snapshot) {
                var isMaximumFieldsCountReached = snapshot.data ?? true;
                if (isMaximumFieldsCountReached) {
                  return const _PostStatusPollOptionRemoteItemButtonWidget();
                } else {
                  return const _PostStatusPollOptionsAddItemButtonWidget();
                }
              },
            ),
        ],
      ),
    );
  }
}

class _PostStatusPollOptionsFieldItemFieldWidget extends StatelessWidget {
  _PostStatusPollOptionsFieldItemFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollOptionsGroupBloc =
        IOneTypeFormGroupBloc.of<IStringValueFormFieldBloc>(context);
    var pollItemBloc = IStringValueFormFieldBloc.of(context);

    var number = pollOptionsGroupBloc.indexOf(pollItemBloc) + 1;

    var isLast = pollOptionsGroupBloc.isLast(pollItemBloc);

    return PostStatusPollOptionFormStringFieldFormRowWidget(
      formStringFieldBloc: pollItemBloc,
      onSubmitted: (String value) {
        _logger.finest(() => "onSubmitted $value");
        var nextItem = pollOptionsGroupBloc.findNextItemFor(pollItemBloc);
        nextItem?.focusNode.requestFocus();
      },
      textInputAction: isLast ? TextInputAction.done : TextInputAction.go,
      // textInputAction: TextInputAction.done,
      hint: S.of(context).app_status_post_poll_field_option_hint(
            number.toString(),
          ),
    );
  }
}

class _PostStatusPollOptionRemoteItemButtonWidget extends StatelessWidget {
  const _PostStatusPollOptionRemoteItemButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollOptionsGroupBloc =
        IOneTypeFormGroupBloc.of<IStringValueFormFieldBloc>(context);

    return StreamBuilder<bool>(
      stream: pollOptionsGroupBloc.isPossibleToRemoveFieldsStream,
      builder: (context, snapshot) {
        var isPossibleToRemoveFields = snapshot.data ?? false;

        return FediIconButton(
          icon: Icon(FediIcons.remove),
          color: isPossibleToRemoveFields
              ? IFediUiColorTheme.of(context).darkGrey
              : IFediUiColorTheme.of(context).lightGrey,
          onPressed: isPossibleToRemoveFields
              ? () {
                  var pollItemBloc = IStringValueFormFieldBloc.of(
                    context,
                    listen: false,
                  );

                  pollOptionsGroupBloc.removeField(pollItemBloc);
                }
              : null,
        );
      },
    );
  }
}

class _PostStatusPollOptionsAddItemButtonWidget extends StatelessWidget {
  const _PostStatusPollOptionsAddItemButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediIconButton(
      icon: Icon(FediIcons.plus),
      color: IFediUiColorTheme.of(context).primary,
      onPressed: () {
        var pollOptionsGroupBloc =
            IOneTypeFormGroupBloc.of<IStringValueFormFieldBloc>(
          context,
          listen: false,
        );

        pollOptionsGroupBloc.addNewEmptyField();
      },
    );
  }
}

class _PostStatusPollMultiplyFieldWidget extends StatelessWidget {
  const _PostStatusPollMultiplyFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoolValueFormFieldRowWidget(
      label: S.of(context).app_status_post_poll_field_multiply_label,
    );
  }
}
class _PostStatusPollHideTotalsFieldWidget extends StatelessWidget {
  const _PostStatusPollHideTotalsFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoolValueFormFieldRowWidget(
      label: S.of(context).app_status_post_poll_field_hideTotals_label,
    );
  }
}

class _PostStatusPollLengthFieldWidget extends StatelessWidget {
  const _PostStatusPollLengthFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DurationDateTimeValueFormFieldRowWidget(
        label: S.of(context).app_status_post_poll_field_length_label,
        useDialogPickerForValueSelection: true,
      );
}
