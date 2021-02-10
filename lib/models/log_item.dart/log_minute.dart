import 'package:formz/formz.dart';

enum LogMinuteValidationError { empty }

class LogMinute extends FormzInput<int, LogMinuteValidationError> {
  const LogMinute.pure() : super.pure(0);
  const LogMinute.dirty([int value]) : super.dirty(value);

  @override
  LogMinuteValidationError validator(int value) {
    return value >= 0 && value < 60 ? null : LogMinuteValidationError.empty;
  }
}
