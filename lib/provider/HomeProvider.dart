import 'package:flutter/material.dart';
import 'package:flutter_advance_ch1_exam/Apihelper/apihelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/apiModal.dart';

class Homeprovider extends ChangeNotifier{

  late List<Apimodal> countrylist=[];
   List<Apimodal>? countrySavelist=[];
   bool check=false;
   int selectedindex=0;
   List<String>countryName=[];
   List<String>countryCapital=[];
   List<String>countryFlag=[];



   Future<List<Apimodal>> fetchDatafromApi()
   async {
     final data=await ApiHelper.apiHelper.fetchData();
     countrylist=(data as List).map((e) => Apimodal.fromJson(e),).toList();
     return countrylist;
   }

   void addfavouite(String name,String flag,String capital)
   {
     for(int i=0;i<countryFlag.length;i++)
       {
         if(countryFlag[i]==flag)
           {
             check=true;
           }
       }
    if(!check)
      {
        countryName.add(name);
        countryCapital.add(capital);
        countryFlag.add(flag);
        setData();
      }

     notifyListeners();


   }
  void removlist(int index)
  {

    countryName.removeAt(index);
    countryCapital.removeAt(index);
    countryFlag.removeAt(index);
    setData();
    notifyListeners();

  }

  Homeprovider(){
     fetchDatafromApi();

  }

  Future<void> setData()
  async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
   await preferences.setStringList('book', countryName);
    await preferences.setStringList('flag', countryFlag);
    await preferences.setStringList('cap', countryCapital);


  }
  Future<void> getData()
  async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    countryName=preferences.getStringList('book')??[];
    countryFlag=preferences.getStringList('flag')??[];
    countryCapital=preferences.getStringList('cap')??[];
    notifyListeners();
  }
}