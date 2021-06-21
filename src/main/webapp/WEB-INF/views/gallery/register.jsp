<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/galleryHeader.jsp"%>

<body>

<section class="hero-wrap hero-wrap-2" style="background-image: url('/traders/images/bg_wave.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                 <p class="mb-2 bread" style="font-size:45px;">Gallery</p>
                <p class="breadcrumbs"><span class="mr-2"><a href="/main">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Gallery <i class="ion-ios-arrow-forward"></i></span></p>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-no-pt ftco-no-pb contact-section">
    </div>
    </div>


    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


    <script src="/traders/js/jquery.min.js"></script>
    <script src="/traders/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="/traders/js/popper.min.js"></script>
    <script src="/traders/js/bootstrap.	min.js"></script>
    <script src="/traders/js/jquery.easing.1.3.js"></script>
    <script src="/traders/js/jquery.waypoints.min.js"></script>
    <script src="/traders/js/jquery.stellar.min.js"></script>
    <script src="/traders/js/owl.carousel.min.js"></script>
    <script src="/traders/js/jquery.magnific-popup.min.js"></script>
    <script src="/traders/js/aos.js"></script>
    <script src="/traders/js/jquery.animateNumber.min.js"></script>
    <script src="/traders/js/bootstrap-datepicker.js"></script>
    <script src="/traders/js/scrollax.min.js"></script>
    <script src="/traders/js/main.js"></script>

</section>

<div class="row">
  <div class="col-lg-12">
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/gallery/register" method="post">
          <div class="form-group">
            <label>Title</label> <input class="form-control" name='title'>
          </div>

          <div class="form-group">
            <label>Text area</label>
            <textarea class="form-control" rows="3" name='content'></textarea>
          </div>

          <div class="form-group">
            <label>Writer</label>
            <input class="form-control" name='writer' value="${member.id}" readonly>
          </div>
          <button type="submit" class="btn btn-default">Submit Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">File Attach</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group uploadDiv">
            <input type="file" id="uploadFile" name="uploadFile" accept="image/*" multiple>
            </br></br>
        </div>
        
        <div class='uploadResult'>

          <ul>
          
          </ul>
        </div>
        
        
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<script>
$(document).ready(function(e){

	/* 
      var formObj = $("form[role='form']");

      $("button[type='submit']").on("click", function(e){

        e.preventDefault();

        console.log("submit clicked");
      });
    */

  var formObj = $("form[role='form']");
  
  $("button[type='submit']").on("click", function(e){
    
    e.preventDefault();
    
    console.log("submit clicked");
    
    var str = "";
    
    $(".uploadResult ul li").each(function(i, obj){
      
      var jobj = $(obj);
      
      console.dir(jobj);
      console.log("-------------------------");
      console.log(jobj.data("filename"));
      
        //파일을 선택했을때 파일 업로드 처리   히든으로 첨부파일의 정보들이  보드 VO FielList에 수집됨
      str += "<input type='hidden' name='fileList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='fileList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='fileList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
      str += "<input type='hidden' name='fileList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
    });
    
    console.log(str);
    
    formObj.append(str).submit();
  });

  var imgFile;
  var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$");
  var maxSize = 5242880; //5MB

  function checkExtension(fileName, fileSize){
    if ($('#uploadFile').val() == "") {
        alert("첨부파일은 필수입니다.");
        return 0;
    }
    if (imgFile != "" && imgFile != null) {
        fileSize = document.getElementById("uploadFile").files[0].size;

        console.log(regex.test(imgFile));

        if (!regex.test(imgFile)){
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return 0;
        } else if(fileSize >= maxSize){
            alert("파일 사이즈 초과");
            return 0;
        }
    }

    return 1;
  }

  $("input[type='file']").change(function(e){
    imgFile = $('#uploadFile').val();
    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    console.log(inputFile);
    var files = inputFile[0].files;
    console.log('files!!!!!!!!!!!!' + files);
    for(var i = 0; i < files.length; i++){
      //확장자 체크
      if(!checkExtension(files[i].name, files[i].size)){
        $("input[name='uploadFile']").val("");
        return false;
      }
      //가상의 데이타
      formData.append("uploadFile", files[i]);
    }
    
    $.ajax({
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,
      data: formData,
      type: 'POST',
      dataType:'json',
      //성공시 콘솔에 출력   
      success: function(result){
          console.log(result);
		  showUploadResult(result); //업로드 결과 처리 함수
      }
    }); //$.ajax
  });  
  
  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
    
        /* //image type
        if(obj.image){
          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
          str += "<li><div>";
          str += "<span> "+ obj.fileName+"</span>";
          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
          str += "<img src='/display?fileName="+fileCallPath+"'>";
          str += "</div>";
          str +"</li>";
        }else{
          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
              
          str += "<li><div>";
          str += "<span> "+ obj.fileName+"</span>";
          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
          str += "<img src='/resources/img/file.png'></a>";
          str += "</div>";
          str +"</li>";
        } */
		//image type
		
		if(obj.image){ //이미지인 경우
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{ //파일인경우
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/file.png'></a>";
			str += "</div>";
			str +"</li>";
		}
    });
    uploadUL.append(str);
  }
  //button 삭제버튼 - <button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
  //str += "class='btn btn-warning btn-circle'>

  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    var targetFile = $(this).data("file");
    var type = $(this).data("type");
    
    var targetLi = $(this).closest("li");
    //삭제   화면에서 삭제
    $.ajax({
      url: '/deleteFile',
      data: {fileName: targetFile, type:type},
      dataType:'text',
      type: 'POST',
        success: function(result){
           alert(result);
           
           targetLi.remove();
         }
    }); //$.ajax
  });
});
</script>

<%@include file="../includes/boardFooter.jsp"%>
