import 'package:flutter/material.dart';
import 'package:online_shop/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                    child: Text(
                  "Wallet",
                  style: AppWidget.headLineTextFieldStyle(),
                )),
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Color(0xFF2F2F2)),
              child: Row(
                children: [
                  Image.asset(
                    "images/wallet.png",
                    height: 60,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
