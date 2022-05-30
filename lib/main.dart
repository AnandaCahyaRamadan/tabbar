import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  var foto = [
    {
      'img': 'https://i.postimg.cc/vTGKR2X4/cinese.jpg',
      'album': 'Chinese Democracy'
    },
    {
      'img': 'https://i.postimg.cc/nL7SXfPs/us2.jpg',
      'album': 'Use Your Illusion 2'
    },
    {
      'img': 'https://i.postimg.cc/Gt3Xg8hY/us1.jpg',
      'album': 'Use Your Illusion 1'
    },
    {
      'img': 'https://i.postimg.cc/4Nm5KTKJ/city.jpg',
      'album': 'City Of Evil'
    },
    {
      'img': 'https://i.postimg.cc/PfFbnFS0/walking.jpg',
      'album': 'Walking In The Fallen'
    },
    {
      'img': 'https://i.postimg.cc/KYFB5XY3/nigmare.png',
      'album': 'Nightmare'
    },
    {
      'img': 'https://i.postimg.cc/V6hJp2zR/nol.jpg',
      'album': 'Reboisasi'
    },
    {
      'img': 'https://i.postimg.cc/pVgZn6Kz/suara-jalanan.jpg',
      'album': 'Suara Jalanan'
    },
    {
      'img': 'https://i.postimg.cc/Gp7P37cB/terapi.jpg',
      'album': 'Terapi Visi'
    },
    {
      'img': 'https://i.postimg.cc/GhCDRwk7/pelangi.jpg',
      'album': 'XTRAVAGANZA'
    },
  ];

  final List lagu = [
    "Guns N Roses - Sorry",
    "Guns N Roses - Civil War",
    "Guns N Roses - November Rain",
    "Avenged Sevenfold - Bat Country",
    "Avenged Sevenfold - Unholly Convension",
    "Avenged Sevenfold - Danger Line",
    "Boomerang - Nol",
    "Boomerang - Aurora",
    "Boomerang - Bidadari Api",
    "Boomerang - Pelangi",
  ];
  final List playlist = [
    "Guns N Roses - Sorry",
    "Guns N Roses - Civil War",
    "Guns N Roses - November Rain",
    "Avenged Sevenfold - Bat Country",
    "Avenged Sevenfold - Unholly Convension",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Belajar SliverAppBar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: AssetImage('assets/images/pani.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                // padding: new EdgeInsets.all(10.0),
                //
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                      new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                      new Tab(icon: new Icon(Icons.playlist_add), text: "Playlist"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        lagu[index],
                        style: TextStyle(fontSize: 15),
                      ),
                      leading: CircleAvatar(
                        child: Text(lagu[index][0]),
                      ),
                      //     padding: const EdgeInsets.all(15.0),
                      // child: Text(
                      //     bulan[index], style:TextStyle(fontSize:30)),
                    ),
                  );
                },
                itemCount: lagu.length,
              ),
              GridView.count(
                  crossAxisCount: 2,
                  children: foto.map((index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('${index['img']}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(10, 110, 0, 0),
                        subtitle: Text(
                          '${index['album']}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }).toList(growable: true)),
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        playlist[index],
                        style: TextStyle(fontSize: 15),
                      ),
                      leading: CircleAvatar(
                        child: Text(playlist[index][0]),
                      ),
                      //     padding: const EdgeInsets.all(15.0),
                      // child: Text(
                      //     bulan[index], style:TextStyle(fontSize:30)),
                    ),
                  );
                },
                itemCount: playlist.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;

  double get minExtent => _tabBar.preferredSize.height;
  double get maxExtent => _tabBar.preferredSize.height;

  Widget build(BuildContext context, double shrinkOffset, bool overlabsContents) {
    return new Container(
      child: _tabBar,
    );
  }

  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
