import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../core/constants/color_constants.dart';

class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({Key? key}) : super(key: key);
  static const String routeName = '/select_date_screen';
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Select Date"),
      ),
      body: Column(
        children: [
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: Colors.yellow,
            startRangeSelectionColor: Colors.yellow,
            endRangeSelectionColor: Colors.yellow,
            rangeSelectionColor: Colors.yellow.withOpacity(0.25),
            todayHighlightColor: Colors.yellow,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args){
              if (args.value is PickerDateRange)
              {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
             //   Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              }
            },
          ),
          Material(
          color: Colorpalette.buttonColor,
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop([
                rangeStartDate,rangeEndDate
              ]);
            },
            borderRadius: BorderRadius.circular(30),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 150,
              ),
              child: Text("Select",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
        const SizedBox(height: 18,),
         Material(
          color: Colorpalette.buttonColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            borderRadius: BorderRadius.circular(30),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 150,
              ),
              child: Text("Cancel",
                  style: TextStyle(
                    color: Colorpalette.buttonColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
        ],
      ),
    );
  }
}