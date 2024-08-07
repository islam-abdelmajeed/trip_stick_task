import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripstick/core/themes/app_images.dart';
import 'package:tripstick/core/themes/size_boxes.dart';
import 'package:tripstick/core/themes/styles.dart';
import 'package:tripstick/core/widgets/button_widget.dart';

class MemberWidget extends StatelessWidget {
  const MemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Are you a member?',
                        textAlign: TextAlign.start,
                        style: Styles.text18Weight700Black,
                      ),
                      Text(
                        'Prices drop the moment you sign up as a Tripstick member',
                        textAlign: TextAlign.start,
                        style: Styles.text12Weight500Black,
                      ),
                      12.heightBox,
                      ButtonWidget(
                        onPressed: () {},
                        text: 'Join',
                        color: Colors.black,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 160.h,
                  child: Image.asset(
                    AppImages.travelerPic,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Container(
            padding: EdgeInsets.all(14.sp),
            alignment: Alignment.topRight,
            child: const Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}
