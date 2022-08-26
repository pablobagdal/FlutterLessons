import 'package:flutter/material.dart';
import 'package:manual_serialization/model/offices_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<OfficesList> officesList;

  @override
  void initState() {
    officesList = getOfficesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual JSON Serialization'),
        centerTitle: true,
      ),
      body: _listFutureBuilder(),
    );
  }

  _listFutureBuilder() {
    return FutureBuilder<OfficesList>(
      future: officesList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.offices.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data?.offices[index].name),
                    subtitle: Text(snapshot.data?.offices[index].address),
                    leading:
                        Image.network('${snapshot.data?.offices[index].image}'),
                    isThreeLine: true,
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
