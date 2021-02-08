import 'package:easy_tempo/cubit/logitem_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionInput extends StatelessWidget {
  const DescriptionInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogItemCubit, LogItemState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return Container(
          child: TextField(
            key: const Key('form_descriptionInput_textField'),
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Description',
              errorText:
                  state.description.invalid ? 'invalid description' : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 2.0,
                ),
              ),
            ),
            onChanged: (value) =>
                context.read<LogItemCubit>().changeLogItem(description: value),
          ),
        );
      },
    );
  }
}
