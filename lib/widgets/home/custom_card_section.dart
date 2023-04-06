import 'package:flutter/material.dart';
import 'package:flutter_pkm_sw/widgets/home/detail_progress.dart';

class CustomCardSection extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final VoidCallback? controller;
  const CustomCardSection(
      {super.key,
      required this.icon,
      required this.placeholder,
      this.controller});

  @override
  Widget build(BuildContext context) {
    var isMobileWidth = MediaQuery.of(context).size.width < 500;
    return Card(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: ExpansionTile(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  size: 30.0,
                ),
                const SizedBox(width: 10.0),
                Text(
                  placeholder,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ]),
              children: [
                const SizedBox(height: 7.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.insights,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                            const SizedBox(width: 5.0),
                            Text(
                              'Show Data ${isMobileWidth ? '' : placeholder}',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                            ),
                          ],
                        ),
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                        child: Center(child: Text('Bulan'))),
                                    Container(
                                      width: 1.0,
                                      height: 40.0,
                                      decoration: const BoxDecoration(
                                          color: Colors.grey),
                                    ),
                                    const Expanded(
                                        child: Center(child: Text('Target')))
                                  ],
                                ),
                                const Divider(),
                                const DetailProgress(
                                    month: 'Januari', target: '10%'),
                                const DetailProgress(
                                    month: 'Februari', target: '20%'),
                                const DetailProgress(
                                    month: 'Maret', target: '30%'),
                                const SizedBox(height: 10.0),
                                TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.keyboard_arrow_down),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          'More Data ${isMobileWidth ? '' : placeholder}',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          )
                        ]),
                    const SizedBox(height: 8.0),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.add),
                            const SizedBox(width: 5.0),
                            Text(
                                'Add Data ${isMobileWidth ? '' : placeholder}'),
                          ],
                        )),
                    const SizedBox(height: 5.0),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
