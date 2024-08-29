import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DropDownnLatest extends StatelessWidget {
  final bool isPage;
  final List<dynamic>? dataList;
  final Function(dynamic) onChanged;
  final String? value;
  final String? hint;
  const DropDownnLatest(
      {super.key,
      this.isPage = false,
      this.dataList,
      this.value,
      required this.onChanged,
      this.hint});
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            // Icon(
            //   Icons.list,
            //   size: 16,
            //   color: Colors.yellow,
            // ),
            // SizedBox(
            //   width: 4,
            // ),
            Expanded(
              child: Text(
                value == null ? hint.toString() : value.toString(),
                style: CustomFont().subText,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: dataList!
            .map((item) => DropdownMenuItem<dynamic>(
                  value: item,
                  child: Text(
                    item.name,
                    style: CustomFont().titleText,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 50.h,
          // width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).w,
            border: Border.all(
              color: Colors.white,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 1),
                blurRadius: 1.0,
              ),
            ],
            color: Colors.white,
            //  Color(0xff11bdbd),
          ),
          elevation: 2,
        ),
        iconStyleData: IconStyleData(
          icon:  const Icon(
            Icons.keyboard_arrow_down,
          ),
          iconSize: 22.sp,
          iconEnabledColor: Colors.black54,
          iconDisabledColor: CustomColor.iconColor,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 400.h,
          width: 200.w,
          direction: DropdownDirection.right,
          padding: null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4).w,
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 1),
                blurRadius: 1.0,
              ),
            ],
          ),
          elevation: 8,
          offset: const Offset(60, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40).w,
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40.h,
          padding: const EdgeInsets.only(left: 14, right: 14).r,
        ),
      ),
    );
  }
}
