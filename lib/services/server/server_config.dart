import 'package:socket_io_client/socket_io_client.dart' as IO;

class ServerConfig {
  IO.Socket socket;
  connect() {
    //Body

    socket = IO.io("http://192.168.1.107:5000", <String, dynamic>{
      "transports": ['websocket'],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((data) => print("Connected"));
    print(socket.connected);
    socket.emit("signin", 3);
  }

  sendMessage(String message, int sourceId, int targetId) async {
    var data = {"message": message};
    await socket.emit("message", data);
  }
}
