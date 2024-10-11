import 'package:flutter/material.dart';
import 'package:post_http_flutter/Helpers/getdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic dataGet = [];
  bool isLoading = false;
  getPost() {
    isLoading = true;
    Getdata().getDataWithoutModel().then((value) {
      setState(() {
        isLoading = false;
        dataGet = value;
      });
    }).onError((Error, StackTrace) {
      print(Error);
    });
  }
  @override
  void initState() {
    getPost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Without Model'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dataGet.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(dataGet[index]['id'].toString()),
                      Text(dataGet[index]['name'].toString())
                      ],
                  ),
                );
              },
            ),
    );
  }
}
