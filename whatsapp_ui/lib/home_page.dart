import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  late TabController _tabBarController;
  TextStyle tabBarTextStyle =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  final Color wpColor = const Color.fromRGBO(0, 168, 132, 1);
  int tabIndex = 1;
  GlobalKey tabBarViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabBarController.addListener(() {
      tabIndex = _tabBarController.index;
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: wpColor,
        bottom: TabBar(
          // onTap: ((value) {
          //     setState(() {
          //       tabIndex = value;
          //     });

          // }),
          indicatorColor: Colors.white,
          controller: _tabBarController,
          automaticIndicatorColorAdjustment: false,
          tabs: [
            const Tab(icon: Icon(Icons.camera_alt)),
            Tab(child: Text("Sohbetler", style: tabBarTextStyle)),
            Tab(child: Text("Durum", style: tabBarTextStyle)),
            Tab(child: Text("Aramalar", style: tabBarTextStyle)),
          ],
        ),
        title: const Text('WhatsApp'),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search, size: 30),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert, size: 30),
            ),
          )
        ],
      ),
      body: TabBarView(controller: _tabBarController, children: [
        //CAMERA TAB
        Container(),
        //SOHBETLER TAB
        ListView(
          key: tabBarViewKey,
          children: [
            createListTile(
                "assets/images/anne.png",
                "Annem",
                "Eve gelirken 2 ekmek al",
                const Icon(Icons.volume_up_rounded),
                "18:24"),
            createListTile(
                "assets/images/abla.png",
                "Ablam",
                "Abla bana 200 lira yollasana",
                const Icon(Icons.volume_up_rounded),
                "18:13"),
            createListTile("assets/images/baba.jpg", "Babam", "Nerdesin?",
                const Icon(Icons.volume_up_rounded), "17:57"),
            createListTile(
                "assets/images/amca.jpg",
                "Amcam",
                "Nasılsın yeğenim",
                const Icon(Icons.volume_off_rounded),
                "17:28"),
            createListTile("assets/images/arkadas.png", "Ahmet",
                "Knk bi arasana", const Icon(Icons.volume_up_rounded), "17:02"),
            createListTile("assets/images/hala.jpg", "Halam", "Tamam",
                const Icon(Icons.volume_off_rounded), "16:24"),
            createListTile("assets/images/kardes.png", "Kardeşim", "Hayır",
                const Icon(Icons.volume_up_rounded), "15:16"),
            createListTile(
                "assets/images/hoca.png",
                "Hocam",
                "Hocam şu soruyu yapamadım",
                const Icon(Icons.volume_off_rounded),
                "13:42"),
            createListTile("assets/images/teyze.jpg", "Teyzem", "Evet",
                const Icon(Icons.volume_off_rounded), "12:26")
          ],
        ),
        //DURUM TAB
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {},
                leading: Stack(children: [
                  CircleAvatar(child: Image.asset("assets/images/ben.png")),
                  Positioned(
                    child: Icon(
                      Icons.add_circle_outline,
                      color: wpColor,
                    ),
                    right: -2.0,
                    bottom: -2.0,
                  )
                ]),
                title: const Text("Durumum"),
                subtitle: const Text("Durum güncellemesi eklemek için dokunun"),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text("Görülen güncellemeler"),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(children: [
                  ListTile(
                    onTap: () {},
                    leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/arkadas.png")),
                    title: const Text("Ahmet"),
                    subtitle: const Text("Bugün 14:35"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/baba.jpg")),
                    title: const Text("Babam"),
                    subtitle: const Text("Bugün 11:46"),
                  )
                ]),
              )
            ],
          ),
        ),
        //ARAMALAR TAB
        ListView(
          children: [
            createCallPageListTile(
                "assets/images/abla.png",
                "Ablam",
                Icon(
                  Icons.call_made,
                  color: wpColor,
                ),
                "Bugün 18:42",
                Icon(
                  Icons.call,
                  color: wpColor,
                )),
            createCallPageListTile(
                "assets/images/anne.png",
                "Annem",
                const Icon(
                  Icons.call_received,
                  color: Colors.red,
                ),
                "Bugün 18:12",
                Icon(
                  Icons.call,
                  color: wpColor,
                )),
            createCallPageListTile(
                "assets/images/amca.jpg",
                "Amcam",
                const Icon(
                  Icons.call_received,
                  color: Colors.red,
                ),
                "Bugün 16:31",
                Icon(
                  Icons.videocam_rounded,
                  color: wpColor,
                )),
            createCallPageListTile(
                "assets/images/arkadas.png",
                "Ahmet",
                Icon(
                  Icons.call_made,
                  color: wpColor,
                ),
                "Bugün 15:24",
                Icon(
                  Icons.call,
                  color: wpColor,
                )),
            createCallPageListTile(
                "assets/images/kardes.png",
                "Kardeşim",
                Icon(
                  Icons.call_made,
                  color: wpColor,
                ),
                "Dün 16:42",
                Icon(
                  Icons.call,
                  color: wpColor,
                )),
            createCallPageListTile(
                "assets/images/baba.jpg",
                "Babam",
                const Icon(
                  Icons.call_received,
                  color: Colors.red,
                ),
                "Dün 13:54",
                Icon(
                  Icons.call,
                  color: wpColor,
                )),
            createCallPageListTile(
                "assets/images/hala.jpg",
                "Halam",
                Icon(
                  Icons.call_made,
                  color: wpColor,
                ),
                "01.03.2022 20:32",
                Icon(
                  Icons.videocam_rounded,
                  color: wpColor,
                ))
          ],
        )
      ]),
      floatingActionButton: floatingActionButtonDecider(tabIndex),
    );
  }

  Container createListTile(
      String imgPath, String name, String Message, Icon icon, String time) {
    return Container(
      height: 80,
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          backgroundImage: AssetImage(imgPath),
        ),
        title: Text(name),
        subtitle: Text(Message),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [Text(time), icon]),
        ),
      ),
    );
  }

  ListTile createCallPageListTile(String imgPath, String title, Icon callIcon,
      String subtitle, Icon trailingIcon) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(backgroundImage: AssetImage(imgPath)),
      title: Text(title),
      subtitle:
          Row(children: [callIcon, const SizedBox(width: 5), Text(subtitle)]),
      trailing: trailingIcon,
    );
  }

  Widget floatingActionButtonDecider(int tabIndex) {
    Icon icon = Icon(Icons.message);
    if (tabIndex == 1) {
      icon = Icon(Icons.message);
      return FloatingActionButton(
        backgroundColor: wpColor,
        child: icon,
        onPressed: () {},
      );
    } else if (tabIndex == 2) {
      icon = Icon(Icons.camera_alt);
      Icon icon2 = Icon(Icons.edit, color: Colors.grey.shade900);
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            backgroundColor: Colors.white,
            child: icon2,
            onPressed: () {},
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: wpColor,
            child: icon,
            onPressed: () {},
          )
        ],
      );
    } else if (tabIndex == 3) {
      icon = Icon(Icons.add_ic_call_rounded);
      return FloatingActionButton(
        backgroundColor: wpColor,
        child: icon,
        onPressed: () {},
      );
    } else {
      return FloatingActionButton(
        backgroundColor: wpColor,
        child: icon,
        onPressed: () {},
      );
    }
  }
}
