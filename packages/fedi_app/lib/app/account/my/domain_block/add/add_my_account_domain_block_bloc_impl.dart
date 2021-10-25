import 'package:fedi_app/app/account/my/domain_block/add/add_my_account_domain_block_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi_app/form/form_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AddMyAccountDomainBlockBloc extends FormBloc
    implements IAddMyAccountDomainBlockBloc {
  final IUnifediApiAccountService unifediAuthAccountService;

  AddMyAccountDomainBlockBloc({
    required this.unifediAuthAccountService,
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
  Future<void> submit() => unifediAuthAccountService.blockDomain(
        domain: domainField.currentValue,
      );
}
