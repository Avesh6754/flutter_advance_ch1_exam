import 'package:flutter/material.dart';
import 'package:flutter_advance_ch1_exam/Apihelper/apihelper.dart';
import 'package:flutter_advance_ch1_exam/modal/apiModal.dart';
import 'package:flutter_advance_ch1_exam/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Homeprovider homeproviderfales = Provider.of<Homeprovider>(context, listen: false);
    Homeprovider homeprovidertrue = Provider.of<Homeprovider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home Page', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed('/fav');
          }, icon: Icon(Icons.bookmark,color: Colors.white,))
        ],
      ),
      body: FutureBuilder(future: homeproviderfales.fetchDatafromApi(),
        builder: (context, snapshot) {
        if(snapshot.hasData)
          {
            List<Apimodal>? apiList=snapshot.data;
            homeprovidertrue.countrySavelist=snapshot.data;
            return ListView.builder(itemCount: apiList!.length,itemBuilder: (context, index) =>Card(
              child: GestureDetector(
                onTap: () {
                  homeprovidertrue.selectedindex=index;
                  Navigator.of(context).pushNamed('/detail');
                },
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 8,bottom: 8),
                    child: CircleAvatar(radius:30,backgroundImage: NetworkImage(apiList![index].flags.pn),),

                  ),
                  title: Text(apiList[index].name.common),
                  subtitle: Text(apiList[index].region),
                  trailing: Text('Area : ${apiList[index].area}',style: TextStyle(fontSize: 15),),
                ),

              ),
            ) ,);

          }
        return Center(child: CircularProgressIndicator(),);
        },),
    );
  }
}
