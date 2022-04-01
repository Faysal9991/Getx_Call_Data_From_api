

import 'dart:convert';

import 'package:api_intrigatron/models/user_model_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class DataController extends GetxController{
  User_Model_List ? user_model_list;
  var isDataLoding = false.obs;

  getUserInfromationFromApi()async{
  try{
    isDataLoding(true);
    http.Response response = await http.get(Uri.tryParse('https://dummyapi.io/data/v1/user?limit=10')!,
        headers: {'app-id':'624692e1d0f57f5e389b389f'
        }
    );
    if(response.statusCode==200){
      ///Data successfully
      var reault = jsonDecode(response.body);
      user_model_list=  User_Model_List.fromJson(reault);
    }else{
      ///Erorr
    }
  }
  catch(e){
    print("error while geting data $e");
  }
  finally{
    isDataLoding(false);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    DataController().getUserInfromationFromApi();
  }
  }
  }

