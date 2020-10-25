import 'package:fedi/app/account/my/domain_block/add/add_my_account_domain_block_bloc.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/ui/form/field/value/string/form_non_empty_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class AddMyAccountDomainBlockBloc extends FormBloc
    implements IAddMyAccountDomainBlockBloc {
  final IPleromaAccountService pleromaAccountService;

  AddMyAccountDomainBlockBloc({@required this.pleromaAccountService});

  @override
  IFormStringFieldBloc domainField = FormStringFieldBloc(
    originValue: null,
    validators: [
      FormNonEmptyStringFieldValidationError.createValidator(),
    ],
    maxLength: null,
  );

  @override
  List<IFormItemBloc> get items => [domainField];

  @override
  Future submit() =>
      pleromaAccountService.blockDomain(domain: domainField.currentValue);
}
