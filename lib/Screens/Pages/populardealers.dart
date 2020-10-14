import 'package:assyst/Database/notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PopularDealers extends StatefulWidget {
  final car_name;
  final car_picture;
  PopularDealers({this.car_name, this.car_picture});
  @override
  _PopularDealersState createState() => _PopularDealersState();
}

class _PopularDealersState extends State<PopularDealers> {
  QuerySnapshot items;

  crudMethods crudObj = new crudMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          snap: false,
          centerTitle: true,
          backgroundColor: Colors.white,
          floating: false,
          expandedHeight: 200,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              widget.car_picture,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFillRemaining(
          child: ListView(
            children: [
              ButtonTheme(
                minWidth: 150.0,
                height: 10.0,
                buttonColor: Colors.blue,
                child: FlatButton.icon(
                    onPressed: () => launch("https://t.me/fuadcarmarket"),
                    icon: Icon(
                      Icons.near_me_outlined,
                      color: Colors.blue[500],
                    ),
                    label: Text('Open telegram channel')),
              ),
              // Center(child: Text(widget.car_name))
            ],
            /*children: <widget>[

          ]*/
          ),
        )
      ],
    )

        /* ListView(
        children: [
          Column(
            children: [
              SizedBox(width: double.infinity,child: 
              Image.asset(widget.car_picture,fit: BoxFit.cover,),height: 300,),]
          ),
          SizedBox(height: 10),
          Text(widget.car_name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)
        ],
      ),*/

        );
  }
}
