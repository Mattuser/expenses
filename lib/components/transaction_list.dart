import 'package:expenses_2/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction_item.dart';

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  List<Transaction> _transactions = [];
  final void Function(String) onRemove;

  TransactionList(this._transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                Text(
                  'Nenhuma transaçao cadastrada',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (ctx, index) {
              final tr = _transactions[index];
              return Transactionitem(
                key: ValueKey(tr.id),
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
  }
}
