    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/talkHeader1.jsp"%>


<body>
    <div class = "container" style="margin-left:525px;" width="100%">
        <h1>STock Talk!</h1>
        <div id="roomContainer" class="roomContainer">
            <table id="roomList" class="roomList">

            </table>
        </div>
        <div>
            <table class="inputTable">
                <tr>
                    <th>방 제목</th>
                    <th><input type="text" name="roomName" id="roomName"></th>
                    <th><button id="createRoom">방 만들기</button></th>
                </tr>
            </table>
        </div>
    </div>

<script type="text/javascript">
    var ws;
    window.onload= function(){
        getRoom();
        createRoom();
    }
    function getRoom(){
        commonAjax('/getRoom', "", 'POST', function(result){
            createChatingRoom(result);
        });
    }
    function createRoom(){
        $("#createRoom").click(function(){
            var msg = { roomName : $("#roomName").val() };
            commonAjax('/createRoom', msg, 'POST', function(result){

                createChatingRoom(result);
            });
            $("#roomName").val("");
        });
    }
    function goRoom(number, name){
        location.href="/movechating?roomName="+name+"&"+"roomNo="+number; //url이동
    }
    function createChatingRoom(result){
        if(result != null){             //roomList가 널이 아니면
            var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>";
            console.log(result);
            result.forEach(function(d, idx){
                var roomName = d.roomName.trim();
                var roomNo = d.roomNo;
                tag += "<tr>"+
                            "<td class='num'>"+ (idx+1)+ "</td>"+
                            "<td class='room'>"+ roomName+ "</td>"+
                            "<td class='go'><button type='button' onclick='goRoom(\"" + roomNo + "\", \""+ roomName + "\")'>참여</button></td>"+
                       "</tr>";
            });
            $("#roomList").empty().append(tag);     // roomList에 추가
        }
    }

    function commonAjax(url, parameter, type, callback, contentType){
        $.ajax({
            url: url,
            data: parameter,
            type: type,
            dataType: 'JSON',
            contentType: contentType != null? contentType:'application/x-www-form-urlencoded; charset=UTF-8',
            success: function(result){
                callback(result);
            },
            error: function(err){
                console.log('error');
                callback(err);
            }
        });
    }
</script>
</body>
<!-- <script type="text/javascript" src="/resources/js/check.js"></script> -->
