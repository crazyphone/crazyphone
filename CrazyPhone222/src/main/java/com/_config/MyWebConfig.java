package com._config;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.websocket.MyWebSocketHandler;

@Configuration
@EnableWebSocket
@ComponentScan("com")
public class MyWebConfig implements WebSocketConfigurer {

   @Autowired
   private MyWebSocketHandler myWebSocketHandler;

   @Override
   public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
      registry.addHandler(myWebSocketHandler, "/socketHandler").setAllowedOrigins("*");
   }

}