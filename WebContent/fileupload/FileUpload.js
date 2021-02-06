// common variables
var iBytesUploaded = 0;
var iBytesTotal = 0;
var iPreviousBytesLoaded = 0;
var iMaxFilesize = 10000048576; // 1MB
var oTimer = 0;
var sResultFileSize = '';

 

var sounds={"cancel":null, 
			"enter":null, 
			"leave":null, 
			"success":null,
			"enabled":true
}

window.addEventListener("load",init,false);

// ---------------------------------------------------------------------------------------------

function reset(){
	  iBytesUploaded = 0;
	  iBytesTotal = 0;
	  iPreviousBytesLoaded = 0;
	  iMaxFilesize = 10000048576; // 1MB
	  oTimer = 0;
	  sResultFileSize = '';
	  document.getElementById('uploadProgress').style.width = '0%';
 	  document.getElementById('progress_info').style.display='none';  
 	  document.getElementById('upload_response').style.display='none';
 	  document.getElementById('upload_response').innerHTML='<strong></strong>';
 	  document.getElementById('dropbox').style.display='block';  
 	  document.getElementById('droplabel').innerHTML='Largue o ficheiro aqui...';
 	  document.getElementById("fileUploadCancel").style.display="none";
 	  document.getElementById("fileUploadRestart").style.display="none";
 	  document.getElementById("fileUploadCancel").onclick=null;
 	 document.getElementById("fileUploadView").style.display="none";
	 document.getElementById("fileUploadView").href="#";
 	 
}//reset

//---------------------------------------------------------------------------------------------

function abort(){
	 if(sounds.enabled) sounds.cancel.play();
	 clearInterval(oTimer);
	 reset();
} //abort

//---------------------------------------------------------------------------------------------

function init(){
	var dropbox = document.getElementById("dropbox");
	// create the sounds
	createSounds();
//init event handlers
	dropbox.addEventListener("dragenter", dragEnter, false);
	dropbox.addEventListener("dragexit", dragExit, false);
	dropbox.addEventListener("dragover", dragOver, false);
	dropbox.addEventListener("drop", dropFile, false);
	 
	document.getElementById("fileUploadRestart").addEventListener("click", reset, false);
	 
	reset();
}//init

function createSounds(){
	var abortSnd= document.createElement("audio");
	var enterSnd= document.createElement("audio");
	var leaveSnd= document.createElement("audio");
	var successSnd= document.createElement("audio");
	
	abortSnd.addEventListener("canplaythrough", function(e){
		sounds.cancel=e.currentTarget;
	},false);
	
	enterSnd.addEventListener("canplaythrough", function(e){
		sounds.enter=e.currentTarget;
	},false);
	
	leaveSnd.addEventListener("canplaythrough", function(e){
		sounds.leave=e.currentTarget;
	},false);
	
	successSnd.addEventListener("canplaythrough", function(e){
		sounds.success=e.currentTarget;
	},false);
	
	abortSnd.src="fileupload/cancel.mp3";
	enterSnd.src="fileupload/enter.mp3";
	leaveSnd.src="fileupload/leave.mp3";
	successSnd.src="fileupload/success.mp3";
}

//---------------------------------------------------------------------------------------------

function dragEnter(evt) {
	  evt.stopPropagation();
	  evt.preventDefault();
	  
}//dragExit

//---------------------------------------------------------------------------------------------

function dragExit(evt) {
	 
	evt.stopPropagation();
	evt.preventDefault();
	document.getElementById("dropbox").classList.remove("canDrop");
	//if(sounds.enabled) sounds.leave.play();
}//dragExit

//---------------------------------------------------------------------------------------------

function dragOver(evt) {
	evt.stopPropagation();
	evt.preventDefault();
	document.getElementById("dropbox").classList.add("canDrop");
	
}//dragOver

//---------------------------------------------------------------------------------------------

function dropFile(evt) {
	  evt.stopPropagation();
	  evt.preventDefault();
	  if(sounds.enabled) sounds.enter.play();
	  document.getElementById("dropbox").classList.remove("canDrop");
	  var files = evt.dataTransfer.files;
	  var count = files.length;
	   
	  // Only call the handler if 1 or more files was dropped.
	  if (count > 0) handleFiles(files);  
}//drop

//---------------------------------------------------------------------------------------------

function handleFiles(files) {
	var file = files[0];
	document.getElementById("droplabel").innerHTML = "A processar " + file.name;
 	fileSelected(file);
}//handleFiles

//---------------------------------------------------------------------------------------------

function secondsToTime(secs) { // we will use this function to convert seconds in normal time format
    var hr = Math.floor(secs / 3600);
    var min = Math.floor((secs - (hr * 3600))/60);
    var sec = Math.floor(secs - (hr * 3600) -  (min * 60));

    if (hr < 10) {hr = "0" + hr; }
    if (min < 10) {min = "0" + min;}
    if (sec < 10) {sec = "0" + sec;}
    if (hr) {hr = "00";}
    return hr + ':' + min + ':' + sec;
};//secondsToTime

//---------------------------------------------------------------------------------------------

function bytesToSize(bytes) {
    var sizes = ['Bytes', 'KB', 'MB'];
    if (bytes == 0) return 'n/a';
    var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
    return (bytes / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
};//bytesToSize

//---------------------------------------------------------------------------------------------

function fileSelected(oFile) {
 

    // little test for filesize
    if (oFile.size > iMaxFilesize) {
    	//    document.getElementById('warnsize').style.display = 'block';
        return;
    }

 
    // prepare HTML5 FileReader
    var oReader = new FileReader();

    // read selected file as DataURL
  //  var idFAct= new  IDFactory().newID(function(rId){  //rId= � o id gerado para o recurso
    	oReader.readAsDataURL(oFile);
    	startUploading(oFile);
}//fileSelected

//---------------------------------------------------------------------------------------------

function startUploading(oFile) {
	 
	document.getElementById('upfilename').innerHTML="Uploading "+ oFile.name.substr(0,8)+"..."+oFile.name.substr(oFile.name.length-6,oFile.name.length);
	document.getElementById('dropbox').style.display = 'none';
	document.getElementById('progress_info').style.display = 'block';
    // cleanup all temp states
    iPreviousBytesLoaded = 0;
  
    document.getElementById('progress_info').style.display = 'block'; 
   
    console.log("startUploading "+ oFile.name);
    
    var dados = new FormData();
    dados.append("file",oFile);
     
    // create XMLHttpRequest object, adding few event listeners, and POSTing our data
    var oXHR = new XMLHttpRequest();  
    if (oXHR.overrideMimeType) oXHR.overrideMimeType("multipart/form-data");
    oXHR.upload.addEventListener('progress', uploadProgress, false);
    oXHR.addEventListener('load', function(){ uploadFinish(oXHR);}, false);
    oXHR.addEventListener('error', uploadError, false);
    oXHR.addEventListener('abort', uploadAbort, false);
    oXHR.open('POST', 'FileUploadService');
    oXHR.send(dados);
    document.getElementById("fileUploadCancel").onclick=function(){oXHR.abort();};

    // set inner timer
 //   oTimer = setInterval(doInnerUpdates, 40);
    document.getElementById("fileUploadCancel").style.display="inline-block";
}//startUploading

//---------------------------------------------------------------------------------------------

function doInnerUpdates() { // we will use this function to display upload speed
    var iCB = iBytesUploaded;
    var iDiff = iCB - iPreviousBytesLoaded;

    // if nothing new loaded - exit
    if (iDiff == 0)
        return;

    iPreviousBytesLoaded = iCB;
    iDiff = iDiff * 2;
    var iBytesRem = iBytesTotal - iPreviousBytesLoaded;
    var secondsRemaining = iBytesRem / iDiff;

    // update speed info
    var iSpeed = iDiff.toString() + 'B/s';
    if (iDiff > 1024 * 1024) {
        iSpeed = (Math.round(iDiff * 100/(1024*1024))/100).toString() + 'MB/s';
    } else if (iDiff > 1024) {
        iSpeed =  (Math.round(iDiff * 100/1024)/100).toString() + 'KB/s';
    }

    document.getElementById('speed').innerHTML = iSpeed;
    document.getElementById('remaining').innerHTML = secondsToTime(secondsRemaining);        
}// doInnerUpdates

//---------------------------------------------------------------------------------------------

function uploadProgress(e) { // upload process in progress
    if (e.lengthComputable) {
        iBytesUploaded = e.loaded;
        iBytesTotal = e.total;
        var iPercentComplete = Math.round(e.loaded * 100 / e.total);
        var iBytesTransfered = bytesToSize(iBytesUploaded);

        document.getElementById('progress_percent').innerHTML = iPercentComplete.toString() + '%';
        document.getElementById('uploadProgress').style.width = (iPercentComplete ).toString() + '%';
        document.getElementById('b_transfered').innerHTML = iBytesTransfered;
        doInnerUpdates();
    
        
       if (iPercentComplete >= 98.8) {
	    	document.getElementById('uploadProgress').style.width = '100%';
	   	    document.getElementById('progress_info').style.display='none';
	   	    document.getElementById('upload_response').style.display='block';
	   	    document.getElementById('upload_response').className="A transferir...";
	   	    document.getElementById('upload_response').innerHTML='<div style="display:table;width:100%; height:100%"><div style="display:table-cell;vertical-align:middle; width:100%">Processing the file...please wait!<div class="progress progress-striped active margin0"><div id="uploadProgress" class="bar" style="width:100%;"></div></div></div></div>';  
	   	    document.getElementById('fileUploadCancel').style.display='none';
       } 
    } else {
        //document.getElementById('progress').innerHTML = 'unable to compute';
    	document.getElementById('uploadProgress').style.width = '100%';
   	    document.getElementById('progress_info').style.display='none';
   	    document.getElementById('upload_response').style.display='block';
   	    document.getElementById('upload_response').innerHTML='<strong>unable to compute</strong>';
        
    }
 
}//uploadProgress

//---------------------------------------------------------------------------------------------

function uploadFinish(xhr) { // upload successfully finished
  
    var resultado=xhr.responseText;
  
    var jRes=JSON.parse(resultado);
    console.log(jRes)
     if (jRes.result==1){
    	 if(sounds.enabled) sounds.success.play();
    	document.getElementById('uploadProgress').style.width = '100%';
    	document.getElementById('progress_info').style.display='none';
	    document.getElementById('upload_response').style.display='block';
	    document.getElementById('upload_response').className="success";
	    document.getElementById('upload_response').innerHTML='<strong>Transferência concluída!</strong>';
	    document.getElementById('progress_info').style.display='none';
	    clearInterval(oTimer);
	
     }
     else if(jRes.result==-1){
     	document.getElementById('progress_info').style.display='none';
 	    document.getElementById('upload_response').style.display='block';
 	    document.getElementById('upload_response').className="erro";
 	    document.getElementById('upload_response').innerHTML='<div style="display:table;width:100%; height:100%"><div style="display:table-cell;vertical-align:middle; width:100%">'+jRes.error_message+'</div><div>';  
 	    clearInterval(oTimer);
     }
     document.getElementById("fileUploadCancel").style.display="none";
	 document.getElementById("fileUploadRestart").style.display="inline-block";
	 document.getElementById("fileUploadView").style.display="inline-block";
	 document.getElementById("fileUploadView").href=jRes.path;
}//uploadFinish

//---------------------------------------------------------------------------------------------

function uploadError(e) { // upload error
	if(sounds.enabled) sounds.cancel.play();
	reset();
    clearInterval(oTimer);
     
} // uploadError

//---------------------------------------------------------------------------------------------

function uploadAbort(e) { // upload abort
    if(sounds.enabled) sounds.cancel.play();
	reset();
    clearInterval(oTimer);
} //uploadAbort

//---------------------------------------------------------------------------------------------

 