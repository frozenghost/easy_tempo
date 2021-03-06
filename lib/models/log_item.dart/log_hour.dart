import 'package:formz/formz.dart';

enum LogHourValidationError { empty }

class LogHour extends FormzInput<int, LogHourValidationError> {
  const LogHour.pure() : super.pure(0);
  const LogHour.dirty([int value]) : super.dirty(value);

  @override
  LogHourValidationError validator(int value) {
    return value != null && value >= 0 && value <= 24
        ? null
        : LogHourValidationError.empty;
  }
}
