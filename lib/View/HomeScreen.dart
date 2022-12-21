import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search,color: Colors.black38,),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear,color: Colors.black38,),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search Some User',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black45,
                Colors.black87,
              ],
            )
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
              ),
              SizedBox(width: 40,),
              Text('Hello',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
