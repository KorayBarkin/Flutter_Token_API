import 'package:flutter/material.dart';
import './service.dart';
import './datamodel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<DataModel> _future;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Kullanıcılar"),
      ),
      body: _futureUsers(context),
    );
  }

  _futureUsers(BuildContext context) {
    ///ne zaman biteceği belli olmayan yapılarda arayüzü yapıp sonrasında veri gelince bu arayüzü kullanmak için futurebuilder kullanıyoruz
    return FutureBuilder<DataModel>(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<DataModel> snapshot) {
        ///snapshot = o an gelen değer
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {},
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.title.length,
              itemBuilder: (BuildContext context, int index) {
                ///  modelin içindeki data ile snapshot içindeki data karışmasın
                /// diye [_data] isimli değişken oluşturduk.
                final _data = snapshot.data.title[index];

                return InkWell(
                  onTap: () {},
                  child: Card(
                    child: ListTile(
                      title: Text(
                        _data,
                      ),
                      subtitle: Text(
                        _data,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
