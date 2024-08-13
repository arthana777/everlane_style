import 'package:everlane_style/profile/edit_profile.dart';
import 'package:everlane_style/sigin_page/sigin_page.dart';
import 'package:everlane_style/whishlist/whishlist.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:everlane_style/widgets/profile_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> removeToken() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');
    }

    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: PreferredSize(preferredSize: Size.fromHeight(80.h), child: CustomAppBar(
        text: "Profile",
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10).r,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage(
                    "asset/images/images (2).jpg",
                  ),
                  backgroundColor: Colors.white,
                  maxRadius: 60.r,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "user",
                  style: CustomFont().titleText,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      child: Container(
                        height: 110.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopify_rounded,
                              color: CustomColor.primaryColor,
                              size: 30,
                            )),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 110.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Whishlist(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: CustomColor.primaryColor,
                              size: 30,
                            )),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 110.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.attach_money_rounded,
                            color: CustomColor.primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ProfileTextfield(
                  icon: Icons.edit_document,
                  title: "Edit Profile",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(),
                      ),
                    );
                  },
                ),
                ProfileTextfield(
                  icon: Icons.notifications_active,
                  title: "Notifications(13)",
                  onTap: () {},
                ),
                ProfileTextfield(
                  icon: Icons.delete_sweep,
                  title: "Delete Account",
                  onTap: () {},
                ),
                ProfileTextfield(
                  icon: Icons.card_giftcard_rounded,
                  title: "Refer& Earn",
                  onTap: () {},
                ),
                ProfileTextfield(
                  icon: Icons.policy_outlined,
                  title: "Policies",
                  onTap: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).w,
                    ),
                  ),
                  onPressed: () {
                    removeToken();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SiginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Logout",
                    style: CustomFont().buttontext,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
