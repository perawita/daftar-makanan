import 'package:flutter/material.dart';
import 'detail.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> foodData = [];

  @override
  void initState() {
    super.initState();
    loadFoodData();
  }

  Future<void> loadFoodData() async {
    // Muat data dari file JSON
    final List<Map<String, dynamic>> response = [
      {
        "id": 1,
        "name": "Nasi Goreng",
        "description": "Nasi yang digoreng dengan bumbu dan sayuran.",
        "date": "20 October 2024",
        "category": "Makanan",
        "image":
            "https://www.bing.com/th?id=OIP.yn0e5SrfTPm2dq4TCBSrwAHaHa&w=146&h=146&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
      },
      {
        "id": 2,
        "name": "Sate Ayam",
        "description":
            "Daging ayam yang ditusuk dan dibakar, disajikan dengan saus kacang.",
        "date": "20 October 2024",
        "category": "Makanan",
        "image":
            "https://th.bing.com/th?id=OIP.WDTeCiTtxCJVO7mpAVpfOQHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
      },
      {
        "id": 3,
        "name": "Rendang",
        "description":
            "Daging sapi yang dimasak dengan rempah-rempah hingga empuk.",
        "date": "20 October 2024",
        "category": "Makanan",
        "image":
            "https://www.bing.com/th?id=OIP.beIbPXPoD0DrigZL1xlSjAHaE8&w=146&h=120&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
      },
      {
        "id": 4,
        "name": "Gado-Gado",
        "description": "Salad sayuran dengan bumbu kacang.",
        "date": "20 October 2024",
        "category": "Makanan",
        "image":
            "https://www.bing.com/th?id=OIP.ePvMKXVyRr7kdqw7Qe9xmwHaHa&w=146&h=146&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
      },
      {
        "id": 5,
        "name": "Bakso",
        "description": "Bola daging yang biasanya disajikan dalam kuah kaldu.",
        "date": "20 October 2024",
        "category": "Makanan",
        "image":
            "https://th.bing.com/th?id=OIP.J56dTNYqdsQW0YKK1o4a0AHaFe&w=290&h=214&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
      },
      {
        "id": 6,
        "name": "Nasi Uduk",
        "description": "Nasi yang dimasak dengan santan dan rempah-rempah.",
        "date": "20 October 2024",
        "category": "Makanan",
        "image":
            "https://th.bing.com/th?id=OIP.bbPHo8ll0ir0l9om2hLfsgHaE7&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
      },
      {
        "id": 7,
        "name": "Mie Goreng",
        "description": "Mie yang digoreng dengan sayuran dan bumbu.",
        "date": "20 October 2024",
        "category": "Makanan",
        "image":
            "https://www.bing.com/th?id=OIP.NG-sAE6Rg-OHkt3cDgJxIQHaE7&w=146&h=120&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
      },
      {
        "id": 8,
        "name": "Ayam Penyet",
        "description":
            "Ayam goreng yang dihancurkan dan disajikan dengan sambal.",
        "date": "20 October 2024",
        "category": "Makanan",
        "image":
            "https://th.bing.com/th?id=OIP.F9BuJs46P0rI6ePDzzo2BQHaFS&w=295&h=211&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
      },
      {
        "id": 9,
        "name": "Soto Ayam",
        "description": "Sup ayam dengan rempah-rempah dan nasi.",
        "date": "20 October 2024",
        "category": "Makanan",
        "image":
            "https://th.bing.com/th?id=OIP.N8fZUtvyj-lnku96Gq8sGgHaHV&w=251&h=248&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
      },
      {
        "id": 10,
        "name": "Kwetiau Goreng",
        "description": "Mie lebar yang digoreng dengan bumbu dan sayuran.",
        "date": "20 October 2024",
        "category": "Makanan",
        "image":
            "https://www.bing.com/th?id=OIP.zWzC8_jaQmQGtSB7JgCDtgHaE6&w=146&h=120&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
      }
    ];

    setState(() {
      foodData = response; // Directly assign the response data to foodData
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
            ),
          ),
        ],
      ),
    );
  }
}
