import 'package:e_commerce/constants.dart';
import 'package:e_commerce/pages/home__page.dart';
import 'package:e_commerce/pages/loging_page.dart';
import 'package:e_commerce/pages/products_list_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        )),
        home: LandingPage());
  }
}

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        //if snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }

        //Connection initiliazed - Firebase App is running

        if (snapshot.connectionState == ConnectionState.done) {
          //StreamBuilder can chack the loginstate live
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamsnapshot) {
              //if streamsnapshot has error
              if (streamsnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamsnapshot.error}"),
                  ),
                );
              }

              if (streamsnapshot.connectionState == ConnectionState.active) {
                //get the user
                User _user = streamsnapshot.data;

                if (_user == null) {
                  //user not logged in,head to login
                  return LoginPage();
                } else {
                  //the user is logged in,head to homepage
                  return ProductListPage();
                }
              }

              //checking the auth state - loading

              return Scaffold(
                body: Center(
                  child: Text(
                    "Checking Authentication...",
                    style: Constants.regularHeading,
                  ),
                ),
              );
            },
          );
        }

        //Connecting to Firebase - loading

        return Scaffold(
          body: Center(
            child: Text(
              "Intiliazation App...",
              style: Constants.regularHeading,
            ),
          ),
        );
      },
    );
  }
}
