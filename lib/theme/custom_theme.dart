import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTheme extends InheritedWidget{
  const CustomTheme({
    Key? key,
    required this.textTheme,
    required this.colorTheme,
    required Widget child,
  }) : super(key: key, child: child);

  final AppTextStyles textTheme;
  final AppColors colorTheme;

  static CustomTheme? of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType<CustomTheme>();

  @override 
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

extension CustomThemeExtension on BuildContext{
  CustomTheme get themes{
    final theme = CustomTheme.of(this);
    assert(theme != null);
    return theme!;
  }

  AppTextStyles get textTheme{
    final theme = CustomTheme.of(this);
    assert(theme != null);
    return theme!.textTheme;
  }

  AppColors get colors{
    final theme = CustomTheme.of(this);
    assert(theme != null);
    return theme!.colorTheme;
  }
}

class AppTextStyles{
  AppTextStyles( 
    this.fontFamily,
    this.heading1,
    this.heading2,
    this.subheading1,
    this.body,
    this.button,
  );
  
  factory AppTextStyles.poppins(){
    const fontFamily = "Poppins";
    
    final TextStyle heading1 = TextStyle(  
      fontFamily: fontFamily,
      fontSize: 36.sp,
      fontWeight: FontWeight.w700,
    );

    final TextStyle heading2 = TextStyle(  
      fontFamily: fontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    );

    final TextStyle subheading1 = TextStyle(  
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );

    final TextStyle body = TextStyle(  
      fontFamily: fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    );

    final TextStyle button = TextStyle(  
      fontFamily: fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );

    return AppTextStyles( 
      fontFamily,
      heading1,
      heading2,
      subheading1,
      body,
      button,
    );
  }

  final String fontFamily;
  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle subheading1;
  final TextStyle body;
  final TextStyle button;
}

class AppColors{ 
  AppColors( 
    this.primaryColor,
    this.secondaryColor,
    this.dark,
    this.hintFilled,
    this.white,
  );

  factory AppColors.blue(){
    const Color primaryColor = Color(0xFF242A32);
    const Color secondaryColor = Color(0xFF4FCCA3);
    const Color dark = Color(0xFF3A3F47);
    const Color hintFilled = Color(0xFFEEEEEE);
    const Color white = Color(0xFFFFFFFF);

    return AppColors( 
      primaryColor,
      secondaryColor,
      dark,
      hintFilled,
      white,
    );
  }

  final Color primaryColor;
  final Color secondaryColor;
  final Color dark;
  final Color hintFilled;
  final Color white;
}

