import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:google_task/res.dart';

class AddBottomSheet extends StatefulWidget {
  @override
  _AddBottomSheetState createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  bool _addDetailsTextFieldVisibility = false;

  DateTime _selectedDate = todayDate;
  TimeOfDay _selectedTime = nowTime;
  String _setTimeText = 'Set Time';
  dynamic _showDatePicker(BuildContext buildContext) async {
    DateTime pickedDate = await showRoundedDatePicker(
      context: buildContext,
      initialDate: _selectedDate,
      firstDate: DateTime(todayDate.year - 10),
      lastDate: DateTime(todayDate.year + 10),
      height: MediaQuery.of(context).size.height * 0.33,
      textActionButton: _setTimeText,
      styleDatePicker: MaterialRoundedDatePickerStyle(
        paddingDatePicker: EdgeInsets.zero,
        paddingActionBar: EdgeInsets.zero,
        paddingMonthHeader: EdgeInsets.only(top: padding14),
        textStyleButtonAction: TextStyle(
          color: newTaskTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTapActionButton: () {
        Navigator.pop(context);
        _showTimePicker(buildContext);
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        // _setTimeText =
      });
    }
  }

  dynamic _showTimePicker(BuildContext buildContext) async {
    TimeOfDay pickedTime = await showRoundedTimePicker(
      context: buildContext,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.only(
        left: padding24,
        top: padding24,
        right: padding24,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _newTaskTextField(),
          _addDetailsTextField(),
          _buttonsRow(),
        ],
      ),
    );
  }

  _newTaskTextField() {
    return Padding(
      padding: const EdgeInsets.only(
        // left: padding24,
        // top: padding24,
        // right: padding24,
        bottom: padding8,
      ),
      child: TextField(
        //cursorHeight: 20,
        textInputAction: TextInputAction.done,
        textAlignVertical: TextAlignVertical.center,
        maxLines: 3,
        minLines: 1,
        autofocus: true,
        style: TextStyle(
          fontSize: textSize18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration.collapsed(
          hintText: 'New task',
          hintStyle: TextStyle(
            fontSize: textSize18,
            fontFamily: 'Product Sans',
            color: newTaskTextColor,
          ),
        ),
      ),
    );
  }

  _addDetailsTextField() {
    return _addDetailsTextFieldVisibility
        ? Padding(
            padding: const EdgeInsets.only(
              // left: padding24,
              // right: padding24,
              bottom: padding8,
            ),
            child: TextField(
              textInputAction: TextInputAction.done,
              textAlignVertical: TextAlignVertical.center,
              maxLines: 1,
              minLines: 1,
              style: TextStyle(
                fontSize: textSize14,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration.collapsed(
                hintText: 'Add details',
                hintStyle: TextStyle(
                  fontSize: textSize14,
                  fontFamily: 'Product Sans',
                  color: newTaskTextColor,
                ),
              ),
            ),
          )
        : Container();
  }

  _buttonsRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              // left: padding12,
              // bottom: padding8,
              ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                constraints: BoxConstraints.tightForFinite(),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.sort,
                  color: saveButtonColor,
                ),
                onPressed: () {
                  setState(() {
                    _addDetailsTextFieldVisibility =
                        !_addDetailsTextFieldVisibility;
                  });
                },
              ),
              IconButton(
                constraints: BoxConstraints.tightFor(width: 3 * padding24),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.today,
                  color: saveButtonColor,
                ),
                onPressed: () {
                  _showDatePicker(context);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              // left: padding24,
              // right: padding24,
              // bottom: padding8,
              ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: textSize18,
                color: saveButtonColor,
                fontFamily: 'Product Sans',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
