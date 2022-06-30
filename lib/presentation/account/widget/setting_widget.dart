import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    Key? key,
    required this.toSize,
  }) : super(key: key);

  final Function(double p1) toSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(.05),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: toSize(36),
        horizontal: toSize(12),
      ).copyWith(bottom: toSize(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transactions History',
            style: TextStyle(
              fontSize: toSize(16),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: toSize(8)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: toSize(8)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(toSize(12)),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(toSize(18)),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'USD Dollar',
                            style: TextStyle(
                              fontSize: toSize(16),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Icon(
                          CupertinoIcons.chevron_down,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: toSize(8)),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(toSize(12)),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          padding: EdgeInsets.all(toSize(18)),
                          child: Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                    fontSize: toSize(16),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: toSize(16)),
                        padding: EdgeInsets.all(toSize(18)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(toSize(12)),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
