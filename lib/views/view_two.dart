import 'package:flutter/material.dart';
import 'package:kolademo/views/view_one.dart';
import 'package:kolademo/widgets/build_app_bar.dart';
import 'package:kolademo/widgets/build_button.dart';
import 'package:kolademo/widgets/build_dropdown_input.dart';
import 'package:kolademo/widgets/build_dual_toggle_button.dart';
import 'package:kolademo/widgets/build_inputfield.dart' show BuildInputField;
import 'package:kolademo/widgets/build_recent_transactions_button.dart';

class ViewTwo extends StatefulWidget {
  const ViewTwo({super.key});

  @override
  State<ViewTwo> createState() => _ViewTwoState();
}

class _ViewTwoState extends State<ViewTwo> {
  String? selectedNumber1;
  String? selectedNumber2;

  @override
  Widget build(BuildContext context) {
    bool isLeftSelected = true;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: BuildAppBar(
        title: "MTN Money",
        showForwardButton: true,
        showBackButton: true,

        // BACK → ViewOne
        onBackPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ViewOne()),
          );
        },

        // FORWARD → ViewThree
        // onForwardPressed: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (_) => const ViewThree()),
        //   );
        // },
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            BuildOutlineButton(
              text: "Recent Transactions",
              onPressed: () {
              },
            ),

            const SizedBox(height: 10),


            DualToggleButton(
              leftText: "Select Beneficiary",
              rightText: "Other Number",
              isLeftSelected: isLeftSelected,
              onLeftTap: () {
                setState(() => isLeftSelected = true);
              },
              onRightTap: () {
                setState(() => isLeftSelected = false);
              },
            ),


            const SizedBox(height: 10),

            BuildDropdownField(
              icon: Icons.account_balance_wallet,
              value: selectedNumber2,
              items: ['My Number'],
              onChanged: (val) {
                setState(() {
                  selectedNumber2 = val;
                });
              },
            ),           

            const SizedBox(height: 10),

            BuildDropdownField(
              icon: Icons.account_balance,
              value: selectedNumber1,
              items: ['320xxxx209'],
              onChanged: (val) {
                setState(() {
                  selectedNumber1 = val;
                });
              },
            ),

            const SizedBox(height: 10),

            BuildInputField(
              label: "UGX",
              hintText: "AMOUNT",
              number: true,
            ),

            const SizedBox(height: 10),

            BuildInputField(hintText: "NARRATION"),

            const SizedBox(height: 10),

            const SizedBox(height: 10),

            BuildInputField(
              obscureText: true,
              hintText: "PIN",
              number: true,
              icon: const Icon(Icons.lock_outline),
            ),
            
            const SizedBox(height: 10),

            

            const Spacer(),
            const Divider(color: Colors.grey, thickness: 0.5, height: 1),
            const SizedBox(height: 8),
            BuildButton(text: "SEND"),
          ],
        ),
      ),
    );
  }
}
