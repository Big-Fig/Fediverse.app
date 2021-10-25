import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/my/domain_block/add/add_my_account_domain_block_bloc.dart';
import 'package:fedi_app/app/account/my/domain_block/add/add_my_account_domain_block_bloc_impl.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi_app/app/ui/dialog/fedi_dialog.dart';
import 'package:fedi_app/dialog/base_dialog.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AddMyAccountDomainBlockDialog extends FediDialog {
  // ignore: avoid-late-keyword
  late IAddMyAccountDomainBlockBloc addMyAccountDomainBlockBloc;

  AddMyAccountDomainBlockDialog.createFromContext({
    required BuildContext context,
    required VoidCallback successCallback,
  }) : super(
          actionsBorderVisible: true,
          title: S.of(context).app_account_my_domainBlock_add_dialog_title,
          actions: [
            BaseDialog.createDefaultOkAction(
              context: context,
              action: (context) async {
                var addMyAccountDomainBlockBloc =
                    IAddMyAccountDomainBlockBloc.of(context, listen: false);

                var dialogResult = await UnifediAsyncOperationHelper
                    .performUnifediAsyncOperation(
                  context: context,
                  asyncCode: () async {
                    await addMyAccountDomainBlockBloc.submit();
                  },
                );

                if (dialogResult.success) {
                  successCallback();
                }
              },
              isActionEnabledFetcher: (context) =>
                  IAddMyAccountDomainBlockBloc.of(context, listen: false)
                      .isHaveChangesAndNoErrors,
              isActionEnabledStreamFetcher: (context) =>
                  IAddMyAccountDomainBlockBloc.of(context, listen: false)
                      .isHaveChangesAndNoErrorsStream,
            ),
          ],
          actionsAxis: Axis.horizontal,
          cancelable: true,
        ) {
    addMyAccountDomainBlockBloc = AddMyAccountDomainBlockBloc(
      unifediAuthAccountService: Provider.of<IUnifediApiAccountService>(
        context,
        listen: false,
      ),
    );
    addMyAccountDomainBlockBloc.disposeWith(this);
  }

  @override
  Widget buildDialogBody(BuildContext context) =>
      Provider<IAddMyAccountDomainBlockBloc>.value(
        value: addMyAccountDomainBlockBloc,
        child: Builder(
          builder: (context) => super.buildDialogBody(context),
        ),
      );

  @override
  Widget buildContentWidget(BuildContext context) =>
      ProxyProvider<IAddMyAccountDomainBlockBloc, IStringValueFormFieldBloc>(
        update: (context, value, _) => value.domainField,
        child: StringValueFormFieldRowWidget(
          label: null,
          autocorrect: false,
          hint: S
              .of(context)
              .app_account_my_domainBlock_add_dialog_field_domain_hint,
          // ignore: no-empty-block
          onSubmitted: (_) {
            // nothing
          },
          textInputAction: TextInputAction.done,
        ),
      );
}
