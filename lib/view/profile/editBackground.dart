import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/userData/userCredentials.dart';
import '../widgets/all_app_bar.dart';

var EditProfile = [
  {"name": "تغيير الخلفية الاسم"},
  {"name": "تغيير اطار الاسم"},
  {"name": "تغيير شعار الاسم"},
  {"name": "تغير لون الاسم"},
  {"name": "اختر خلفية من جهازك"},
];

class EditBackground extends StatelessWidget {
  const EditBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarBuilder("تعديل خلفيات الاسم", true),
      body: SafeArea(
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          if (userType == "protectedWithBG" ||
                              userType == "VIPWithBG" ||
                              userType == "topVIP") {
                            Get.toNamed('/changeBackground');
                          } else {
                            Get.snackbar("خطأ",
                                "يجب ان تكون عضو مميز لتستطيع تغيير خلفية الاسم",
                                backgroundColor: Colors.red);
                          }
                        } else if (index == 1) {}
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.0.w, vertical: 3.h),
                              child: Text(
                                EditProfile[index]["name"]!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Portada",
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: const Divider(
                        color: Color(0xffDADADC),
                        thickness: 1,
                      ),
                    ),
                itemCount: EditProfile.length),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: const Divider(
                color: Color(0xffDADADC),
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
