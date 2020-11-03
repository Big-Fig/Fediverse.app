import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_duration_field_form_row_widget.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_option_form_string_field_form_row_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/duration/form_duration_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostStatusPollWidget extends StatelessWidget {
  const PostStatusPollWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProxyProvider<IPostStatusPollBloc,
            IFormOneTypeGroupBloc<IFormStringFieldBloc>>(
          update: (context, pollBloc, _) => pollBloc.pollOptionsGroupBloc,
          child: const _PostStatusPollOptionsFieldWidget(),
        ),
        ProxyProvider<IPostStatusPollBloc, IFormBoolFieldBloc>(
          update: (context, pollBloc, _) => pollBloc.multiplyFieldBloc,
          child: const _PostStatusPollMultiplyFieldWidget(),
        ),
        ProxyProvider<IPostStatusPollBloc, IFormDurationFieldBloc>(
          update: (context, pollBloc, _) => pollBloc.durationLengthFieldBloc,
          child: const _PostStatusPollLengthFieldWidget(),
        ),
      ],
    );
  }
}

class _PostStatusPollOptionsFieldWidget extends StatelessWidget {
  const _PostStatusPollOptionsFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollOptionsGroupBloc =
        IFormOneTypeGroupBloc.of<IFormStringFieldBloc>(context);
    return StreamBuilder<List<IFormStringFieldBloc>>(
      stream: pollOptionsGroupBloc.itemsStream,
      builder: (context, snapshot) {
        var items = snapshot.data;
        if (items == null) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            ...items
                .map((pollItemBloc) => Provider<IFormStringFieldBloc>.value(
                      value: pollItemBloc,
                      child: const _PostStatusPollOptionsFieldItemWidget(),
                    ))
                .toList(),
          ],
        );
      },
    );
  }
}

class _PostStatusPollOptionsFieldItemWidget extends StatelessWidget {
  const _PostStatusPollOptionsFieldItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollOptionsGroupBloc =
        IFormOneTypeGroupBloc.of<IFormStringFieldBloc>(context);

    var pollItemBloc = IFormStringFieldBloc.of(context);

    var number = pollOptionsGroupBloc.indexOf(pollItemBloc) + 1;
    var isLast = pollOptionsGroupBloc.isLast(pollItemBloc);

    return Padding(
      padding: EdgeInsets.only(top: FediSizes.mediumPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: PostStatusPollOptionFormStringFieldFormRowWidget(
              formStringFieldBloc: pollItemBloc,
              onSubmitted: (String value) {
                var nextItem =
                    pollOptionsGroupBloc.findNextItemFor(pollItemBloc);
                nextItem?.focusNode?.requestFocus();
              },
              textInputAction:
                  isLast ? TextInputAction.done : TextInputAction.next,
              hint: S.of(context).app_status_post_poll_field_option_hint(
                    number.toString(),
                  ),
            ),
          ),
          if (!isLast) const _PostStatusPollOptionRemoteItemButtonWidget(),
          if (isLast)
            StreamBuilder<bool>(
              stream: pollOptionsGroupBloc.isMaximumFieldsCountReachedStream,
              builder: (context, snapshot) {
                var isMaximumFieldsCountReached = snapshot.data;
                if (isMaximumFieldsCountReached != false) {
                  return const _PostStatusPollOptionRemoteItemButtonWidget();
                } else {
                  return const _PostStatusPollOptionsAddItemButtonWidget();
                }
              },
            )
        ],
      ),
    );
  }
}

class _PostStatusPollOptionRemoteItemButtonWidget extends StatelessWidget {
  const _PostStatusPollOptionRemoteItemButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollOptionsGroupBloc =
        IFormOneTypeGroupBloc.of<IFormStringFieldBloc>(context);
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
                    var pollItemBloc = IFormStringFieldBloc.of(
                      context,
                      listen: false,
                    );

                    pollOptionsGroupBloc.removeField(pollItemBloc);
                  }
                : null,
          );
        });
  }
}

class _PostStatusPollOptionsAddItemButtonWidget extends StatelessWidget {
  const _PostStatusPollOptionsAddItemButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediIconButton(
      icon: Icon(FediIcons.plus),
      color: IFediUiColorTheme.of(context).primary,
      onPressed: () {
        var pollOptionsGroupBloc =
            IFormOneTypeGroupBloc.of<IFormStringFieldBloc>(
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
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var multiplyFieldBloc = IFormBoolFieldBloc.of(context);
    return FormBoolFieldFormRowWidget(
      field: multiplyFieldBloc,
      label: S.of(context).app_status_post_poll_field_multiply_label,
    );
  }
}

class _PostStatusPollLengthFieldWidget extends StatelessWidget {
  const _PostStatusPollLengthFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lengthBloc = IFormDurationFieldBloc.of(context);
    return FormDurationFieldFormRowWidget(
      field: lengthBloc,
      label: S.of(context).app_status_post_poll_field_length_label,
      popupTitle: S.of(context).app_status_post_poll_field_length_picker_title,
    );
  }
}
