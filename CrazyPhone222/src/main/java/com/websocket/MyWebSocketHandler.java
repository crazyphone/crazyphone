package com.websocket;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.WStringSeqHelper;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.errorprone.annotations.Var;

@Component
public class MyWebSocketHandler extends TextWebSocketHandler {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元
	static boolean flag = true;
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

		if (clientMessage.startsWith(UTF8_BOM)) {
			clientMessage = clientMessage.substring(1);
		}
		String[] tokens = clientMessage.split(":");
		
	
		if (tokens[0] != "LISA" && tokens[1].equals("hi")) {
			session.sendMessage(new TextMessage("How can I help you?"));
		} else if (tokens[0] != "LISA" && tokens[1].contains("爛")) {
			session.sendMessage(new TextMessage("We apologize for any inconvenience caused."));
		} else if (tokens[0].equals("LISA") && flag == true) {
			
			flag=false;
		}
		else if (tokens[0]!="LISA" && flag == true) {
			
			session.sendMessage(new TextMessage("服務人員忙線中,預計30分鐘內回覆您的問題!"));
			flag=false;
		}

	}
}