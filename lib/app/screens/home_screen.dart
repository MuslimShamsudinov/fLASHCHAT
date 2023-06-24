import 'package:flutter/material.dart';
import 'package:muslim/drover.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  static const String route = 'nhfgnhgfnjmh';

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171717),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff171717),
        actions: [
               IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
        ],

      ),
      drawer: Mdrover(),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(
                    //     onPressed: () {
                    //       setState(() {});
                    //     },
                    //     icon: Icon(
                    //       Icons.search,
                    //       color: Colors.white,
                    //     )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 10),
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Сообщения',
                          style: TextStyle(color: Colors.grey, fontSize: 23),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Онлайн',
                          style: TextStyle(color: Colors.grey, fontSize: 23),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Группы',
                          style: TextStyle(color: Colors.grey, fontSize: 23),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: 190,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 25,
                ),
                height: 220,
                decoration: BoxDecoration(
                  color: Color(0xff27c1a9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Избранные контакты',
                          style: TextStyle(color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          builcontactavatar('Мурад', 'b.jpg'),
                          builcontactavatar(' Юсуф', 'c.jpg'),
                          builcontactavatar('Билол', 'e.jpg'),
                          builcontactavatar('Яхе ', 'f.jpeg'),
                          builcontactavatar('Алим', 'k.jpeg'),
                          builcontactavatar('Али', 'p.jpeg'),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Padding builcontactavatar(
    String name,
    String filename,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 28.0),
      child: Column(
        children: [
          UsersAvatar(
            filename: filename,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class UsersAvatar extends StatelessWidget {
  final String filename;

  const UsersAvatar({
    super.key,
    required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
        backgroundImage: Image.asset('assets/images/k.jpeg').image,
      ),
    );
  }
}
