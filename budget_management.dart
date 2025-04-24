import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const BudgetHomePage(),
    );
  }
}

class Transaction {
  final String title;
  final double amount;
  final bool isExpense;

  Transaction({required this.title, required this.amount, required this.isExpense});
}

class BudgetHomePage extends StatefulWidget {
  const BudgetHomePage({super.key});

  @override
  State<BudgetHomePage> createState() => _BudgetHomePageState();
}

class _BudgetHomePageState extends State<BudgetHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  List<Transaction> transactions = [];

  void _addTransaction(bool isExpense) {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text);

    if (title.isEmpty || amount == null) return;

    setState(() {
      transactions.add(Transaction(title: title, amount: amount, isExpense: isExpense));
    });

    titleController.clear();
    amountController.clear();
  }

  double get _totalBalance {
    double income = transactions
        .where((t) => !t.isExpense)
        .fold(0.0, (sum, t) => sum + t.amount);
    double expense = transactions
        .where((t) => t.isExpense)
        .fold(0.0, (sum, t) => sum + t.amount);
    return income - expense;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Budget Manager')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Total Balance: ₹${_totalBalance.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Transaction Title'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _addTransaction(false),
                    child: const Text('Add Income'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _addTransaction(true),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Add Expense'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text('Transactions', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Expanded(
              child: transactions.isEmpty
                  ? const Text('No transactions added yet!')
                  : ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final t = transactions[index];
                        return ListTile(
                          leading: Icon(t.isExpense ? Icons.remove : Icons.add,
                              color: t.isExpense ? Colors.red : Colors.green),
                          title: Text(t.title),
                          trailing: Text(
                            (t.isExpense ? '- ₹' : '+ ₹') +
                                t.amount.toStringAsFixed(2),
                            style: TextStyle(
                                color: t.isExpense ? Colors.red : Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
