import 'package:flutter/cupertino.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import 'package:pozitolk/pages/consultation/data/models/payment_model.dart';
import '../../../../core/utils/format_date.dart';
import '../../../../core/utils/format_price.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.paymentModel});
  final PaymentModel paymentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border:
              Border(top: BorderSide(width: 1, color: context.color.base01)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: context.width * 0.29,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getDateOnlyDot(paymentModel.createdAt),
                    style: context.textStyle.s16w500Manrope,
                  ),
                  4.hGap,
                  Text(
                    getTimeOnly(paymentModel.createdAt),
                    style: context.textStyle.s14w500Manrope,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: context.width * 0.25,
              child: Text(
                '${formatPrice(paymentModel.amount.toInt())} ₽',
                style: context.textStyle.s16w500Manrope,
              ).padding(EdgeInsets.only(left: 16)),
            ),
            SizedBox(
              width: context.width * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '# ${paymentModel.id.toString()}',
                    style: context.textStyle.s16w500Manrope,
                  ),
                  4.hGap,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: paymentModel.status == 'completed'
                          ? Color(0xFFB8EFCE)
                          : Color(0xFFFFDAD8),
                    ),
                    child: Text(
                      paymentModel.status == 'completed'
                          ? 'Оплачено'
                          : 'Не выплачено',
                      style: context.textStyle.s14w500Manrope.copyWith(
                        fontSize: 12,
                        color: paymentModel.status == 'completed'
                            ? Color(0xFF36694E)
                            : Color(0xFF884E4D),
                      ),
                    ),
                  )
                ],
              ).padding(EdgeInsets.only(left: 16)),
            ),
          ],
        ));
  }
}
