import 'package:fedi/app/account/my/domain_block/add/add_my_account_domain_block_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AddMyAccountDomainBlockBloc extends FormBloc
    implements IAddMyAccountDomainBlockBloc {
  final IUnifediApiAccountService pleromaAuthAccountService;

  AddMyAccountDomainBlockBloc({
    required this.pleromaAuthAccountService,
  }) : super(isAllItemsInitialized: true);

  @override
  IStringValueFormFieldBloc domainField = StringValueFormFieldBloc(
    originValue: '',
    validators: [
      StringValueFormFieldNonEmptyValidationError.createValidator(),
    ],
    maxLength: null,
  );

  @override
  List<IFormItemBloc> get currentItems => [domainField];

  @override
  Future<void> submit() => pleromaAuthAccountService.blockDomain(
        domain: domainField.currentValue,
      );
}
