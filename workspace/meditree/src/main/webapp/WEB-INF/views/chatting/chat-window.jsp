<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채팅창</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
* {
 margin: 0;
 padding: 0;
 box-sizing: border-box;
}

.container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f8f8f8;
}

.chat-header {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 80px;
    border-bottom: 1px solid #ddd;
    background-color: #CEF6D8;
}

.chat-header h1 {
    font-size: 24px;
    font-weight: bold;
}

.chat-messages {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    width: 100%;
    height: 500px;
    overflow-y: auto;
    padding: 20px;
    background-color: #CEF6D8;
}

.message-row {
    justify-content: flex-start;
    align-items: flex-start;
    width: 100%;
    margin-bottom: 20px;
}

.message {
    display: inline-block;
    padding: 10px;
    border-radius: 10px;
    max-width: 80%;
    word-break: break-all;
}

.message.sender {
	clear: both;
    background-color: #e8f3ff;
    margin-right: 10px;
    float: right;
}

.message.receiver {
    background-color: #fff;
    margin-left: 10px;
    float: left;
}

.time {
    font-size: 12px;
    color: #aaa;
    margin-top: 5;
    	}

		
#chat-input {
    display: flex;
    align-items: center;
    padding: 10px;
    border-top: 1px solid #999;
    
    
}
textarea{
	resize: none;
}
 #chat-input{
    flex: 1;
    margin-right: 10px;
    padding: 5px;
    font-size: 16px;
    margin-top: 10px;
} 
 button {
    float: right;
    width: 100%;
    margin-bottom: 10px;
} 

</style>
</head>
<body>
    <div class="container">
        <div class="chat-header">
            <h1>채팅방</h1>
        </div>
        <div class="chat-messages">
            <div class="message-row">
                <div class="message sender">
                    <p>안녕하세요!</p>
                    <span class="time">9:00 AM</span>
                </div>
            </div>
            <div class="message-row">
                <div class="message receiver">
                    <p>안녕하세요! 반갑습니다.</p>
                    <span class="time">9:02 AM</span>
                </div>
            </div>
            <div class="message-row">
                <div class="message sender">
                    <p>오늘 날씨가 참 좋네요.</p>
                    <span class="time">9:05 AM</span>
                </div>
            </div>
            <div class="message-row">
                <div class="message receiver">
                    <p>네, 정말 좋은 날씨입니다.</p>
                    <span class="time">9:07 AM</span>
                </div>
            </div>
        </div>
      <div class="chat-input">
            <textarea placeholder="메시지를 입력하세요." style="width: 485px; height: 160px; margin-top: 10px;"></textarea>
        </div>
            <button type="button" class="btn btn-success">전송</button> 
        
    </div>
</body>
</html>
