import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/field/account_field_grid_item_widget.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/widgets.dart';

class AccountFieldGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return StreamBuilder<List<IPleromaField>>(
        stream: accountBloc.fieldsStream,
        initialData: accountBloc.fields,
        builder: (context, snapshot) {
          var fields = snapshot.data;

          var nonEmptyFields = fields?.where((field) =>
              field?.name?.isNotEmpty == true ||
              field?.value?.isNotEmpty == true);

          if (nonEmptyFields?.isNotEmpty == true) {
            return GridView.count(
                shrinkWrap: true,
                childAspectRatio: 4,
                crossAxisCount: 2,
                children: nonEmptyFields
                    .map((field) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AccountFieldGridItemWidget(field: field),
                        ))
                    .toList());
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
