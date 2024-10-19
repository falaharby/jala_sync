import 'package:flutter/material.dart';
import 'package:jala_verification/app/utils/colors.dart';
import 'package:jala_verification/app/utils/string.dart';
import 'package:jala_verification/app/widgets/app_button.dart';

class ListPatungan extends StatelessWidget {
  final VoidCallback? onTap;
  final String? name, lokasi, sisaHari;
  final int? saldoSekarang, targetSaldo;
  const ListPatungan({
    super.key,
    this.onTap,
    this.name,
    this.saldoSekarang,
    this.targetSaldo,
    this.lokasi,
    this.sisaHari,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: borderColor)),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFE8E8E8)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 142,
                  height: 91,
                  color: const Color(0xFFD9D9D9),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            sisaHari != null ? '$sisaHari sisa hari' : '',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFFA0A0A0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        StringUtil.price(
                            saldoSekarang ?? 0),
                        style: const TextStyle(
                          color: Color(0xFF304FFE),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Target Patungan ',
                              style: TextStyle(
                                color: Color(0xFFA0A0A0),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '${StringUtil.price(targetSaldo ?? 0)}kg',
                              style: const TextStyle(
                                color: Color(0xFFA0A0A0),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Color(0xFF5A5A5A),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            lokasi ?? '',
                            style: const TextStyle(
                              color: Color(0xFF5A5A5A),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppButtonWidget(
              onTap: onTap ?? () {},
              text: 'Patungan Sekarang',
              textSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
