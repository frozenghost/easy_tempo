import 'package:easy_tempo/cubit/logitem_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogHourInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogItemCubit, LogItemState>(
      buildWhen: (previous, current) => previous.logHour != current.logHour,
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              SizedBox(
                width: 25.0,
                child: TextField(
                  key: const Key('form_logHourInput_textField'),
                  controller: TextEditingController.fromValue(
                      TextEditingValue(text: state.logHour.value?.toString())),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorText:
                        state.logHour.invalid ? 'invalid log hour' : null,
                  ),
                  onChanged: (value) => context
                      .read<LogItemCubit>()
                      .changeLogItem(logHour: int.parse(value)),
                ),
              ),
              Text('h'),
            ],
          ),
        );
      },
    );
  }
}
