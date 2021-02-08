import 'package:easy_tempo/cubit/logitem_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogItemCubit, LogItemState>(
      buildWhen: (previous, current) => previous.ticketId != current.ticketId,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: GestureDetector(
            child: Card(
              child: Text('Select'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/ticketsearch');
            },
          ),
        );
      },
    );
  }

  Widget generateCardContent() {}
}
