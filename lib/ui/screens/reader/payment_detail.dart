import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_bloc.dart';
import 'package:masiro/data/repository/model/chapter_detail.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/toast.dart';

class PaymentDetail extends StatefulWidget {
  final PaymentInfo paymentInfo;

  const PaymentDetail({super.key, required this.paymentInfo});

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  bool isPaying = false;

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    final cost = widget.paymentInfo.cost;

    final onPressed = !isPaying ? () => _onPaymentButtonPressed(context) : null;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(localizations.costMessage(cost)),
          const SizedBox(height: 10),
          TextButton(
            onPressed: onPressed,
            child: Text(!isPaying ? localizations.pay : localizations.isPaying),
          ),
        ],
      ),
    );
  }

  Future<void> _onPaymentButtonPressed(BuildContext context) async {
    setState(() => isPaying = true);
    final bloc = context.read<ReaderScreenBloc>();
    try {
      final result = await bloc.purchasePaidChapter(widget.paymentInfo);
      result.toast();
    } catch (e) {
      e.toString().toast();
    } finally {
      setState(() => isPaying = false);
    }
  }
}
