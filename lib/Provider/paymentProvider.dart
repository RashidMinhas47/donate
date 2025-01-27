import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:jazzcash_flutter/jazzcash_flutter.dart';
import 'package:provider/provider.dart';

class PaymentProvider with ChangeNotifier {
  String _name = '';
  String get name => _name;
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isShow = true;
  fetchUserName() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid
            .toString()) // Replace with the actual document ID
        .get();

    if (documentSnapshot.exists) {
      var data = documentSnapshot.data() as Map<String, dynamic>;

      _name = data['name']?.toString() ?? '';
      notifyListeners();

      print(name);
    }
  }

  bool _isSubmitDisabled = true;

  TextEditingController paymentController = TextEditingController();

  TextEditingController get textEditingController => paymentController;

  bool get isSubmitDisabled => _isSubmitDisabled;

  void checkInputValue() {
    _isSubmitDisabled = int.tryParse(paymentController.text) == 0;
    notifyListeners();
  }

  void dispose() {
    paymentController.dispose();
    super.dispose();
  }

  void updateText(String newText) {
    paymentController.text = newText;
    notifyListeners();
  }

  double calculatedValue = 0.0;
  double remainingAmount = 0.0;

  void calculateFivePercent() {
    double enteredValue = double.tryParse(paymentController.text) ?? 0.0;
    double fivePercent = enteredValue * 0.05;
    remainingAmount = enteredValue - fivePercent;
    calculatedValue = fivePercent;
    notifyListeners();
  }

  String paymentStatus = "pending";
  String integritySalt = "wesxzw32c5";
  String merchantID = "MC58526";
  String merchantPassword = "3h9w49dx3e";
  String transactionUrl = "www.fiver.com";

  payViaJazzCash(
      {required BuildContext context,
      required TextEditingController paymentController}) async {
    //PaymentProvider paymentProvider = Provider.of<PaymentProvider>(context);
    // print("clicked on Product ${element.name}");

    try {
      JazzCashFlutter jazzCashFlutter = JazzCashFlutter(
        merchantId: merchantID,
        merchantPassword: merchantPassword,
        integritySalt: integritySalt,
        isSandbox: true,
      );

      DateTime date = DateTime.now();

      JazzCashPaymentDataModelV1 paymentDataModelV1 =
          JazzCashPaymentDataModelV1(
        ppAmount: paymentController.text,
        ppBillReference:
            'refbill${date.year}${date.month}${date.day}${date.hour}${date.millisecond}',
        ppDescription: 'Donations',
        ppMerchantID: merchantID,
        ppPassword: merchantPassword,
        ppReturnURL: transactionUrl,
      );

      jazzCashFlutter
          .startPayment(
              paymentDataModelV1: paymentDataModelV1, context: context)
          .then((_response) {
        print("response from jazzcash $_response");

        // _checkIfPaymentSuccessfull(_response, element, context).then((res) {
        //   // res is the response you returned from your return url;
        //   return res;
        // });

        notifyListeners();
      });
    } catch (err) {
      print("Error in payment $err");
      // CommonFunctions.CommonToast(
      //   message: "Error in payment $err",
      // );
      return false;
    }
  }
}
