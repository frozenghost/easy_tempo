import 'package:easy_tempo/cubit/logitem_cubit.dart';
import 'package:easy_tempo/models/normal_issue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicketInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogItemCubit, LogItemState>(
      buildWhen: (previous, current) => previous.ticketId != current.ticketId,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
          child: Container(
            height: 50.0,
            width: double.infinity,
            child: GestureDetector(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: generateCardContent(state),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/ticketsearch').then((value) {
                  if (value != null) {
                    NormalIssue issue = (value as NormalIssue);
                    context.read<LogItemCubit>().changeLogItem(
                          ticketId: issue.originalTaskId,
                          key: issue.key,
                        );
                  }
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget generateCardContent(LogItemState state) {
    if (state.ticketId.value > 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2.0),
            color: Colors.green.shade400,
            child: Icon(
              FontAwesomeIcons.check,
              color: Colors.white,
              size: 10.0,
            ),
          ),
          SizedBox(
            width: 7.0,
          ),
          Text(state.key),
        ],
      );
    } else
      return Center(
        child: Text('Click to add'),
      );
  }
}
