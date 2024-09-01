import 'dart:async';

import 'package:feedonations/Provider/forget_password_provider.dart';
import 'package:feedonations/Provider/profilescreenprovider.dart';
import 'package:feedonations/Provider/signin_provider.dart';
import 'package:feedonations/Provider/signup_provider.dart';
import 'package:feedonations/Screens/nointernet.dart';
import 'package:feedonations/Utilis/images.dart';
import 'package:feedonations/firebase_options.dart';
import 'package:feedonations/screen/app_nav_bar.dart';
import 'package:feedonations/screen/auth_screen.dart';
import 'package:feedonations/screen/components/profile_detailed_tile.dart';
import 'package:feedonations/screen/components/receiver_profile_details_card.dart';
import 'package:feedonations/screen/donor_profiles.dart';
import 'package:feedonations/screen/product_details.dart';
import 'package:feedonations/screen/welcome_views/welcome.dart';
import 'package:feedonations/services/notification_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'Provider/homescreen_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await LocalNotificationService.requestPermission();
  await LocalNotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InternetStatus? connectionStatus;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late StreamSubscription<InternetStatus> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    _checkLoginStatus();
    super.dispose();
    LocalNotificationService.uploadFCMToken();
  }

  @override
  void initState() {
    super.initState();
    _subscription = InternetConnection().onStatusChange.listen((status) {
      setState(() {
        connectionStatus = status;
      });
    });
    _checkLoginStatus();
  }

  Future<bool> _checkLoginStatus() async {
    final user = _auth.currentUser;

    return user != null;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpAuthProvider(),
        ),
        ChangeNotifierProvider(create: (context) => SignInProviderAuth()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context) => ProfileScreenProvider()),
        // ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => ForgetPasswordProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fee Donations',
        home: FutureBuilder(
          future: _checkLoginStatus(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (connectionStatus == InternetStatus.disconnected) {
              return const NoInternet();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.data == true &&
                  connectionStatus == InternetStatus.connected &&
                  snapshot.hasData) {
                LocalNotificationService.uploadFCMToken();
                return const AppNavBar();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset(AppImages.donationImage)],
                    ),
                  ),
                );
              } else if (snapshot.data==false) {
                return  const Welcome();
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => HomeScreenProvider(),
//       child: MaterialApp(
//         title: 'Modal Sheet Example',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: YourMainWidget(),
//       ),
//     );
//   }
// }
//
// class HomeScreenProvider extends ChangeNotifier {
//   String selectedOption = '';
//
//   void setSelectedOption(String option) {
//     selectedOption = option;
//     notifyListeners();
//   }
// }

// class YourMainWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<HomeScreenProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Modal Sheet Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//
//           },
//           child: Text('Open Modal Sheet'),
//         ),
//       ),
//     );
//   }
//  }
// Dart Packages
// import 'dart:async';
//
// // Flutter Packages
// import 'package:flutter/material.dart';
//
// // This Package
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Internet Connection Checker Plus Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Internet Connection Checker Plus Demo'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   InternetStatus? _connectionStatus;
//   late StreamSubscription<InternetStatus> _subscription;
//
//   @override
//   void initState() {
//     super.initState();
//     _subscription = InternetConnection().onStatusChange.listen((status) {
//       setState(() {
//         _connectionStatus = status;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Your internet connection status is:',
//             ),
//             Text(
//               _connectionStatus?.toString() ?? 'Unknown',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
