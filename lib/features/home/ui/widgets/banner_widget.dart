import 'package:flutter/material.dart';
import 'package:tripstick/core/themes/size_boxes.dart';
import 'package:tripstick/core/themes/styles.dart';
import 'package:tripstick/core/widgets/button_widget.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget(
      {super.key,
      required this.right,
      required this.height,
      required this.image,
      required this.title,
      required this.description,
      required this.textButton,
      required this.onPressed});
  final double? right;
  final double? height;
  final String image;
  final String title;
  final String description;
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: right,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.text22Weight700White,
                ),
                12.heightBox,
                Text(
                  description,
                  style: Styles.text14Weight400White,
                ),
                12.heightBox,
                ButtonWidget(
                  onPressed: onPressed,
                  text: textButton,
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
