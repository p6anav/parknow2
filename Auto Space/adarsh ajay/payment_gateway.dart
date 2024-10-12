import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
class PaymentGateway extends StatefulWidget {
  const PaymentGateway({super.key});

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {

 String? environmentValue = "SANDBOX";
 String? appId = "";
 String? merchantId = "PGTESTPAYUAT86";
 bool enableLogging = true;
 String? saltKey = "96434309-7796-489d-8924-ab56988a6076";
 String? saltIndexKey = "1";
 Object? result;

 String? body = "";
String? callback = "https://webhook.site/77e26269-ec6c-4ca4-b0c5-689e32ff085c";
String? checksum = "";
String? packageName = "";

//API endpoint


String apiEndPoint = "/pg/v1/pay";


   @override
   void initState() {
    _initializePaymentGateway();
    body = getCheckSum().toString();
    super.initState();
   }
    void _initializePaymentGateway() {
      PhonePePaymentSdk.init(environmentValue!, appId!, merchantId!, enableLogging)
      .then((val) => {
        setState(() {
          result = 'PhonePe SDK initialized - $val';

        })

      }).catchError((error)
{
  traceError(error);
  return <dynamic>{};
});    
    }

 
   void traceError(error)
   {
    result = error;
    
   }


   void startPaymentTrasaction(){
   PhonePePaymentSdk.startTransaction(body!,callback!,checksum!,packageName!)
    .then((response) => {
       setState(() {
         if(response != null){
          String status = response['status'].toString();
          String error = response['error'].toString();
          if(status == 'SUCCESS'){
            result = "Flow completed -- Status: Success";
          }else{
            result = "Flow completed -- Status: $status and Error: $error";
          }
         }
         else{
           result = "Flow incompleted ";
         }
       })
    }).catchError((error){
      return <dynamic>{};
    });
   }

  //get checksum
  dynamic getCheckSum(){
    final requestDataPayload = {
  "merchantId": merchantId,
  "merchantTransactionId": "t_52554",
  "merchantUserId": "MUID123",
  "amount": 10000,
  "callbackUrl": callback,
  "mobileNumber": "9999999999",
  "paymentInstrument": {
    "type": "PAY_PAGE"
  }
};

String? base64body = base64.encode(utf8.encode(json.encode(requestDataPayload)));

 checksum = '${sha256.convert(utf8.encode(base64body+apiEndPoint+saltKey!)).toString()}###$saltIndexKey';

return base64body;


}

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment'),),
      body: Column(children: [Container(
        child: OutlinedButton(
          onPressed: (){
            startPaymentTrasaction();
          },
          child: Text('Pay'),),
      ),
      Text('$result'),
      ],
    ),
    );

  }
}