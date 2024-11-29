import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/HomeProvider.dart';
import 'package:url_launcher/url_launcher.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    Homeprovider homeproviderfales =
        Provider.of<Homeprovider>(context, listen: false);
    Homeprovider homeprovidertrue =
        Provider.of<Homeprovider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Details Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black26,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(homeprovidertrue
                            .countrySavelist![homeprovidertrue.selectedindex]
                            .flags
                            .pn))),
              )),
          Divider(
            color: Colors.black87,
          ),
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Country Name :',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                      Text(
                          ' ${homeprovidertrue.countrySavelist![homeprovidertrue.selectedindex].name.common}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text('Independent Country :',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                      Text(
                          ' ${homeprovidertrue.countrySavelist![homeprovidertrue.selectedindex].independent}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text('Region Name :',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                      Text(
                          ' ${homeprovidertrue.countrySavelist![homeprovidertrue.selectedindex].region}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text('Capital Name :',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                      Text(
                          ' ${homeprovidertrue.countrySavelist![homeprovidertrue.selectedindex].capital[0]}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text('Area Name :',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                      Text(
                          ' ${homeprovidertrue.countrySavelist![homeprovidertrue.selectedindex].area}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text('Total Population :',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                      Text(
                          ' ${homeprovidertrue.countrySavelist![homeprovidertrue.selectedindex].population}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text('AltSpellings :',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                      Text(
                          ' ${homeprovidertrue.countrySavelist![homeprovidertrue.selectedindex].altSpellings[0]}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text('Member Country :',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                      Text(
                          ' ${homeprovidertrue.countrySavelist![homeprovidertrue.selectedindex].unMember}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue)),
                        onPressed: () {
                          homeproviderfales.addfavouite(
                              homeprovidertrue
                                  .countrySavelist![
                                      homeprovidertrue.selectedindex]
                                  .name
                                  .common,
                              homeprovidertrue
                                  .countrySavelist![
                                      homeprovidertrue.selectedindex]
                                  .flags
                                  .pn,
                              homeprovidertrue
                                  .countrySavelist![
                                      homeprovidertrue.selectedindex]
                                  .capital[0]);

                          (homeprovidertrue.check)
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Already Added')))
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Data Add')));
                        },
                        child: Text(
                          'Add to BookMark',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
