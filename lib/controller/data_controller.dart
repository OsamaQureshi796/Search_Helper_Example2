import 'package:get/get.dart';
import 'package:search_helper_video_example/models/post_model.dart';
import 'package:search_helper_video_example/netowk_handler/network_handler.dart';
import 'dart:convert';
class DataController extends GetxController{

  var post= [].obs;
  var filterPost = [].obs;


  var isLoading=false.obs;

  getPostsData()async{
    try{
      isLoading(true);


     var response =  await NetworkHandler.getApiCall(url: 'https://jsonplaceholder.typicode.com/posts',headers: {});

     if(response!.statusCode == 200){

      var result = json.decode(response.body);

      result.forEach((e){
        PostModel model = PostModel.fromJson(e);
        post.add(model);
      });

      filterPost = post;



     }else{
       Get.snackbar('Failed', 'Error while getting data from internet');
     }

    }catch(e){
      post.value = [];
      filterPost.value = [];
    }finally{
      isLoading(false);
    }
  }



  resetBack(){
    filterPost.value = post;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPostsData();
  }

}