import 'package:easy_tempo/cubit/logitem_cubit.dart';
import 'package:easy_tempo/cubit/settings_cubit.dart';
import 'package:easy_tempo/widgets/description_input.dart';
import 'package:easy_tempo/widgets/log_date_input.dart';
import 'package:easy_tempo/widgets/log_hour_input.dart';
import 'package:easy_tempo/widgets/log_minute_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class LogItemPage extends StatefulWidget {
  @override
  _LogItemPageState createState() => _LogItemPageState();
}

class _LogItemPageState extends State<LogItemPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settingState) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Log Item'),
        ),
        body: SafeArea(
          child: BlocBuilder<LogItemCubit, LogItemState>(
              builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  DescriptionInput(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      children: [
                        Text('Time Spent', style: TextStyle(fontSize: 18.0)),
                        Expanded(
                          child: Container(),
                        ),
                        LogHourInput(),
                        SizedBox(
                          width: 10.0,
                        ),
                        LogMinuteInput(),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      children: [
                        Text('Log Date', style: TextStyle(fontSize: 18.0)),
                        Expanded(
                          child: Container(),
                        ),
                        LogDateInput(
                          locale: settingState.locale,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          child: Text('Submit'),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      );
    });
  }
}
