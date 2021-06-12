<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPEhtml>
<html>

<head>
    <script async src="js/opencv.js" type="text/javascript"></script>
    <script src="js/utils.js" type="text/javascript"></script>

   
    <script type='text/javascript'>
        var netDet = undefined, netRecogn = undefined;
        var persons = {};

        //얼굴 감지
        function detectFaces(img) {
            var blob = cv.blobFromImage(img, 1, { width: 192, height: 144 }, [104, 117, 123, 0], false, false);
            netDet.setInput(blob);
            var out = netDet.forward();

            var faces = [];
            for (var i = 0, n = out.data32F.length; i < n; i += 7) {
                var confidence = out.data32F[i + 2];
                var left = out.data32F[i + 3] * img.cols;
                var top = out.data32F[i + 4] * img.rows;
                var right = out.data32F[i + 5] * img.cols;
                var bottom = out.data32F[i + 6] * img.rows;
                left = Math.min(Math.max(0, left), img.cols - 1);
                right = Math.min(Math.max(0, right), img.cols - 1);
                bottom = Math.min(Math.max(0, bottom), img.rows - 1);
                top = Math.min(Math.max(0, top), img.rows - 1);

                if (confidence > 0.5 && left < right && top < bottom) {
                    faces.push({ x: left, y: top, width: right - left, height: bottom - top })
                }
            }
            blob.delete();
            out.delete();
            return faces;
        };//! [Run face detection model]

        //! [Get 128 floating points feature vector]
        function face2vec(face) {
            var blob = cv.blobFromImage(face, 1.0 / 255, { width: 96, height: 96 }, [0, 0, 0, 0], true, false)
            netRecogn.setInput(blob);
            var vec = netRecogn.forward(); //확률값
            blob.delete();
            return vec;
        };//! [Get 128 floating points feature vector]

        //! [Recognize]
        function recognize(face) {
            var vec = face2vec(face);

            var bestMatchName = 'unknown';
            var bestMatchScore = 0.5;  // Actually, the minimum is -1 but we use it as a threshold.
            for (name in persons) {
                var personVec = persons[name];
                var score = vec.dot(personVec);
                if (score > bestMatchScore) {
                    bestMatchScore = score;
                    bestMatchName = name;
                }
            }
            vec.delete();
            return bestMatchName;
        };//! [Recognize]

        //모델 로딩
        function loadModels(callback) {
            var utils = new Utils('');
            var proto = 'https://raw.githubusercontent.com/opencv/opencv/master/samples/dnn/face_detector/deploy_lowres.prototxt';
            //detection - 사람이면 모두 인식
            var weights = 'https://raw.githubusercontent.com/opencv/opencv_3rdparty/dnn_samples_face_detector_20180205_fp16/res10_300x300_ssd_iter_140000_fp16.caffemodel';
            //recognition - 사람 구별
            var recognModel = 'https://raw.githubusercontent.com/pyannote/pyannote-data/master/openface.nn4.small2.v1.t7';
            utils.createFileFromUrl('face_detector.prototxt', proto, () => {
                document.getElementById('status').innerHTML = 'Downloading face_detector.caffemodel';
                utils.createFileFromUrl('face_detector.caffemodel', weights, () => {
                    document.getElementById('status').innerHTML = 'Downloading OpenFace model';
                    utils.createFileFromUrl('face_recognition.t7', recognModel, () => {
                        document.getElementById('status').innerHTML = '';
                        netDet = cv.readNetFromCaffe('face_detector.prototxt', 'face_detector.caffemodel');
                        netRecogn = cv.readNetFromTorch('face_recognition.t7');
                        callback();
                    });
                });
            });
        };
     
        function main() {
            // Create a camera object.
            var output = document.getElementById('output');
            var camera = document.createElement("video");
            camera.setAttribute("width", output.width);
            camera.setAttribute("height", output.height);

            // 카메라 사용 허가
            navigator.mediaDevices.getUserMedia({ video: true, audio: false })
                .then(function (stream) {
                    camera.srcObject = stream;
                    camera.onloadedmetadata = function (e) {
                        camera.play();
                    };
                });

            //! [Open a camera stream]
            var cap = new cv.VideoCapture(camera);
            var frame = new cv.Mat(camera.height, camera.width, cv.CV_8UC4);
            var frameBGR = new cv.Mat(camera.height, camera.width, cv.CV_8UC3);
            //! [Open a camera stream]

            //사람 추가 버튼 클릭했을 때 이름+사진 가져와서 그려줌
            document.getElementById('addPersonButton').onclick = function () {
                var rects = detectFaces(frameBGR);
                
                if (rects.length > 0) {
                   	var face = frameBGR.roi(rects[0]);
                   	console.log(frameBGR);
                   	console.log(rects[0]);
                   	console.log(rects);

                    var stdname = prompt('이름을 입력하세요:'); //name
                    var cell = document.getElementById("targetNames").insertCell(0); //table에 동적 추가
                    cell.innerHTML = stdname;

                    //var imge  = new Image();
                    
                    
                    //imge.src = 'C:/kdigital/worksapce_spring/teamproject/img';
                    //var img = cv.imread(document.getElementById('test'));
                    var frame = new cv.Mat(camera.height, camera.width, cv.CV_8UC4);
                    persons[stdname] = face2vec(face).clone(); //객체 복사
                    //persons[stdname] = face2vec(imge).clone(); //객체 복사
                    console.log(persons[stdname]);
                    
  			        var canvas = document.createElement("canvas");
                    canvas.setAttribute("width", 96);
                    canvas.setAttribute("height", 96);
                    ////////////////////////////////////////
   /*                  var samplecontext = canvas.getContext("2d");
					var sampleImage = new Image();
					sampleImage.src = "/images/semi.png";
					sampleImage.onload = function(){
						samplecontext.drawImage(sampleImage, 0, 0, sampleImage.width, sampleImage.height);
					} */
                    ///////////////////////////////////
                    
                    var cell = document.getElementById("targetImgs").insertCell(0); //table에 동적추가
                    cell.appendChild(canvas);
                    console.log(canvas);
       
                    
                    
                    var faceResized = new cv.Mat(canvas.height, canvas.width, cv.CV_8UC3);
                    cv.resize(face, faceResized, { width: canvas.width, height: canvas.height });
                    cv.cvtColor(faceResized, faceResized, cv.COLOR_BGR2RGB);
                    //cv.cvtColor(img, faceResized, cv.COLOR_BGR2RGB);
                    cv.imshow(canvas, faceResized);
                   	//
                    var src = canvas.toDataURL(); //base64로 변환
               
                    //console.log("stdname :" + stdname )
                   	//이름이랑 img경로 controller로 보내기
                   	var formData = new FormData();
                	formData.append("name", stdname);
                	formData.append("img", src);
                    	$.ajax({
                   		url:'/chkUpdate',	//jsp주소
                   		type:'POST',
                   		data:formData,
     	           	    processData: false,    // 반드시 작성
 	                    contentType: false,    // 반드시 작성
 	                   success:function(){
 	                    	alert("데이터 전송 성공");
                   		},
                   		error:function(jqXHR, textStatus, errorThrown){
                   			alert("데이터 전송 실패: " + textStatus+": " + errorThrown);
                   		}
                   	});  
                   	
                   	
                   	
                   	 faceResized.delete();
                }
            };
            //! [Add a person]
				
          
            //! [Define frames processing]
            var isRunning = false;
            const FPS = 30;  //초당 처리되는 프레임 수
            function captureFrame() {
                var begin = Date.now();
                cap.read(frame);  // 프레임 읽기
                cv.cvtColor(frame, frameBGR, cv.COLOR_RGBA2BGR);
				//db에서 이미지 파일 가져와서 비교해야됨.
                //이미지에서 얼굴을 찾아냄
                var faces = detectFaces(frameBGR);
                faces.forEach(function (rect) {
                    cv.rectangle(frame, { x: rect.x, y: rect.y }, { x: rect.x + rect.width, y: rect.y + rect.height }, [0, 255, 0, 255]);

                    var face = frameBGR.roi(rect); //관심영역(얼굴)
                    var name = recognize(face); //같은 사람인지 확인
                    cv.putText(frame, name, { x: rect.x, y: rect.y }, cv.FONT_HERSHEY_SIMPLEX, 1.0, [0, 255, 0, 255]);  //같은 사람이면 글씨 쓰기
                   
                    //
                    
                   while(name != "unknown"){
                		<%-- <%
                		String name = request.getParameter("name");
                		String status = (String)request.getAttribute("todayAttend");
                		System.out.println("name:" + name);
                		%> --%>
                		
         	      		//if(${todayAttend.status}){
          
                			//출석 상태가 아닐경우
                			alert(name + "님 출석체크 완료되었습니다.");
                			//학생 db에서 status-1로 변경 
                		//}
                	  	//else{//출석 상태일 경우
                	  		//alert("이미 출석 처리 되었습니다.\n");
                	  	//}
                	   isRunning=false;
                   	   break;
                    	 
                   }
               		//             
                });

                cv.imshow(output, frame);

                // 반복
                if (isRunning) {
                    var delay = 1000 / FPS - (Date.now() - begin);
                    setTimeout(captureFrame, delay);
                }
            };
            //! [Define frames processing]
			
            //start/stop버튼 클릭시
            document.getElementById('startStopButton').onclick = function toggle() {
                if (isRunning) {
                    isRunning = false;
                    document.getElementById('startStopButton').innerHTML = 'Start';
                    document.getElementById('addPersonButton').disabled = true;
                } else {
                    function run() {
                        isRunning = true;
                        captureFrame();
                        document.getElementById('startStopButton').innerHTML = 'Stop';
                        document.getElementById('startStopButton').disabled = false;
                        document.getElementById('addPersonButton').disabled = false;
                    }
                    if (netDet == undefined || netRecogn == undefined) {
                        document.getElementById('startStopButton').disabled = true;
                        loadModels(run);  // Load models and run a pipeline;
                    } else {
                        run();
                    }
                }
            };

            document.getElementById('startStopButton').disabled = false;
        };
    </script>

</head>

<body onload="cv['onRuntimeInitialized']=()=>{ main() }">
    <button id="startStopButton" type="button" disabled="true">Start</button>
    <div id="status"></div>
    <canvas id="output" width=640 height=480 style="max-width: 100%" ></canvas>
	<img id="test" src ="/images/semi.png">
    <table> 
        <tr id="targetImgs"></tr>
        <tr id="targetNames"></tr>
    </table>
    <button id="addPersonButton" type="button" disabled="새로 추가">first</button>
  
   
</body>

</html>