import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:flutter/cupertino.dart';

class PostStatusPollWidget extends StatelessWidget {
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
            multiplyFieldBloc: postStatusPollBloc.multiplyFieldBloc)
      ],
    );
  }

  Widget buildMultiplyField(
      {@required BuildContext context,
      @required IFormBoolFieldBloc multiplyFieldBloc}) =>
      FormBoolFieldFormRowWidget(
      field: multiplyFieldBloc,
      label: null,
    );
//  Widget buildExpiresAtField(
//      {@required BuildContext context,
//      @required IFormDateTimeFieldBloc expiresAtBloc}) =>
//      FormBoolFieldFormRowWidget(
//      field: multiplyFieldBloc,
//      label: null,
//    );

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
            children: items
                .map((bloc) => FormStringFieldFormRowWidget(
                      formStringFieldBloc: bloc,
                      onSubmitted: (String value) {},
                      label: null,
                      autocorrect: null,
                      textInputAction: null,
                      hint: null,
                    ))
                .toList(),
          );
        });
  }
}
