import 'package:date_format/date_format.dart';
import 'package:easy_tempo/cubit/logitem_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogDateInput extends StatelessWidget {
  const LogDateInput({Key key, this.locale}) : super(key: key);

  final String locale;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogItemCubit, LogItemState>(
      buildWhen: (previous, current) => previous.logDate != current.logDate,
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              Text(
                state.logDate.value == null
                    ? ''
                    : formatDate(state.logDate.value, [yyyy, '-', mm, '-', dd]),
                key: const Key('form_logDateInput_field'),
              ),
              FlatButton(
                child: Icon(FontAwesomeIcons.calendarAlt),
                onPressed: () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: state.logDate.value.add(Duration(days: -30)),
                    maxTime: state.logDate.value.add(Duration(days: 30)),
                    currentTime: state.logDate.value,
                    locale: locale == 'en-US' ? LocaleType.en : LocaleType.zh,
                  ).then(
                    (value) => context
                        .read<LogItemCubit>()
                        .changeLogItem(logDate: value),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
