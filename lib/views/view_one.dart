import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolademo/BLOC/bloc/kola_bloc.dart';
import 'package:kolademo/widgets/build_alert_dialog.dart';
import 'package:kolademo/widgets/build_app_bar.dart';
import 'package:kolademo/widgets/build_button.dart';
import 'package:kolademo/widgets/build_dropdown_input.dart';
import 'package:kolademo/widgets/build_inputfield.dart';
import 'package:kolademo/views/view_two.dart'; 

class ViewOne extends StatefulWidget {
  const ViewOne({super.key});

  @override
  State<ViewOne> createState() => _ViewOneState();
}

class _ViewOneState extends State<ViewOne> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final narrationController = TextEditingController();
  final pinController = TextEditingController();
  final recieverController = TextEditingController();
  

  @override
Widget build(BuildContext context) {
  String? selectedNumber;

  return BlocListener<KolaBloc, KolaState>(
    listener: (context, state) {
      // Show success SnackBar
      if (state.isSuccess) {
        showDialog(
          context: context,
          builder: (context) => BuildAlertDialog(
            title: "Success",
            msg: "Your data has been saved successfully",
            type: AlertType.success,
          ),
        );

        context.read<KolaBloc>().add(ResetMessagesEvent());



            }

      if (state.error != null) {
        showDialog(
          context: context,
          builder: (context) => BuildAlertDialog(
            title: "Error",
            msg: "Something went wrong",
            type: AlertType.error,
          ),
        );

        // reset error after showing SnackBar
        context.read<KolaBloc>().add(ResetMessagesEvent());

      }
    },
    child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: BuildAppBar(
        title: "MTN Mobile Money",
        showForwardButton: true,
        onForwardPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ViewTwo()),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  BuildInputField(
                    hintText: 'SOMA MATHEW',
                    label: "Name",
                    // active: false,
                    onChanged: (value) {
                      context.read<KolaBloc>().add(FieldChangedEvent(name: value));
                    },
                  ),
                  const SizedBox(height: 10),
                  BuildInputField(
                    hintText: "Reciever's number",
                    label: "Send to:",
                    onChanged: (value) {
                      context.read<KolaBloc>().add(FieldChangedEvent(reciever: value));
                    },
                  ),
                  const SizedBox(height: 10),
                  BuildDropdownField(
                    icon: Icons.account_balance,
                    value: selectedNumber,
                    items: ['320xxxx209'],
                    onChanged: (val) => setState(() => selectedNumber = val),
                  ),
                  const SizedBox(height: 10),

                  BuildInputField(
                    label: "UGX", 
                    hintText: "AMOUNT", 
                    number: true,
                    onChanged: (value) {
                      context.read<KolaBloc>().add(FieldChangedEvent(amount: value));
                    },
                    ),

                  const SizedBox(height: 10),

                  BuildInputField(
                    hintText: "NARRATION",
                    onChanged: (value) {
                        context.read<KolaBloc>().add(FieldChangedEvent(narration: value));
                      },
                  ),

                  const SizedBox(height: 10),

                  BuildInputField(
                    obscureText: true,
                    hintText: "PIN",
                    number: true,
                    icon: const Icon(Icons.lock_outline),
                    onChanged: (value) {
                      context.read<KolaBloc>().add(FieldChangedEvent(pin:value));
                    },
                    
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.grey, thickness: 0.5, height: 1),

            const SizedBox(height: 8),
            
            BlocBuilder<KolaBloc, KolaState>(
              builder: (context, state) {
                return BuildButton(
                  text: state.isLoading ? "SENDING..." : "SEND",
                  onPressed: () {
                    if (!state.isLoading) {
                      context.read<KolaBloc>().add(SubmitTransactionEvent());
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}

}
