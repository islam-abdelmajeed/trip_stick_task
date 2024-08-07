import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/cubit/home_cubit_cubit.dart';
import 'features/home/data/repository/home_repository.dart';
import 'features/home/ui/home.dart';

class TripStickApp extends StatelessWidget {
  const TripStickApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => HomeCubitCubit(homeRepo: HomeRepository())..getPosts(),
          child: const HomePage(),
        ),
      ),
    );
  }
}
