import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:schedule_list/Theme/app_style.dart';
import 'package:schedule_list/widget/date_time_widget.dart';
import 'package:schedule_list/widget/textfield_widget.dart';

import '../widget/radio_widget.dart';

class AddNewTaskModel extends StatefulWidget {
  AddNewTaskModel({Key? key}) : super(key: key);

  @override
  State<AddNewTaskModel> createState() => _AddNewTaskModel();

}
//Adding New Task
class _AddNewTaskModel extends State<AddNewTaskModel> {
  //variables
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime? _selectedDate;
  String _date = 'mm/dd/yy';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text(
                'New Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            Divider(
              thickness: 1.2,
              color: Colors.grey.shade200,
            ),
            const Gap(12),
            const Text('Title Task', style: AppStyle.heading1,),
            const Gap(6),
            TextFieldWidget(hintText: 'Add Task Name', maxLine: 1, controller: _titleController,),
            const Gap(12),
            const Text('Note', style: AppStyle.heading1,),
            const Gap(6),
            TextFieldWidget(hintText: 'Add Notes...', maxLine: 4, controller: _noteController,),
            const Gap(12),
            const Text('Category', style: AppStyle.heading1,),
            Row(
              children: [
                Expanded(
                  child: RadioWidget(titleRadio: 'LRN'),
                ),
                Expanded(
                  child: RadioWidget(titleRadio: 'WRK'),
                ),
                Expanded(
                  child: RadioWidget(
                    titleRadio: 'GEN',
                  ),
                ),
              ],
            ),

            //Date and Time section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                    titleText: 'Date',
                    valueText: DateFormat.yMd().format(_selectedDate!).toString(),
                    iconSection: Icons.calendar_month,
                    onTap: () async {
                      DateTime? datePicker = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2025)
                      );
                      if(datePicker != null) {
                        setState(() {
                          _selectedDate = datePicker;
                        });
                      }
                      else {
                        print("It's null or something is wrong");
                      }
                    }
                ),
                const Gap(12),
                DateTimeWidget(
                  titleText: 'Time',
                  valueText: 'hh : mm',
                  iconSection: Icons.access_time_rounded,
                  onTap: () => showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now()
                  ),
                )
              ],
            ),

            //Button Section
            const Gap(12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue.shade800,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        side: BorderSide(
                            color: Colors.blue.shade800
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16)
                    ),
                    onPressed: () {},
                    child: const Text('Cancel'),
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16)
                    ),
                    onPressed: () {},
                    child: const Text('Create'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
