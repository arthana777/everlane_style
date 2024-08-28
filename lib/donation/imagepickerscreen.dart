import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:everlane_style/data/models/disastermodel.dart';
import 'package:everlane_style/data/navigation_provider/navigation_provider.dart';
import 'package:everlane_style/donation/upload_clothes.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/address/address_bloc.dart';
import '../btm_navigation/btm_navigation.dart';


import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';


class ImagePickerScreen extends StatefulWidget {
  final Disaster? disaster;
  final String? location;
  ImagePickerScreen({super.key,  this.disaster, this.location,});
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  List<File> images = [];

  Future<void> _pickImage() async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images.add(File(pickedFile.path));
      });
    }
  }
  Future<void> _uploadFromGallery() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();  // Pick multiple images
    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        images.addAll(pickedFiles.map((file) => File(file.path)).toList());  // Add all selected images to the list
      });
    }
  }


  // Future<void> _uploadFromGallery() async {
  //   final List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();
  //   if (pickedFiles != null) {
  //     setState(() {
  //       images.addAll(pickedFiles.map((file) => File(file.path)).toList());
  //     });
  //   }
  // }

  void _removeImage(int index) {
    setState(() {
      images.removeAt(index);
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
    print(widget.disaster?.id);
    if (images.isNotEmpty) {

      context.read<AddressBloc>().add(uploadclothes(
        disasterId: widget.disaster?.id??0,
        //images: images,
        images: images
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select images first')),
      );
    }
  }


  // Future<List<File>> _pickImage() async {
  //   final List<XFile>? pickedFiles = await _picker.pickMultiImage();
  //   if (pickedFiles != null && pickedFiles.isNotEmpty) {
  //     return pickedFiles.map((file) => File(file.path)).toList();
  //   }
  //   return [];
  // }

  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio();



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

                print("image uploading");
              }
              else if (state is AddressError) {
                // Dismiss loading indicator and show error message
                Navigator.pop(context);
                print('Error: ${state.message}');
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
                child: images.isEmpty
                    ? Center(child: Text('No images selected.'))
                    : SizedBox(
                  height: 400.h,  // Adjust height as needed
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
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
                                images[index],
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
                    color: Colors.black12,
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
              ),
SizedBox(height: 50.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(" Selected Disaster :   ",style: CustomFont().subtitleText,),
                    Text(widget.disaster?.name??"jjj",style: CustomFont().bodyText,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('auth_token');
    print("stringvalueee${stringValue}");
    return stringValue;
  }
  // void _uploadImages() async {
  //   final List<XFile>? images = await _picker.pickMultiImage();
  //   if (images != null && images.isNotEmpty) {
  //     List<XFile> imageFiles = images.map((image) => XFile(image.path)).toList();
  //     //uploadImagesDIO(imageFiles);
  //   }
  // }

  Future<XFile?> compressImage(XFile file) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final compressedFilePath = path.join(tempDir.path, '${DateTime.now().millisecondsSinceEpoch}_compressed.jpg');
print("compressedFilePath${compressedFilePath}");
      final compressedFile = await FlutterImageCompress.compressAndGetFile(
        file.path,
        compressedFilePath,
        quality: 88,
      );

      return compressedFile != null ? XFile(compressedFilePath) : null;
    } catch (e) {
      print('Error compressing image: $e');
      return null;
    }
  }



  Future<void> uploadImagesDIO(List<XFile> images) async {
    final String uploadUrl = 'http://18.143.206.136/api/donations/';
    print("uploadding herr ");

    final String? token = await getToken();
    var data = FormData.fromMap({
      'images': [
        await MultipartFile.fromFile('postman-cloud:///1ef65241-56fc-4810-8d59-41a04e9bde84', filename: 'postman-cloud:///1ef65241-56fc-4810-8d59-41a04e9bde84'),
        await MultipartFile.fromFile('postman-cloud:///1ef644f3-796f-4a10-9df7-4a1bc2ed8667', filename: 'postman-cloud:///1ef644f3-796f-4a10-9df7-4a1bc2ed8667'),
        await MultipartFile.fromFile('postman-cloud:///1ef644f3-796f-4a10-9df7-4a1bc2ed8667', filename: 'postman-cloud:///1ef644f3-796f-4a10-9df7-4a1bc2ed8667'),
        await MultipartFile.fromFile('postman-cloud:///1ef644f3-796f-4a10-9df7-4a1bc2ed8667', filename: 'postman-cloud:///1ef644f3-796f-4a10-9df7-4a1bc2ed8667'),
        await MultipartFile.fromFile('postman-cloud:///1ef644f3-796f-4a10-9df7-4a1bc2ed8667', filename: 'postman-cloud:///1ef644f3-796f-4a10-9df7-4a1bc2ed8667'),
        await MultipartFile.fromFile('postman-cloud:///1ef644f3-796f-4a10-9df7-4a1bc2ed8667', filename: 'postman-cloud:///1ef644f3-796f-4a10-9df7-4a1bc2ed8667')
      ],
      'disaster':  widget.disaster?.id
    });

    try {

      List<XFile> compressedImages = (await Future.wait(
          images.map((image) async {
            return await compressImage(image);
          })
      )).whereType<XFile>().toList();

      List<MultipartFile> files = compressedImages.map((image) {
        return MultipartFile.fromFileSync(
          image.path,
          filename: path.basename(image.path),
        );
      }).toList();

      final FormData formData = FormData.fromMap({
        'images': files,
        'disaster': widget.disaster?.id,
      });
      final response = await _dio.post(uploadUrl, data: FormData,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Images uploaded successfully');
      } else {
        print('Failed to upload images: ${response.statusCode}');
        print('Response body: ${response.data}');
      }
    } catch (e) {
      print('Error uploading images: $e');
    }
  }



  // Future<void> uploadDressDonation(
  //     String token,
  //     int disasterId,
  //     int menDresses,
  //     int womenDresses,
  //     int kidsDresses,
  //     int pickupLocationId,
  //     List<File> images) async {
  //   var uri = Uri.parse('http://yourapiurl.com/api/dress-donation/');
  //   var request = http.MultipartRequest('POST', uri);
  //
  //   request.headers['Authorization'] = 'Bearer $token';
  //   request.fields['disaster'] = disasterId.toString();
  //
  //
  //   for (var image in images) {
  //     var stream = http.ByteStream(image.openRead());
  //     var length = await image.length();
  //     var multipartFile = http.MultipartFile('images', stream, length,
  //         filename: image.path.split('/').last);
  //     request.files.add(multipartFile);
  //   }
  //
  //   var response = await request.send();
  //
  //   if (response.statusCode == 201) {
  //     print('Dress donation recorded successfully.');
  //   } else {
  //     print('Failed to record dress donation.');
  //   }
  // }



}
