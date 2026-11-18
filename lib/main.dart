// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_run_tracker_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  // ---------กำหนดค่าของ Supabase ที่จะทำงานด้วย-------
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url:'https://wsxrzakcfbyyjudmfkft.supabase.co',
    publishableKey: 'sb_publishable_R8niykFqQ6g0jhCQk-nPQA_4nJwSZrW',
  );

  // ----------------------------------

  runApp(FlutterRunTrackerApp());
}
class FlutterRunTrackerApp extends StatefulWidget {
  const FlutterRunTrackerApp({super.key});

  @override
  State<FlutterRunTrackerApp> createState() => _FlutterRunTrackerAppState();
}

class _FlutterRunTrackerAppState extends State<FlutterRunTrackerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreenUi(),
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: GoogleFonts.kanit().fontFamily,
          fontFamilyFallback: GoogleFonts.kanit().fontFamilyFallback
        ),
      ),
    );
  }
}
