import 'dart:io';
import 'package:assyst/Database/ProductsDB/notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:assyst/Database/ProductsDB/productdata.dart';
//import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:uuid/uuid.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String productName;
  String price;
  String mileage;
  String negotiable;
  String location;
  String description;
  String imageUrl;
  String fuel;
  var currentSelectedValue;
  var currentSelectedValue1;
  var currentSelectedValue2;
  var currentSelectedValue3;
  var currentSelectedValue4;
  var currentSelectedValue5;
  var currentSelectedValue6;

  var currentSelectedValue7;
  String year;
  String condition;
  String color;
  String phoneNumber;
  String transmission;
  QuerySnapshot items;
  File _image1;
  //File _image2;
  // File _image3;

  File file;
  final imagePicker = ImagePicker();
  ProductService productService = ProductService();
  String locationdropdownValue = 'Addis Ababa';
  String negotiabledropdownValue = 'Not negotiable';
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  int _checkboxValue;
  final now = DateTime.now();

  TextEditingController yearController = TextEditingController();
  String fueldropdownValue = 'Benzene';
  String conditiondropdownValue = 'Used';
  String transmissiondropdownValue = 'Automatic';
  bool isLoading = false;

  crudMethods crudObj = new crudMethods();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        items = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Post an item',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Builder(
        builder: (context) => Container(
          margin: EdgeInsets.fromLTRB(10, 1, 10, 10),
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 1.0,
                    )
                  ]),
              child: SingleChildScrollView(
                child: isLoading
                    ? Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  'Please wait a while your product is being added'),
                            ],
                          ),
                        ),
                      )
                    : Column(children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: ClipOval(
                                  child: (_image1 !=
                                          null) //&&_image3!= null&&_image2!= null)
                                      ? Image.file(
                                          _image1,
                                          fit: BoxFit.cover,
                                        )
                                      : Icon(Icons.add)),
                            ),
                            /*  CircleAvatar(
                              radius: 30,
                              child: ClipOval(
                                  child: (_image2 != null)
                                      ? Image.file(
                                          _image2,
                                          fit: BoxFit.fill,
                                        )
                                      : Icon(Icons.add)),
                            ),
                            CircleAvatar(
                              radius: 30,
                              child: ClipOval(
                                  child: (_image3 != null)
                                      ? Image.file(
                                          _image3,
                                          fit: BoxFit.fill,
                                        )
                                      : Icon(Icons.add)),
                            ),

                            CircleAvatar(
                              radius: 30,
                              child: ClipOval(
                                  child: (_image3 != null)
                                      ? Image.file(
                                          _image3,
                                          fit: BoxFit.fill,
                                        )
                                      : Icon(Icons.add)),
                            ),

                            CircleAvatar(
                              radius: 30,
                              child: ClipOval(
                                  child: (_image3 != null)
                                      ? Image.file(
                                          _image3,
                                          fit: BoxFit.fill,
                                        )
                                      : Icon(Icons.add)),
                            ),*/
                          ],
                        ),
                        SizedBox(height: 5),
                        ButtonTheme(
                          minWidth: 150.0,
                          height: 50.0,
                          buttonColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                          textTheme: ButtonTextTheme.accent,
                          child: OutlineButton.icon(
                            onPressed: () {
                              getImage();
                            },
                            icon: Icon(
                              Icons.photo,
                              color: Colors.blue,
                            ),
                            label: Text(
                              'Click here to add a photo of your car',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        /*  TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter car name';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            this.productName = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: 'Car name',
                              prefixIcon: Icon(Icons.comment)),
                          textCapitalization: TextCapitalization.words,
                        ),*/

                        ButtonTheme(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                border: const OutlineInputBorder(),
                              ),
                              validator: (value) =>
                                  value == null ? 'Enter car name' : null,
                              value: currentSelectedValue6,
                              hint: Text('Car Name'),
                              onChanged: (newValue) {
                                setState(() {
                                  currentSelectedValue6 = newValue;
                                  this.productName = newValue;
                                });
                              },
                              items: <String>[
                                'Abay',
                                'AMCE',
                                'Alfa Romeo',
                                'Apache',
                                'Astra',
                                'Audi',
                                'BMW',
                                'BYD',
                                'Bajaj',
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
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter your phone number';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            this.phoneNumber = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: 'Phone Number',
                              prefixIcon: Icon(Icons.phone)),
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter item price';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              this.price = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                labelText: 'Price',
                                prefixIcon: Icon(Icons.attach_money))),
                        SizedBox(height: 10),
                        ButtonTheme(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                border: const OutlineInputBorder(),
                              ),
                              validator: (value) =>
                                  value == null ? 'Enter year of make' : null,
                              value: currentSelectedValue7,
                              hint: Text('Year made'),
                              onChanged: (newValue) {
                                setState(() {
                                  currentSelectedValue7 = newValue;
                                  this.year = newValue;
                                });
                              },
                               items: <String>[
                                  '2021' ,  '2020', 	'2019' ,	'2018', 	'2017' ,	'2016', 	'2015' ,	'2014' ,	'2013' ,	'2012' ,	'2011',
                                  '2010' ,	'2009', 	'2008' ,	'2007', 	'2006' ,	'2005', 	'2004' ,	'2003' ,	'2002' ,	'2001',
                                  '2000' ,	'1999' ,	'1998' ,	'1997',	'1996', '1995', 	'1994' ,	'1993' ,	'1992' ,	'1991',
                                  '1990' ,	'1989' ,	'1988' ,	'1987' ,	'1986' ,	'1985' ,	'1984' 	,'1983' ,	'1982' ,	'1981',
                                  '1980' ,	'1979' ,	'1978' ,	'1977' ,	'1976' ,	'1975' ,	'1974'	,'1973' ,	'1972' ,	'1971',
                                  '1970' ,	'1969' ,	'1968' ,	'1967' ,	'1966' ,	'1965' ,	'1964' 	,'1963' ,	'1962' ,	'1961',
                                  '1960' ,	'1959' ,	'1958' ,	'1957' ,	'1956' ,	'1955' ,	'1954'	,'1953' ,	'1952' ,	'1951',
                                  '1950' ,	'1949' ,	'1948' ,	'1947' ,	'1946' ,	'1945' ,	'1944' 	,'1943' ,	'1942' ,	'1941','1940' ,
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ButtonTheme(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                border: const OutlineInputBorder(),
                              ),
                              validator: (value) =>
                                  value == null ? 'Enter fuel type' : null,
                              value: currentSelectedValue1,
                              hint: Text('Fuel type'),
                              onChanged: (newValue) {
                                setState(() {
                                  currentSelectedValue1 = newValue;
                                  this.fuel = newValue;
                                });
                              },
                              items: <String>[
                                'Benzene',
                                'Diesel(Nafta)',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'You must enter mileage';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            this.mileage = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: 'Mileage',
                              prefixIcon: Icon(Icons.confirmation_number)),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        ButtonTheme(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                border: const OutlineInputBorder(),
                              ),
                              validator: (value) => value == null
                                  ? 'Enter car negotiablility'
                                  : null,
                              hint: Text('Negotiable'),
                              value: currentSelectedValue2,
                              onChanged: (newValue) {
                                setState(() {
                                  currentSelectedValue2 = newValue;
                                });

                                this.negotiable = newValue;
                              },
                              items: <String>[
                                'Negotiable',
                                'Not negotiable',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: const OutlineInputBorder(),
                            ),
                            validator: (value) =>
                                value == null ? 'Enter car transmission' : null,
                            hint: Text('Transmission'),
                            value: currentSelectedValue3,
                            onChanged: (String newValue) {
                              setState(() {
                                currentSelectedValue3 = newValue;
                              });
                              this.transmission = newValue;
                            },
                            items: <String>[
                              'Automatic',
                              'Manual',
                              'CVT',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ButtonTheme(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: const OutlineInputBorder(),
                            ),
                            validator: (value) =>
                                value == null ? 'Enter car condition' : null,
                            hint: Text('Condition'),
                            value: currentSelectedValue4,
                            onChanged: (String newValue) {
                              setState(() {
                                currentSelectedValue4 = newValue;
                              });
                              this.condition = newValue;
                            },
                            items: <String>[
                              'Used',
                              'New',
                              'Used abroad',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            this.description = value;
                          },
                          textCapitalization: TextCapitalization.sentences,
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Description(optional)',
                            prefixIcon: Icon(Icons.add_comment),
                          ),
                        ),
                        SizedBox(height: 10),
                        ButtonTheme(
                            minWidth: 200.0,
                            height: 50.0,
                            buttonColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                uploadImageandSaveItem();
                                // validateandUpload();
                              },
                              child: Text(
                                'Post',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blue,
                            )),
                        SizedBox(height: 30)
                      ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    // if (_image1 != null) {
    setState(() {
      _image1 = File(image.path);
      // _image2 = File(image.path);
      // _image3 = File(image.path);
    });
    /*} else {
      return null;
    }*/
  }

  Future<String> uploadImageandSaveItem() async {
    String imageDownloadUrl = await uploadItemImage(_image1);
    //if (imageDownloadUrl != null) {
    /* } else {
      return null;
    }*/
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if (productName.isNotEmpty) {
        if (price.isNotEmpty) {
          saveItem(imageDownloadUrl);
          _formKey.currentState.reset();
          setState(() => isLoading = false);
        } else {
          setState(() => isLoading = false);
          Fluttertoast.showToast(
              msg: 'Enter a name', backgroundColor: Colors.grey);
          Fluttertoast.showToast(
              msg: 'Item added', backgroundColor: Colors.black);
        }
      } else if (_image1 == null) {
        setState(() => isLoading = false);
        Fluttertoast.showToast(
            msg: 'Enter an image', backgroundColor: Colors.grey);
      }
    }
  }

  Future<String> uploadItemImage(file) async {
    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child("foodlist");

    StorageUploadTask task = storageReference
        .child("${DateTime.now().millisecondsSinceEpoch}")
        .putFile(_image1);
    StorageTaskSnapshot taskSnapshot = await task.onComplete;
    String downloadurl = await taskSnapshot.ref.getDownloadURL();
    return downloadurl;
  }

  saveItem(imageDownloadUrl) {
    var id = Uuid();
    String productId = id.v1();
    /*List<String> splitList=productName.split('');
    List<String> indexList=[];
    for(int i=0;i < splitList.length;i++){
      for(int j=0;j<splitList[i].length+i;j++){
        indexList.add(splitList[i].substring(0,j).toLowerCase());
      }
      
    }*/
    final itemsRef = FirebaseFirestore.instance.collection("itemlist");

    itemsRef.doc(productId).set({
      'productName': productName,
      'price': price,
      'description': description,
      //'searchIndex': indexList,
      'image': imageDownloadUrl,
      'transmission': transmission,
      'fuel': fuel,
      'phoneNumber': phoneNumber,
      'condition': condition,
      'mileage': mileage,
      'year': year,
      'negotiable': negotiable
    });
  }
}
