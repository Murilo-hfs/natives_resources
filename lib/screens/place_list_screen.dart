import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recursos_nativos/providers/great_places.dart';
import 'package:recursos_nativos/utils/app_routes.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlaceListScreen'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPLaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text("Nenhum local cadastrado"),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0
                    ? ch
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.itemsByIndex(i).image,
                            ),
                          ),
                          title: Text(greatPlaces.itemsByIndex(i).title),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
