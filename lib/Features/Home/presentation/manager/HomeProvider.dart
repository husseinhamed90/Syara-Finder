import 'package:flutter/cupertino.dart';

import '../../../../Shared/Componantes.dart';
import '../../../Cars/data/models/Car.dart';
import '../pages/HomePage/NavBarPages/BuildExplorePage.dart';
import '../pages/HomePage/NavBarPages/BuildFavouritesList.dart';
import '../pages/HomePage/NavBarPages/profile.dart';

class HomeProvider extends ChangeNotifier{
  //NavBar
  static const TextStyle optionStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  List<Widget> pages = <Widget>[ const buildExplorePage(),buildFavouritesList(),profile(),];
  int navBarSelectedIndex = 0;

  void onPageSelected(int index,BuildContext context) {
    navBarSelectedIndex = index;
    notifyListeners();
  }
  void returnNavBarToHome() {
    navBarSelectedIndex = 0;
    notifyListeners();
  }

  //favourites
  List<Car> favourites = [];
  void addToFavourites(Car car) {
    favourites.add(car);
    notifyListeners();
  }
  bool isCarlInFavourites(Car car) {
    for (int i = 0; i < favourites.length; i++) {
      if (favourites[i].id == car.id) {
        return true;
      }
    }
    return false;
  }
  void removeFromFavourites(Car car) {
    favourites.removeWhere((element) => element.id == car.id);
    notifyListeners();
  }
}