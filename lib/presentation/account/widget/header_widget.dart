import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    Key? key,
    required this.toSize,
  }) : super(key: key);

  final Function(double p1) toSize;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: widget.toSize(48)),
      child: Column(
        children: [
          Container(
            height: widget.toSize(100),
            width: widget.toSize(100),
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: widget.toSize(24)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'USD Account',
                      style: TextStyle(
                        fontSize: widget.toSize(20),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: widget.toSize(12),
                top: widget.toSize(24),
                child: CupertinoButton(
                  minSize: 0.0,
                  padding: EdgeInsets.zero,
                  onPressed: () => setState(() {
                    isHidden = !isHidden;
                  }),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: widget.toSize(8),
                      horizontal: widget.toSize(14),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(widget.toSize(12)),
                    ),
                    child: Text(
                      'Hide',
                      style: TextStyle(
                        fontSize: widget.toSize(14),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: widget.toSize(2)),
                child: Text(
                  '\$',
                  style: TextStyle(
                    fontSize: widget.toSize(14),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: widget.toSize(4)),
              Text(
                isHidden ? '***' : '180,970.83',
                style: TextStyle(
                  fontSize: widget.toSize(24),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
