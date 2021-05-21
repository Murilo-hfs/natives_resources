import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recursos_nativos/providers/great_places.dart';
import 'package:recursos_nativos/screens/place_form_screen.dart';
import 'package:recursos_nativos/screens/place_list_screen.dart';
import 'package:recursos_nativos/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => GreatPlaces(),
          child: MaterialApp(
        title: 'Natives Resources',
        theme: ThemeData(
          accentColor: Colors.amber,
          primarySwatch: Colors.indigo,
        ),
        home: PlaceListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => PlaceFormScreen(),
        },
      ),
    );
  }
}

