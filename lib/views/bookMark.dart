import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/HomeProvider.dart';
class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    Homeprovider homeproviderfales =
    Provider.of<Homeprovider>(context, listen: false);
    Homeprovider homeprovidertrue =
    Provider.of<Homeprovider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).pushNamed('/home');
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.blue,
        title: Text('BookMark',style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(itemCount:homeprovidertrue.countryFlag.length,itemBuilder: (context, index) =>Card(
        child:ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 8),
            child: CircleAvatar(radius: 30,backgroundImage: NetworkImage(homeprovidertrue.countryFlag[index]),),
          ),
          title: Text(homeprovidertrue.countryName[index]),
          subtitle: Text(homeprovidertrue.countryCapital[index]),
          trailing: IconButton(onPressed: () {
            homeproviderfales.removlist(index);
          }, icon: Icon(Icons.delete,color: Colors.red,)),
        ),
      ) ,),
    );
  }
}
