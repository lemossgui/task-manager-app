import 'package:task_manager/task_manager.dart';

class CpfMask extends DelegateMask {
  CpfMask() : super(mask: CpfFormater.cpfMask);
}
