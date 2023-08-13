import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 340, child: _head()),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction History',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.black),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/Transfer.png',
                  height: 40,
                ),
              ),
              title: const Text(
                'transfer',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                'today',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: const Text(
                '\$ 56',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
              ),
            );
          }))
        ],
      ),
    ));
  }
}

Widget _head() {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: const BoxDecoration(
                color: Color(0xff368983),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Stack(
              children: [
                Positioned(
                    top: 35,
                    left: 330,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 40,
                        width: 50,
                        color: const Color.fromRGBO(250, 250, 250, 0.1),
                        child: const Icon(
                          Icons.notification_add_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 35, left: 15),
                  child: Column(
                    children: [
                      Text(
                        'Good Morning',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromARGB(255, 224, 223, 223)),
                      ),
                      Text(
                        'Enjelin Morgeana',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: 160,
        left: 37,
        child: Container(
          height: 170,
          width: 320,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(47, 125, 121, 0.3),
                    offset: Offset(0, 6),
                    blurRadius: 12,
                    spreadRadius: 6),
              ],
              color: const Color.fromARGB(255, 47, 125, 121),
              borderRadius: BorderRadius.circular(15)),
          // total balance
          child: const Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      '\$ 2,900',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              //income
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor:
                                  Color.fromARGB(255, 85, 145, 141),
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                                size: 19,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Income',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '\$ 2,957',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        )
                      ],
                    ),
                    //exchange
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor:
                                  Color.fromARGB(255, 85, 145, 141),
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                                size: 19,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Exchange',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '\$ 2,957',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
