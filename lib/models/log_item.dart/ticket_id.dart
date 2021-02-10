import 'package:formz/formz.dart';

enum TicketIdValidationError { empty }

class TicketId extends FormzInput<int, TicketIdValidationError> {
  const TicketId.pure() : super.pure(0);
  const TicketId.dirty([int value]) : super.dirty(value);

  @override
  TicketIdValidationError validator(int value) {
    return value > 0 ? null : TicketIdValidationError.empty;
  }
}
