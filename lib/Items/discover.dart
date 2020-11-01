import 'package:assyst/Screens/Pages/popularpage.dart';
import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  var Products_on_car = [
    {
      "name": "Toyota",
      "picture": "assets/carlogo/toyota1.png",
    },
    {
      "name": "Nissan",
      "picture": "assets/carlogo/nissan.jpg",
    },
    {
      "name": "Mercedes Benz",
      "picture": "assets/carlogo/mercedes.png",
    },
    {
      "name": "Hyundai",
      "picture": "assets/carlogo/hyundai.jpg",
    },
    {
      "name": "BMW",
      "picture": "assets/carlogo/bmw.png",
    },
    {
      "name": "Isuzu",
      "picture": "assets/carlogo/isuzu.png",
    },
    {
      "name": "Ford",
      "picture": "assets/carlogo/ford.png",
    },
    {
      "name": "Suzuki",
      "picture": "assets/carlogo/suzuki.png",
    },
    {
      "name": "Kia",
      "picture": "assets/carlogo/kia.png",
    },
    {
      "name": "Mitsubishi",
      "picture": "assets/carlogo/mitsubishi.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Single_favorite(
          car_prod_name: Products_on_car[index]["name"],
          car_prod_picture: Products_on_car[index]["picture"],
        );
      },
      itemCount: Products_on_car.length,
    );
  }
}

class Single_favorite extends StatelessWidget {
  final car_prod_name;
  final car_prod_picture;

  Single_favorite({this.car_prod_name, this.car_prod_picture});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 3, right: 3),
      elevation: 1,
      child: InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => new PopularCar(
                  car_name: car_prod_name,
                ))),
        child: GridTile(
          child: Image.asset(
            car_prod_picture,
          ),
        ),
      ),
    );
  }
}
