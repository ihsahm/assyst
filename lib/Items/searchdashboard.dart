import 'package:assyst/Screens/Pages/populardealers.dart';
import 'package:assyst/Screens/Pages/popularpage.dart';
import 'package:flutter/material.dart';

class SearchDashboard extends StatefulWidget {
  @override
  _SearchDashboardState createState() => _SearchDashboardState();
}

class _SearchDashboardState extends State<SearchDashboard> {
  TextEditingController searchController = TextEditingController();
  var checkedValue1;
  var checkedValue2;
  var checkedValue3;
  var checkedValue4;
  var checkedValue5;
  var checkedValue6;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(1.0, 0.5),
                    blurRadius: 6.0,
                  )
                ]),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Column(
              children: [
                TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                        onPressed: () => searchController.clear(),
                      ),
                      hintText: 'Search for a car...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(80))),
                    )),
                SizedBox(
                  height: 10,
                ),
                /* Text(
                  'Filter',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text('Model'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: ButtonTheme(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  border: const OutlineInputBorder(),
                                ),
                                validator: (value) =>
                                    value == null ? 'Enter car name' : null,
                                value: checkedValue1,
                                hint: Text('Select car name'),
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValue1 = newValue;
                                  });
                                },
                                items: <String>[
                                  'AMCE',
                                  'Alfa Romeo',
                                  'Apache',
                                  'Aston Martin',
                                  'Astra',
                                  'Audi',
                                  'BMW',
                                  'BYD',
                                  'Baja',
                                  'CMC',
                                  'Cadillac',
                                  'Chery',
                                  'Chevrolet',
                                  'DAF',
                                  'Dacia',
                                  'Daewoo',
                                  'Datsun',
                                  'Dodge',
                                  'Dongfeng',
                                  'FAW',
                                  'Fiat',
                                  'Ford',
                                  'Foton',
                                  'GMC',
                                  'Geely',
                                  'Great Wall',
                                  'HAIMA',
                                  'Holland Car',
                                  'Honda',
                                  'Hummer',
                                  'Hyundai',
                                  'Infiniti',
                                  'Isuzu',
                                  'Iveco',
                                  'JAC',
                                  'JMC',
                                  'Jaguar',
                                  'Jeep',
                                  'Jin Bei',
                                  'Kia',
                                  'Lada',
                                  'Lamborghini',
                                  'Land Rover',
                                  'Lexus',
                                  'Lifan',
                                  'Luxgen',
                                  'Mahindra',
                                  'Mazda',
                                  'Mercedes-Benz',
                                  'Mini Cooper',
                                  'Mitsubishi'
                                      'Nissan',
                                  'Peugeot',
                                  'Piaggio',
                                  'Porsche',
                                  'Pulsar',
                                  'Ram',
                                  'Range Rover',
                                  'Renault',
                                  'Scania',
                                  'Sinotruk',
                                  'Smart',
                                  'SsangYong',
                                  'Subaru',
                                  'Suzuki',
                                  'TATA',
                                  'Tesla',
                                  'Toyota',
                                  'VAZ',
                                  'Volkswagen',
                                  'Yamaha',
                                  'Zotye',
                                  'Other Brand',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text('Budget'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: DropdownButtonFormField<String>(
                          hint: Text('Select budget'),
                          decoration: const InputDecoration(
                            border: const OutlineInputBorder(),
                          ),
                          value: checkedValue2,
                          onChanged: (String newValue) {
                            setState(() {
                              checkedValue2 = newValue;
                            });
                          },
                          items: <String>[
                            'Up to 250,000 Br.',
                            'Up to 500,000 Br.',
                            'Up to 1,000,000 Br.',
                            'Up to 1,500,000 Br.',
                            'Up to 2,000,000 Br.',
                            'Up to 2,500,000 Br.',
                            'Up to 3,000,000 Br.',
                            'No limit'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text('Condition'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: DropdownButtonFormField<String>(
                          hint: Text('Select condition'),
                          decoration: const InputDecoration(
                            border: const OutlineInputBorder(),
                          ),
                          value: checkedValue3,
                          onChanged: (String newValue) {
                            setState(() {
                              checkedValue3 = newValue;
                            });
                          },
                          items: <String>['Used', 'New', 'Used Abroad']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text('Fuel'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: DropdownButtonFormField<String>(
                          hint: Text('Select fuel type'),
                          decoration: const InputDecoration(
                            border: const OutlineInputBorder(),
                          ),
                          value: checkedValue4,
                          onChanged: (String newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          items: <String>['Benzene', 'Diesel(Nafta)']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(title: Text('Transmission'), children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          hint: Text('Select transmission'),
                          decoration: const InputDecoration(
                            border: const OutlineInputBorder(),
                          ),
                          value: checkedValue5,
                          onChanged: (String newValue) {
                            setState(() {
                              checkedValue5 = newValue;
                            });
                          },
                          items: <String>['Automatic', 'Manual', 'CVT', 'Both']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonTheme(
                  minWidth: double.infinity,
                  height: 50,
                  child: FlatButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text(
                        'Apply',
                        style: TextStyle(color: Colors.white),
                      )),
                )*/
              ],
            ),
          )
        ],
      ),
    );
  }
}
