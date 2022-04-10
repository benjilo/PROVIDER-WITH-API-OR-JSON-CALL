import 'package:flutter/material.dart';
import 'package:flutterapp/modelprovider/video_data.dart';
import 'package:provider/provider.dart';

class videoPage extends StatelessWidget {
  const videoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<videodata>().fetchData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Video API/Provider'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<videodata>().fetchData;
        },
        child: Center(
          child: Consumer<videodata>(
            builder: (context, value, child) {
              return value.map.length == 0 && !value.error
                  ? CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'There is an error. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      : ListView.builder(
                          itemCount: value.map.length,
                          itemBuilder: (context, index) {
                            return VideoCard(
                              map: value.map['youtube'][index],
                            );
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard({Key key, this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network('${map['image']}'),
            SizedBox(
              height: 10,
            ),
            Text(
              '${map['heading']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${map['subtitle']}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
