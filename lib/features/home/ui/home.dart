import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripstick/core/themes/app_images.dart';
import 'package:tripstick/core/themes/size_boxes.dart';
import 'package:tripstick/core/themes/styles.dart';
import 'package:tripstick/core/widgets/text_types.dart';
import 'package:tripstick/features/home/cubit/home_cubit_cubit.dart';
import 'package:tripstick/features/home/ui/offer_screen.dart';
import 'package:tripstick/features/home/ui/widgets/bottom_navigation_bar.dart';
import 'package:tripstick/features/home/ui/widgets/city_card.dart';
import 'package:tripstick/features/home/ui/widgets/banner_widget.dart';
import 'package:tripstick/features/home/ui/widgets/member_widget.dart';
import 'package:tripstick/features/home/ui/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubitCubit, HomeStates>(
        builder: (context, state) => state is HomeSuccessState
            ? Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: BottomNavigationBarWidget(
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      //** App Bar && TextFields **//
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Padding(
                              padding: EdgeInsets.only(top: 0.08.sh),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImages.tripStickLogo,
                                    scale: 2,
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    AppImages.favoriteIcon,
                                    scale: 2,
                                  ),
                                  6.widthBox,
                                  Image.asset(
                                    AppImages.notificationIcon,
                                    scale: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          18.heightBox,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: const SearchWidget(
                              hintText: 'Where to?',
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                          30.heightBox,
                          //** Two Cards **//
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 0.2.sh,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: 100.w,
                                            child: Image.asset(
                                              AppImages.planeIcon,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                          child: Text(
                                            'Travel inspiration',
                                            textAlign: TextAlign.start,
                                            style: Styles.text18Weight700Black,
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                                30.widthBox,
                                Expanded(
                                  child: Container(
                                    height: 0.2.sh,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: 100.w,
                                            child: Image.asset(
                                              AppImages.chooseIcon,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                          child: Text(
                                            'Why choose tripstick?',
                                            textAlign: TextAlign.start,
                                            style: Styles.text18Weight700Black,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //** Member Sign up **/
                          30.heightBox,
                          const MemberWidget(),
                          //** Explore Banner Widget **//
                          30.heightBox,
                          BannerWidget(
                            right: 0.30.sw,
                            height: 0.5.sh,
                            image: state.travelInspirationList[0].imageUrl!,
                            title: state.travelInspirationList[0].title,
                            description: state.travelInspirationList[0].subTitle,
                            textButton: 'Explore',
                            onPressed: () {},
                          ),
                          //** First ListView **//
                          30.heightBox,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: TitleText(
                              title: state.travelInspirationList[1].title,
                            ),
                          ),
                          8.heightBox,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: DescriptionText(
                              description: state.travelInspirationList[1].subTitle,
                            ),
                          ),
                          12.heightBox,
                          SizedBox(
                            height: 120.h,
                            child: ListView.separated(
                              padding: EdgeInsets.only(left: 25.w),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) => 15.widthBox,
                              itemCount: state.travelInspirationList[1].list!.length,
                              itemBuilder: (context, index) {
                                return CityCard(
                                  image: state.travelInspirationList[1].list![index].imageUrl,
                                  title: state.travelInspirationList[1].list![index].title,
                                );
                              },
                            ),
                          ),
                          //** Second ListView  **/
                          40.heightBox,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: TitleText(
                              title: state.travelInspirationList[2].title,
                            ),
                          ),
                          8.heightBox,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: DescriptionText(
                              description: state.travelInspirationList[2].subTitle,
                            ),
                          ),
                          12.heightBox,
                          SizedBox(
                            height: 120.h,
                            child: ListView.separated(
                              padding: EdgeInsets.only(left: 25.w),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) => 15.widthBox,
                              itemCount: state.travelInspirationList[2].list!.length,
                              itemBuilder: (context, index) {
                                return CityCard(
                                  image: state.travelInspirationList[2].list![index].imageUrl,
                                  title: state.travelInspirationList[2].list![index].title,
                                );
                              },
                            ),
                          ),
                          //** Offer Banner Widget **/
                          50.heightBox,
                          BannerWidget(
                            right: 0.30.sw,
                            height: 0.5.sh,
                            image: state.travelInspirationList[3].imageUrl!,
                            title: state.travelInspirationList[3].title,
                            description: state.travelInspirationList[3].subTitle,
                            textButton: "Let's go",
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OfferScreen()));
                            },
                          ),
                          50.heightBox,
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : state is HomeLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Scaffold(
                    body: Center(
                      child: Center(
                        child: Text('something went wrong'),
                      ),
                    ),
                  ));
  }
}
