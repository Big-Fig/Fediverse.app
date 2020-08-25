import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_date_time_field_form_row_widget.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/date_time/form_date_time_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusPollWidget extends StatelessWidget {
  PostStatusPollWidget();

  @override
  Widget build(BuildContext context) {
    var postStatusPollBloc = IPostStatusPollBloc.of(context, listen: false);

    return Column(
      children: <Widget>[
        buildPollOptionFields(
            context: context,
            pollOptionsGroupBloc: postStatusPollBloc.pollOptionsGroupBloc),
        buildMultiplyField(
            context: context,
            multiplyFieldBloc: postStatusPollBloc.multiplyFieldBloc),
        buildExpiresAtField(
            context: context,
            expiresAtBloc: postStatusPollBloc.expiresAtFieldBloc),
      ],
    );
  }

  Widget buildMultiplyField(
          {@required BuildContext context,
          @required IFormBoolFieldBloc multiplyFieldBloc}) =>
      FormBoolFieldFormRowWidget(
        field: multiplyFieldBloc,
        label: "app.status.post.poll.field.multiply.label".tr(),
      );

  Widget buildExpiresAtField(
          {@required BuildContext context,
          @required IFormDateTimeFieldBloc expiresAtBloc}) =>
      FormDateTimeFieldFormRowWidget(
        field: expiresAtBloc,
        label: "app.status.post.poll.field.expires_at.label".tr(),
      );

  Widget buildPollOptionFields(
      {@required
          BuildContext context,
      @required
          IFormOneTypeGroupBloc<IFormStringFieldBloc> pollOptionsGroupBloc}) {
    return StreamBuilder<List<IFormStringFieldBloc>>(
        stream: pollOptionsGroupBloc.itemsStream,
        initialData: pollOptionsGroupBloc.items,
        builder: (context, snapshot) {
          var items = snapshot.data;

          return Column(
            children: [
              ...items.asMap().entries.map((entry) {
                var index = entry.key;
                var bloc = entry.value;
                var number = index + 1;
                var isLast = items.length == number;
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: FormStringFieldFormRowWidget(
                        formStringFieldBloc: bloc,
                        onSubmitted: (String value) {
                          var nextItem = items[index + 1];
                          nextItem.focusNode.requestFocus();
                        },
                        label: "app.status.post.poll.field.option.label"
                            .tr(args: [number.toString()]),
                        autocorrect: true,
                        textInputAction: isLast
                            ? TextInputAction.done
                            : TextInputAction.next,
                        hint: "app.status.post.poll.field.option.hint".tr(),
                      ),
                    ),
                    StreamBuilder<bool>(
                        stream:
                            pollOptionsGroupBloc.isPossibleToRemoveFieldsStream,
                        initialData:
                            pollOptionsGroupBloc.isPossibleToRemoveFields,
                        builder: (context, snapshot) {
                          var isPossibleToRemoveFields = snapshot.data;
                          return FediIconButton(
                            icon: Icon(FediIcons.remove),
                            color: isPossibleToRemoveFields
                                ? FediColors.darkGrey
                                : FediColors.lightGrey,
                            onPressed: isPossibleToRemoveFields
                                ? () {
                                    pollOptionsGroupBloc.removeField(bloc);
                                  }
                                : null,
                          );
                        }),
                  ],
                );
              }).toList(),
              StreamBuilder<bool>(
                  stream:
                      pollOptionsGroupBloc.isMaximumFieldsCountReachedStream,
                  initialData: pollOptionsGroupBloc.isMaximumFieldsCountReached,
                  builder: (context, snapshot) {
                    var isMaximumFieldsCountReached = snapshot.data;
                    if (isMaximumFieldsCountReached) {
                      return SizedBox.shrink();
                    } else {
                      return FediPrimaryFilledTextButton(
                        "app.status.post.poll.action.add_option".tr(),
                        onPressed: isMaximumFieldsCountReached
                            ? null
                            : () {
                                pollOptionsGroupBloc.addNewEmptyField();
                              },
                        expanded: false,
                      );
                    }
                  }),
            ],
          );
        });
  }
}
