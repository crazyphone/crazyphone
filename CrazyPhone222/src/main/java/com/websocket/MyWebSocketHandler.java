package com.websocket;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class MyWebSocketHandler extends TextWebSocketHandler {

	// 用来保存连接进来session
	private List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);

	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String clientMessage = message.getPayload();

		for (WebSocketSession ws : sessions) {
			ws.sendMessage(new TextMessage(clientMessage));
		}

//      if (clientMessage.startsWith("Hello") || clientMessage.startsWith("Hi")) {
//         session.sendMessage(new TextMessage("Hello! What can i do for you?"));
//      } else {
//         session.sendMessage(
//               new TextMessage("This is a simple hello world example of using Spring WebSocket."));
//      }
//   }
	}
}