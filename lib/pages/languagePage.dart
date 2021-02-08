import 'package:easy_tempo/constants/const.dart';
import 'package:easy_tempo/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Language').tr(),
          ),
          body: Container(
            child: ListView.builder(
              itemCount: TempoAppConst.supportedLanguages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    TempoAppConst.supportedLanguagesDescription[index],
                  ),
                  onTap: () {
                    List<String> locales =
                        TempoAppConst.supportedLanguages[index].split('-');
                    context.locale = Locale(locales[0], locales[1]);
                    context
                        .read<SettingsCubit>()
                        .setLocale(TempoAppConst.supportedLanguages[index]);
                  },
                  selected:
                      TempoAppConst.supportedLanguages[index] == state.locale,
                  selectedTileColor: Theme.of(context).backgroundColor,
                  trailing:
                      TempoAppConst.supportedLanguages[index] == state.locale
                          ? Icon(FontAwesomeIcons.check)
                          : null,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
