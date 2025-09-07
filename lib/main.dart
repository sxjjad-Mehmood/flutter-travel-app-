import 'package:airbnbproject/Models/categorymodel.dart';
import 'package:airbnbproject/firebase_options.dart';
import 'package:airbnbproject/provider/favouriteprovider.dart';
import 'package:airbnbproject/views/homescreen.dart';
import 'package:airbnbproject/views/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Favouriteprovider(),
        )
      ],
      child: MaterialApp(
          title: 'Travel APP',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return homescreen();
                } else {
                  return loginscreen();
                }
              })),
    );
  }
}

class uploaddata extends StatelessWidget {
  const uploaddata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              savecategory();
            },
            child: Text("upload the data")),
      ),
    );
  }
}
