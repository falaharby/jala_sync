
import 'package:flutter/material.dart';

class ParticipantWidget extends StatelessWidget {
  final String name, location;
  final int total;
  const ParticipantWidget({
    super.key,
    required this.name,
    required this.location,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 66,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side:
              const BorderSide(width: 1, color: Color(0xFFE8E8E8)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://avatar.iran.liara.run/public"),
                fit: BoxFit.fill,
              ),
              shape: OvalBorder(),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Color(0xFF182230),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${total}kg',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color(0xFF182230),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    location,
                    style: const TextStyle(
                      color: Color(0xFF344054),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
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