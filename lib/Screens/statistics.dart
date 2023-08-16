// import 'package:finance_app/widgets/chart.dart';
import 'package:finance_app/data/model/add_date.dart';
import 'package:finance_app/data/utility.dart';
import 'package:finance_app/widgets/chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(), week(), month(), year()];
  List<Add_data> a = [];
  int index_color = 0;
  ValueNotifier kj = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (context, value, child) {
            a = f[value];
            return custom();
          },
        ),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Statistics',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            index_color = index;
                            kj.value = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index_color == index
                                  ? const Color.fromARGB(255, 47, 125, 121)
                                  : Colors.white),
                          alignment: Alignment.center,
                          child: Text(
                            day[index],
                            style: TextStyle(
                              color: index_color == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Expense',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Chart(
                indexx: index_color,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Spending',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  // geter()[index].image!,
                  'assets/images/${a[index].name}.png',
                  height: 40,
                ),
              ),
              title: Text(
                a[index].name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                // '${day[a[index].dateTime.weekday - 1]}  ${a[index].dateTime.year} - ${a[index].dateTime.day} - ${a[index].dateTime.month}',
                ' ${a[index].dateTime.year}-${a[index].dateTime.day}-${a[index].dateTime.month}',

                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                a[index].amount,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  // color: Colors.green,
                  color: a[index].IN == 'Income' ? Colors.green : Colors.red,
                ),
              ),
              // leading: Image.asset(
              //   geter_top()[index].image!,
              //   height: 40,
              // ),
              // title: Text(
              //   geter_top()[index].name!,
              //   style:
              //       const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              // ),
              // subtitle: Text(
              //   geter_top()[index].time!,
              //   style: TextStyle(fontWeight: FontWeight.w600),
              // ),
              // trailing: Text(
              //   geter_top()[index].fee!,
              //   style: const TextStyle(
              //       fontSize: 19,
              //       fontWeight: FontWeight.w600,
              //       color: Colors.red),
              // ),
            );
          },
          childCount: a.length,
        ))
      ],
    );
  }
}
