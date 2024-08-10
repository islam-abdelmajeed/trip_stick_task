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
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSuccessState) {
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBarWidget(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                              Image.asset(AppImages.tripStickLogo, scale: 2),
                              const Spacer(),
                              Image.asset(AppImages.favoriteIcon, scale: 2),
                              6.widthBox,
                              Image.asset(AppImages.notificationIcon, scale: 2),
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
                                      ),
                                    )
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
                                      ),
                                    )
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
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.travelInspirationList.length,
                        itemBuilder: (context, index) {
                          return state.travelInspirationList[index].type == 'destination_list'
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    30.heightBox,
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                                      child: TitleText(
                                        title: state.travelInspirationList[index].title,
                                      ),
                                    ),
                                    8.heightBox,
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                                      child: DescriptionText(
                                        description: state.travelInspirationList[index].subTitle,
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
                                        separatorBuilder: (context, indexList) => 15.widthBox,
                                        itemCount: state.travelInspirationList[index].list?.length ?? 0,
                                        itemBuilder: (context, indexList) {
                                          return CityCard(
                                            image: state.travelInspirationList[index].list?[indexList].imageUrl ??
                                                'https://cdn.britannica.com/15/189715-050-4310222B/Dubai-United-Arab-Emirates-Burj-Khalifa-top.jpg',
                                            title: state.travelInspirationList[index].list?[indexList].title ?? "",
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : state.travelInspirationList[index].type == 'featured_destination'
                                  ? BannerWidget(
                                      right: 0.30.sw,
                                      height: 0.5.sh,
                                      image: state.travelInspirationList[index].imageUrl ??
                                          'https://cdn.britannica.com/15/189715-050-4310222B/Dubai-United-Arab-Emirates-Burj-Khalifa-top.jpg',
                                      title: state.travelInspirationList[index].title ?? "",
                                      description: state.travelInspirationList[index].subTitle ?? '',
                                      textButton: "Let's go",
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OfferScreen()));
                                      },
                                    )
                                  : BannerWidget(
                                      right: 0.30.sw,
                                      height: 0.5.sh,
                                      image: state.travelInspirationList[index].imageUrl ??
                                          'https://cdn.britannica.com/15/189715-050-4310222B/Dubai-United-Arab-Emirates-Burj-Khalifa-top.jpg',
                                      title: state.travelInspirationList[index].title ?? "",
                                      description: state.travelInspirationList[index].subTitle ?? "",
                                      textButton: 'Explore',
                                      onPressed: () {},
                                    );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 30.heightBox;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          );
        }
      },
    );
  }
}
