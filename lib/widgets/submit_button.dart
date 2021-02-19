import 'package:easy_tempo/cubit/logitem_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogItemCubit, LogItemState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : RaisedButton(
                color: Theme.of(context).primaryColor,
                key: const Key('logForm_raisedButton'),
                child: const Text('Submit'),
                onPressed: state.status.isValidated
                    ? () async {
                        await context.read<LogItemCubit>().submit();
                        Navigator.pop(context, 'Refresh');
                      }
                    : null,
              );
      },
    );
  }
}
