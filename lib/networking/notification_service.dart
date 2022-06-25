

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   static void initialize(BuildContext context) {
//     final InitializationSettings settings = InitializationSettings(
//         android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//         iOS: IOSInitializationSettings());
//     _flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onSelectNotification: (String? data) async {
//         String str = data!.replaceAll("{", "").replaceAll("}", "");
//         var dataSp = str.split(',');
//         Map<String, dynamic> messageData = Map();
//         dataSp.forEach((element) =>
//             messageData[element.split(':')[0]] = element.split(':')[1]);
//         _onNotificationTaped(messageData, context);
//       },
//     );
//   }

//   static void _onNotificationTaped(
//       Map<String, dynamic> messageData, BuildContext context) {
//     switch (messageData["notification_type"]) {
//       case " 1":
//         print("first");
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => MyOrderDetailsScreen(
//               orderId: int.parse(messageData[" order_id"]),
//               doEdit: false,
//             ),
//           ),
//         );
//         break;
//       case " 2":
//         print("second");
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => RateDelegateScreen(
//               orderId: int.parse(messageData[" order_id"]),
//             ),
//           ),
//         );
//         break;
//       case " 3":
//         print("third");
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => NormalNotificationScreen(
//               title: messageData[" title"],
//               text: messageData[" text"],
//             ),
//           ),
//         );
//         break;
//     }
//   }

//   static void display(RemoteMessage message) {
//     try {
//       var android = new AndroidNotificationDetails(
//         // 'channel id',
//         // "CHANNLE NAME",
//         // "channelDescription",
//         "serve_me_user",
//         "serve_me_user chanal",
//         importance: Importance.high,
//         priority: Priority.high,
//         channelDescription: "serve_me_user chanal",
//       );
//       var iOS = new IOSNotificationDetails();
//       var platform = new NotificationDetails(android: android, iOS: iOS);
//       _flutterLocalNotificationsPlugin.show(
//         0,
//         message.notification!.title,
//         message.notification!.body,
//         platform,
//         payload: message.data.toString() +
//             ", title: " +
//             message.notification!.title! +
//             ", text: " +
//             message.notification!.body!,
//       );
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
