package com.medi.app.chatting.server;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.medi.app.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ChattingServer extends TextWebSocketHandler{
	//모든세션의 정보를 담을 객체
		private final Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			MemberVo loginMember = (MemberVo) session.getAttributes().get("loginMember");
			log.info("{}연결됨",loginMember.getName());
			sessionSet.add(session);
			
		}

		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			System.out.println(message.getPayload());
			MemberVo loginMember = (MemberVo)session.getAttributes().get("loginMember");
			Map<String, Object> attrMap = session.getAttributes();
			String sender = (String)attrMap.get(loginMember.getName());
			String msg = message.getPayload();
			TextMessage textMsg = new TextMessage(loginMember.getName() + " : " +msg);
			//더많은 정보를 보내고 싶으면 json형태로 작성하여 정보를 전달
			broadCast(textMsg);
			
			
			
		}
		private void broadCast(TextMessage textMsg) throws Exception {
			for (WebSocketSession session : sessionSet) {
				session.sendMessage(textMsg);
				
			}
		}

		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			MemberVo loginMember = (MemberVo) session.getAttributes().get("loginMember");
			log.info("{} 연결끊김",loginMember.getName());
			sessionSet.remove(session);
		}

		
}
