import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/router/router.dart';
import 'package:movie_db/theme/custom_theme.dart';

final routerProvider = ChangeNotifierProvider<AppRouter>((ref){
  return AppRouter();
});

const fontFamily = 'Poppins';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final _appRouter = ref.watch(routerProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => CustomTheme(  
        textTheme: AppTextStyles.poppins(),
        colorTheme: AppColors.blue(),
        child: Builder(  
          builder: (context) => MaterialApp.router(  
            title: 'Movie Db',
            theme: ThemeData(  
              fontFamily: fontFamily,
            ).copyWith(
              appBarTheme: Theme.of(context).appBarTheme.copyWith(
                backgroundColor: context.colors.dark,
                titleTextStyle: context.textTheme.heading2.copyWith(
                  color: context.colors.white,
                ),
              ),
              primaryColor: context.colors.primaryColor,
              colorScheme: const ColorScheme.light().copyWith(
                primary: context.colors.white,
              ),
              scaffoldBackgroundColor: context.colors.primaryColor,
            ),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            builder: (BuildContext? context, Widget? child){
              return SizedBox(child: child);
            },
          ),
        ),
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SplashScreen'),
      ),
    );
  }
}