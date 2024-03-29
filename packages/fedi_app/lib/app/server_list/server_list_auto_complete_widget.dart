import 'package:fedi_app/app/server_list/server_list_auto_complete_bloc.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';

class ServerListAutoCompleteWidget extends StatelessWidget {
  final AutocompleteFieldViewBuilder fieldViewBuilder;
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  const ServerListAutoCompleteWidget({
    Key? key,
    required this.fieldViewBuilder,
    required this.textEditingController,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var serverListAutoCompleteBloc = IServerListAutoCompleteBloc.of(context);

    return RawAutocomplete(
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<String> onSelected,
        Iterable<String> options,
      ) =>
          Align(
        alignment: Alignment.topLeft,
        child: Material(
          child: Container(
            color: IFediUiColorTheme.of(context).white,
            child: SizedBox(
              // ignore: no-magic-number
              height: 200,
              child: ListView.builder(
                padding: FediPadding.allMediumPadding,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final option = options.elementAt(index);

                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(
                        option,
                        style: IFediUiTextTheme.of(context).bigTallDarkGrey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      optionsBuilder: (TextEditingValue textEditingValue) =>
          serverListAutoCompleteBloc.calculateServersSuggestionForTextInput(
        textEditingValue.text,
      ),
      displayStringForOption: (String option) => option,
      textEditingController: textEditingController,
      focusNode: focusNode,
      fieldViewBuilder: fieldViewBuilder,
    );
  }
}
