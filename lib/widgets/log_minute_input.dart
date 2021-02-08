import 'package:easy_tempo/cubit/logitem_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogMinuteInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogItemCubit, LogItemState>(
      buildWhen: (previous, current) => previous.logMinute != current.logMinute,
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              SizedBox(
                width: 25.0,
                child: TextField(
                  key: const Key('form_logMinuteInput_textField'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorText:
                        state.logHour.invalid ? 'invalid log minute' : null,
                  ),
                  onChanged: (value) => context
                      .read<LogItemCubit>()
                      .changeLogItem(logMinute: int.parse(value)),
                ),
              ),
              Text('m'),
            ],
          ),
        );
      },
    );
  }
}
