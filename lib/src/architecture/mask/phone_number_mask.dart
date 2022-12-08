import 'package:task_manager/task_manager.dart';

class PhoneNumberMask extends DelegateMask {
  PhoneNumberMask() : super(mask: PhoneNumberFormater.phoneNumberMask);
}
