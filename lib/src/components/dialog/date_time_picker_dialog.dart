import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/task_manager.dart';

// ignore: must_be_immutable
class DateTimePickerDialog extends StatelessWidget {
  DateTimePickerDialog({
    Key? key,
  }) : super(key: key);

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 250,
            width: 320,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              dateOrder: DatePickerDateOrder.dmy,
              initialDateTime: DateTime.now(),
              use24hFormat: true,
              onDateTimeChanged: (value) {
                _selectedDate = value;
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.back<bool>(result: false),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(0.0),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 48.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: backgroundColorLight,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                      ),
                    ),
                    child: Text(
                      'Fechar',
                      style: text.semiBold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 1.0,
                color: backgroundColor,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.back<DateTime>(result: _selectedDate),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(0.0),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 48.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: backgroundColorLight,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Text(
                      'Confirmar',
                      style: text.semiBold.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
