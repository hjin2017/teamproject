const video = document.getElementById('video')

Promise.all([
	faceapi.nets.tinyFaceDetector.loadFromUri('/models'),
	faceapi.nets.faceLandmark68Net.loadFromUri('/models'),
	faceapi.nets.faceRecognitionNet.loadFromUri('/models'),
	faceapi.nets.ssdMobilenetv1.loadFromUri('/models'),
	faceapi.nets.faceExpressionNet.loadFromUri('/models')
]).then(startVideo)

function startVideo(){
	navigator.getUserMedia(
		{video:{}},
		stream=>video.srcObject = stream,
		err=>console.error(err)
	)
}
video.addEventListener('play',() => {
	var labels = ['진호']	
	$.ajax({
		url:'/labels',	//jsp주소
		type:'POST',
	 	processData: false,    // 반드시 작성
	 	contentType: false,    // 반드시 작성
	 success:function(e){
		  labels = e;
		},
		error:function(jqXHR, textStatus, errorThrown){
			alert("데이터 전송 실패: " + textStatus+": " + errorThrown);
		}
	}); 

	const canvas = faceapi.createCanvasFromMedia(video)
	const input = document.createElement('input')
	document.getElementById('aa').append(input)
	input.type = 'button'
	input.value = '사람 추가'

	input.onclick= function(){
		var stdname = prompt('이름을 입력하세요:'); 
		var canvas2 = faceapi.createCanvasFromMedia(video);
		var context= canvas2.getContext('2d');
		context.drawImage(video, 0, 0, canvas.width, canvas.height);
		var src = canvas2.toDataURL();
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
				 $.ajax({
					url:'/labels',	//jsp주소
					type:'POST',
					 processData: false,    // 반드시 작성
					 contentType: false,    // 반드시 작성
				 success:function(e){
					  labels = e;
					},
					error:function(jqXHR, textStatus, errorThrown){
						alert("데이터 전송 실패: " + textStatus+": " + errorThrown);
					}
				}); 
       		},
       		error:function(jqXHR, textStatus, errorThrown){
       			alert("데이터 전송 실패: " + textStatus+": " + errorThrown);
       		}
       	});  

		context.clearRect(0, 0, canvas.width, canvas.height)
	}
	input.onkeyup = function(){
		
	}

	document.getElementById('body1').append(canvas)
	const displaySize = { width: video.width, height: video.height }
	faceapi.matchDimensions(canvas, displaySize)

	setInterval(async () => {
		
	  const detections = await faceapi.detectAllFaces(video).withFaceLandmarks().withFaceDescriptors()
	  const resizedDetections = faceapi.resizeResults(detections, displaySize)
	  src = canvas.toDataURL();
	  canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height)
	  labeledFaceDescriptors = await loadLabeledImages(labels)
	  const faceMatcher = new faceapi.FaceMatcher(labeledFaceDescriptors)
	  const results = resizedDetections.map(d => faceMatcher.findBestMatch(d.descriptor))
	  results.forEach((result, i) => {
		console.log('반 복')
		const box = resizedDetections[i].detection.box
		const drawBox = new faceapi.draw.DrawBox(box, {label: result.toString()})
		drawBox.draw(canvas) 
	  })
	  
	}, 100) 
  })

function loadLabeledImages(labels){
	return Promise.all(
		labels.map(async label =>{
			const descriptions = [];
			for(let i=1;i<=2;i++){
				const img = await faceapi.fetchImage(`/images/${label}/${i}.png`)
				const detections = await faceapi.detectSingleFace(img).withFaceLandmarks().withFaceDescriptor()
				descriptions.push(detections.descriptor)
			}
			return new faceapi.LabeledFaceDescriptors(label, descriptions)
		})
	)
}

