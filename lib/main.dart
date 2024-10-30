// ignore_for_file: depend_on_referenced_packages

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/core/injection/auth_injection.dart';
import 'package:malahi_app/core/injection/home_client_injection.dart';
import 'package:malahi_app/core/injection/pack_injection.dart';
import 'package:malahi_app/core/injection/ticket_injection.dart';
import 'package:malahi_app/features/splash/presentation/controllers/splash_content_controller.dart';
import 'package:malahi_app/features/splash/presentation/pages/splash_screen.dart';
import 'package:malahi_app/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart'; // Import Provider package
import 'package:malahi_app/features/tabs/domain/tabs_controller.dart'; // Import your TabsController

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(child: MyApp(),
    supportedLocales: [Locale('en'), Locale('ar')],
    path: "assets/langs",
    startLocale: Locale('ar'),
    saveLocale: true,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabsController(), // Initialize the TabsController
      child: MultiBlocProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SplashContentController()),
          AuthInjection()
              .authCubit, // Use the AuthInjection to provide AuthCubit
          HomeClientInjection().homeClientCubit,
          TicketInjection().ticketsCubit,
          PackInjection().packsCubit,
        ],
        child: MaterialApp(
          localizationsDelegates:context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
  //         localeResolutionCallback: (locale, supportedLocales) {
  // if (locale?.languageCode == 'ar') {
  //   return const Locale('ar');
  // }
  // return const Locale('en');
//},
          // localeResolutionCallback: (locale, supportedLocales) {
          //   // Return the Arabic locale by default
          //   return const Locale('ar');
          // },
          debugShowCheckedModeBanner: false,
          
          title: 'ملاهي', // Your app name in Arabic
          theme: ThemeData(
            textTheme: GoogleFonts
                .ibmPlexSansArabicTextTheme(), // Set the font globally
            primaryColor: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
          ),
          initialRoute: '/', // Set your initial route
          onGenerateRoute: generateRoute,
          // home: TabsPage(), // Set your initial page (e.g., SplashScreen)
          home: SplashScreen(), // Set your initial page (e.g., SplashScreen)
        ),
      ),
    );
  }
}
