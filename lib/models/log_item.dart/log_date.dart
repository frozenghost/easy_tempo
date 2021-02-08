import 'package:formz/formz.dart';

enum LogDateValidationError { empty }

class LogDate extends FormzInput<DateTime, LogDateValidationError> {
  const LogDate.pure() : super.pure(null);
  const LogDate.dirty([DateTime value]) : super.dirty(value);

  @override
  LogDateValidationError validator(DateTime value) {
    return value != null ? null : LogDateValidationError.empty;
  }
}
