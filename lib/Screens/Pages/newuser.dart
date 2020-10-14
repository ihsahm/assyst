import 'package:assyst/Database/UserDB/newuserdb.dart';
import 'package:assyst/Shared/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class Newlogin extends StatefulWidget {
  @override
  _NewloginState createState() => _NewloginState();
}

class _NewloginState extends State<Newlogin> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  String userName;
  String phone;
  UserRegister userRegister = UserRegister();
  bool loading = false;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Navigation()),
              );
            },
            child: Container(
              margin: EdgeInsets.all(15),
              child: Text('Skip',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          InkWell(
            onTap: () {
              uploadUser();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Navigation()),
              );
            },
            child: Container(
              margin: EdgeInsets.all(15),
              child: Text('Next',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 100, 5, 20),
        child: Column(
          children: [
            Text(
              'Welcome to Assyst',
              style: TextStyle(fontSize: 21),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'You must enter full name';
                              } else if (value
                                  .contains('1,2,3,4,5,6,7,8,9,0')) {
                                return 'Invalid name';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              this.userName = value;
                            },
                            textCapitalization: TextCapitalization.words,
                            controller: nameController,
                            decoration: InputDecoration(labelText: 'Name')),
                        SizedBox(height: 20),
                        TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'You must enter your phone number';
                              } else if (value.length < 10) {
                                return 'Enter a valid number';
                              } else {
                                return null;
                              }
                            },
                            maxLength: 10,
                            onChanged: (value) {
                              this.phone = value;
                            },
                            // keyboardType: TextInputType.number,
                            controller: phoneController,
                            decoration:
                                InputDecoration(labelText: 'Add your phone')),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> uploadUser() async {
    //if (imageDownloadUrl != null) {
    /* } else {
      return null;
    }*/
    if (formKey.currentState.validate()) {
      if (userName.isNotEmpty) {
        if (phone.isNotEmpty) {
          saveItem();
          formKey.currentState.reset();
        } else {
          Fluttertoast.showToast(
              msg: 'Enter a name', backgroundColor: Colors.grey);
          Fluttertoast.showToast(
              msg: 'Item added', backgroundColor: Colors.black);
        }
      } else if (userName == null) {
        Fluttertoast.showToast(
            msg: 'Enter an image', backgroundColor: Colors.grey);
      }
    }
  }

  saveItem() {
    var id = Uuid();
    String productId = id.v1();
    final itemsRef = FirebaseFirestore.instance.collection("userlist");

    itemsRef.doc(productId).set({
      'userName': userName,
      'phone': phone,
    });
  }
}
