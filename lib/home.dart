import 'dart:convert';
import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<dynamic>> _fetcDataApi() async {
    try {
      var result = await http.get(Uri.parse(BaseUri.api));
      if (result.statusCode == 200) {
        var data = json.decode(result.body);
        return data; // Kembalikan data yang berhasil diterima
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fetcDataApi(),
        builder: (context, snapshot) {
          // Cek apakah data sedang dimuat
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Jika ada error
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Jika tidak ada data
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available.'));
          }

          // Jika data berhasil dimuat
          var foodData = snapshot.data!;

          return ListView.builder(
            itemCount: foodData.length,
            itemBuilder: (context, index) {
              final foodItem = foodData[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FoodDetailPage(foodItem: foodItem),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(foodItem['name']),
                    subtitle: Text(foodItem['date']),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      backgroundImage: NetworkImage(foodItem['image']),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BaseUri {
  static String api =
      "https://6732c8922a1b1a4ae110e4d4.mockapi.io/api/v1/list_makanan";
}
