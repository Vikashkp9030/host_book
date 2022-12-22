import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:host_book/network/dio_client.dart';

import '../model/users_response.dart';

class HomeScreenController extends GetxController {
  final DioClient dioClient = DioClient.init();

  final apiStatus = ApiStatus.empty.obs;

  final debouncer = Debouncer(delay: const Duration(seconds: 3));
  final userList = <User>[];
  TextEditingController searchEditingController = TextEditingController();
  RxList userData = [].obs;
  @override
  void onReady() {
    super.onReady();
    searchEditingController.addListener(() {
      debouncer.call(() {
        serchUser();
      });
    });
  }

  void serchUser() async {
    apiStatus.value = ApiStatus.loading;
    final apiResponse = await dioClient.get(
        'https://api.github.com/search/topics?q=${searchEditingController.text}');
    print(apiResponse.data.toString());

    final userResponse = UsersResponse.fromMap(apiResponse.data);
    if (apiResponse.apiStatus == ApiStatus.success) {
       userData.value = apiResponse.data['items'];
       // userList.assignAll(userResponse.userList);
      print(userList.toString());
      apiStatus.value = ApiStatus.success;
    } else {
      apiStatus.value = apiResponse.apiStatus;
    }
  }
}
