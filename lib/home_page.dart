import 'package:api_intrigatron/controller/data_controller.dart';
import 'package:api_intrigatron/models/user_model_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
 DataController dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("show Apis data"),
      ),
      body: Obx(()=>dataController.isDataLoding.value?Center(
        child: CircularProgressIndicator(),
      ):ListView.builder(itemBuilder: (ctx,i){
        String image = '';
        String title = '';
        String subtitle = '';
        try{
          image= dataController.user_model_list!.data![i].picture!;
        }catch(e){
          image='';
        }
        return ListTile(
leading: CircleAvatar(
  radius: 20,
  backgroundImage: NetworkImage(image),
),
        );
      },
        itemCount: dataController.user_model_list!.data!.length,
      )
      )
    );
  }
}
