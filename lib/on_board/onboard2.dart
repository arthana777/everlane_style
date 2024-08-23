import 'package:everlane_style/btm_navigation/btm_navigation.dart';
import 'package:everlane_style/data/models/question%20model.dart';
import 'package:everlane_style/data/datasources/qst_service.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboard2 extends StatefulWidget {
  const Onboard2({super.key});

  @override
  State<Onboard2> createState() => _Onboard2State();
}

class _Onboard2State extends State<Onboard2> {
  String dropdownValue1 = 'Short';
  String dropdownValue2 = 'dark';
  String dropdownValue3 = 'Summer';
  String dropdownValue4 = "Casual";
  String dropdownValue5 = "Male";

  final List<String> item5 = ["Male", "Female"];
  final List<String> item1 = ["Short", 'Medium', 'High'];
  final List<String> item2 = ["dark", "black", "White"];
  final List<String> item3 = ['Summer', 'Winter', 'Monsoon'];
  final List<String> item4 = ["Casual", "Party Wear", "Formal", "Sport"];

  final QstService qstService = QstService();

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');
      if (token == null) {
        print('No token found. Redirecting to login.');

        return;
      }

    
    } catch (e) {
      print('Error fetching initial data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to fetch data. Please try again.')),
      );
    }
  }

  Future<void> updateData() async {
    Data data = Data(
      id: null,
      gender: dropdownValue5,
      skinColor: dropdownValue2,
      height: dropdownValue1,
      preferredSeason: dropdownValue3,
      usageOfDress: dropdownValue4,
    );

    try {
      await qstService.updateQuestion;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BtmNavigation()),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data updated successfully!')),
      );
    } catch (e) {
      print('Error updating data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to update data. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Help us know you better", style: CustomFont().titleText),
              SizedBox(height: 10.h),
              Text(
                "Fill your details so that we can provide\nyou with more accurate results",
                style: CustomFont().subText,
              ),
              SizedBox(height: 20.h),
              buildDropdown('Gender', dropdownValue5, item5, (newValue) {
                setState(() {
                  dropdownValue5 = newValue!;
                });
              }),
              SizedBox(height: 10.h),
              buildDropdown('Height', dropdownValue1, item1, (newValue) {
                setState(() {
                  dropdownValue1 = newValue!;
                });
              }),
              SizedBox(height: 10.h),
              buildDropdown('Skin Type', dropdownValue2, item2, (newValue) {
                setState(() {
                  dropdownValue2 = newValue!;
                });
              }),
              SizedBox(height: 10.h),
              buildDropdown('Weather', dropdownValue3, item3, (newValue) {
                setState(() {
                  dropdownValue3 = newValue!;
                });
              }),
              SizedBox(height: 10.h),
              buildDropdown('Usages', dropdownValue4, item4, (newValue) {
                setState(() {
                  dropdownValue4 = newValue!;
                });
              }),
              SizedBox(height: 10.h),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3BBFC3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).w,
                    ),
                  ),
                  onPressed: updateData,
                  child: Text("Update", style: CustomFont().buttontext),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String title, String value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Container(
      height: 80.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAyC8Rgj38TQnSalCjkm0zIftNnipHMOY-EjkQkbNK-JUmfV9EcioS1e8-nJge4S_Nd1w&usqp=CAU"),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            blurRadius: 1.0,
          ),
        ],
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(const Radius.circular(10).w),
      ),
      child: Center(
        child: ListTile(
          leading: Text(title, style: CustomFont().titleText),
          trailing: DropdownButton(
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(10).w,
            value: value,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
