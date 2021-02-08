import 'package:easy_tempo/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
          ).tr(),
          toolbarHeight: 50.0,
        ),
        body: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: Text('Theme Mode: ${state.isDark ? 'Dark' : 'Light'}'),
                trailing: Switch(
                  value: state.isDark,
                  onChanged: (value) =>
                      context.read<SettingsCubit>().switchThemeMode(value),
                ),
                tileColor: Theme.of(context).backgroundColor,
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
              ),
              ListTile(
                title: Text('Language').tr(),
                tileColor: Theme.of(context).backgroundColor,
                trailing: Icon(FontAwesomeIcons.angleRight),
                onTap: () {
                  Navigator.pushNamed(context, '/settings/language');
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
