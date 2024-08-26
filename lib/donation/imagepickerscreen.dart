import 'dart:io';

import 'package:everlane_style/data/navigation_provider/navigation_provider.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../bloc/address/address_bloc.dart';
import '../btm_navigation/btm_navigation.dart';


class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  List<File> _images = [];

  Future<void> _pickImage() async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }
  Future<void> _uploadFromGallery() async {
    final List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _images.addAll(pickedFiles.map((file) => File(file.path)).toList());
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }
  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text('Add Image'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Upload from Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                _uploadFromGallery();
              },
            ),
          ],
        );
      },
    );
  }

  final List<String> item1 = [
    "kochi",
    'calicut',
    'tirur',
    'kannur',
    'malappuram',
  ];
  late  String dropedownvalue1;
  @override
  void initState() {
    dropedownvalue1 = 'calicut';
    super.initState();
  }
  void _uploadImages() {
    if (_images.isNotEmpty) {
      context.read<AddressBloc>().add(uploadclothes( images: _images ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select images first')),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        onPressed: (){
          _uploadImages();
        },
        label: Container(
          height: 30.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: CustomColor.primaryColor,
          ),
          child: Center(
            child: Text("Upload", style: CustomFont().buttontext),
          ),
        ),

      ),
      appBar:PreferredSize(preferredSize: Size.fromHeight(80.h), child: CustomAppBar(
        text: "Upload clothes",
        leading: InkWell(
            onTap: (){
              final navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
              navigationProvider.updateScreenIndex(0);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const BtmNavigation()),
                    (Route<dynamic> route) => false,
              );
            },
            child: Icon(Icons.arrow_back)),
      action: [
        IconButton(onPressed: () => _showMenu(context), icon: Icon(Icons.add,size: 30.sp,))
      ],),),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AddressBloc, AddressState>(
            listener: (context, state) {
              print(state);
              if (state is AddressLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );
              } else if (state is uploadclothesuccess) {
                setState(() {

                });

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Upload successful')),
                );

                print("adding to addresslist");
              }
              else if (state is AddressError) {
                // Dismiss loading indicator and show error message
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }

            },
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _images.isEmpty
                    ? Center(child: Text('No images selected.'))
                    : SizedBox(
                  height: 400.h,  // Adjust height as needed
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 200.w,
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Stack(
                          children: [
                            Container(
                              height: 400.h,
                              width: double.infinity,
                              child: Image.file(
                                _images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 5.w,
                              top: 5.h,
                              child: InkWell(
                                onTap: () => _removeImage(index),
                                child: Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.delete,
                                      size: 15.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
          SizedBox(height: 50.h,),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 20),
                child: Text("Choose pickup location",style: CustomFont().subtitleText,),
              ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.black12
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Choose location"),
                      DropdownButton(
                        value: dropedownvalue1,
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        underline: SizedBox(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: item1.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropedownvalue1 = newValue!;
                          });
                        },
                      ),
                    ],
                  )
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
