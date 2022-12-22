import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:host_book/network/dio_client.dart';
import 'package:host_book/ui/HomeScreenController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: TextField(
                controller: controller.searchEditingController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black38,
                      ),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search Some User',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: buildContent(),

    );
  }

  Widget buildContent() {
    return Obx(() {
      switch (controller.apiStatus.value) {
        case ApiStatus.empty:
          break;
        case ApiStatus.success:
          return ListView.builder(
              itemCount: controller.userData.length,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  height: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black45,
                          Colors.black87,
                        ],
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 45,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(controller.userData[index]['name'].toString(),style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                );
              });
        case ApiStatus.canceled:
        case ApiStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case ApiStatus.noData:
          return const Text('NO data found');
        case ApiStatus.networkError:
          return const Text('Network error');
        case ApiStatus.serverError:
          return const Text('Server error');
        case ApiStatus.clientError:
          return const Text('Something went wrong');
      }
      return const SizedBox.shrink();
    });
  }

}
