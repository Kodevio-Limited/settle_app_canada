import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BudgetPlannerScreen extends StatefulWidget {
  const BudgetPlannerScreen({super.key});

  @override
  State<BudgetPlannerScreen> createState() => _BudgetPlannerScreenState();
}

class _BudgetPlannerScreenState extends State<BudgetPlannerScreen> {
  final _incomeCtrl = TextEditingController(text: r'$ [amount]');
  final _rentCtrl = TextEditingController(text: r'$ [amount]');
  final _utilitiesCtrl = TextEditingController(text: r'$ [amount]');
  final _phonesCtrl = TextEditingController(text: r'$ [amount]');
  final _transitCtrl = TextEditingController(text: r'$ [amount]');
  final _groceriesCtrl = TextEditingController(text: r'$ [amount]');
  final _childcareCtrl = TextEditingController(text: r'$ [amount]');
  final _firstMonthRentCtrl = TextEditingController(text: r'$ [amount]');
  final _furnishingCtrl = TextEditingController(text: r'$ [amount]');
  final _movingCtrl = TextEditingController(text: r'$ [amount]');

  @override
  void dispose() {
    _incomeCtrl.dispose();
    _rentCtrl.dispose();
    _utilitiesCtrl.dispose();
    _phonesCtrl.dispose();
    _transitCtrl.dispose();
    _groceriesCtrl.dispose();
    _childcareCtrl.dispose();
    _firstMonthRentCtrl.dispose();
    _furnishingCtrl.dispose();
    _movingCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF123332)),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Color(0xFF123332)),
                    onPressed: () => _showMoreOptions(context),
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Title block
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'MONEY & BENEFITS · PHASE 2',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                      color: Color(0xFFA82227),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Your first-months budget',
                    style: TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.08,
                      color: Color(0xFF123332),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Hidden behind a feature flag until phase 2. Numbers stay on your phone.',
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 15,
                      height: 1.45,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Each month section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Each month',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildRow('Income', _incomeCtrl),
                    _buildRow('Rent', _rentCtrl),
                    _buildRow('Utilities & internet', _utilitiesCtrl),
                    _buildRow('Phones', _phonesCtrl),
                    _buildRow('Transit or car', _transitCtrl),
                    _buildRow('Groceries', _groceriesCtrl),
                    _buildRow('Childcare', _childcareCtrl),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // One-time setup costs section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'One-time setup costs',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123332),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildRow(
                        'First & last month rent', _firstMonthRentCtrl),
                    _buildRow('Basic furnishing', _furnishingCtrl),
                    _buildRow('Moving costs', _movingCtrl),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Save button
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Budget saved to your phone'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF123332),
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('Save my numbers'),
              ),
              const SizedBox(height: 16),

              // Privacy note
              const Text(
                'Settle never sends your financial numbers to our servers. Stored on-device only.',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 12,
                  height: 1.45,
                  color: Color(0xFF5A5F6B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 15,
                color: Color(0xFF123332),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            height: 44,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 15,
                color: Color(0xFF123332),
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF8A8A93)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF8A8A93)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.refresh, color: Color(0xFF123332)),
                title: const Text('Reset numbers'),
                onTap: () {
                  Navigator.pop(ctx);
                  setState(() {
                    _incomeCtrl.text = r'$ [amount]';
                    _rentCtrl.text = r'$ [amount]';
                    _utilitiesCtrl.text = r'$ [amount]';
                    _phonesCtrl.text = r'$ [amount]';
                    _transitCtrl.text = r'$ [amount]';
                    _groceriesCtrl.text = r'$ [amount]';
                    _childcareCtrl.text = r'$ [amount]';
                    _firstMonthRentCtrl.text = r'$ [amount]';
                    _furnishingCtrl.text = r'$ [amount]';
                    _movingCtrl.text = r'$ [amount]';
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
