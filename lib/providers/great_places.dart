import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:recursos_nativos/models/place.dart';
import 'package:recursos_nativos/utils/db_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPLaces() async{
    final dataList = await DbUtil.getData('places');
    _items = dataList.map(
      (item) => Place(
        id: item['id'],
        title: item['title'],
        image: File(item['image']),
        location: null,
      ),
    ).toList();
    notifyListeners();
  }

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemsByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );
    _items.add(newPlace);
    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
    notifyListeners();
  }
}
