<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML  >

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="fileupload/bootstrap.css" media="screen">
<link rel="stylesheet" href="fileupload/upload.css" media="screen">

<script src="fileupload/FileUpload.js"></script>

</head>
<body>

	<div id="fileUploadPanel">

		<div class="uploadWidget">
			<div class="uploadWidget-header">

				<strong>Carregar Ficheiro</strong>

			</div>
			<div class="uploadWidget-body">
				<div id="dropbox">
					<span id="droplabel">Largue o ficheiro aqui...</span>
				</div>

				<img id="preview" alt="[ preview will display here ]" />
				<div id="fileinfo">
					<div id="filename"></div>
					<div id="filesize"></div>
					<div id="filetype"></div>
					<div id="filedim"></div>
				</div>

				<div id="error2">Ocorreu um erro na transferência do ficheiro</div>
				<div id="abort">A transferência foi cancelada ou o navegador
					fechou a conexão</div>
				<div id="progress_info">
					<div id="upfilename"></div>
					<div class="progress progress-striped active margin0">
						<div id="uploadProgress" class="bar" style="width: 0%;"></div>
					</div>


					<div>
						<div id="progress_percent">&nbsp;</div>
						<div id="speed">&nbsp;</div>
						<div id="remaining">&nbsp;</div>
						<div id="b_transfered">&nbsp;</div>
						<!--  <div class="clear_both"></div>  -->
					</div>
				</div>
				<div id="upload_response"></div>

			</div>
			<!-- uploadWidget-body   -->

			<div class="uploadWidget-footer" id="uploadWidget-footer">
				<a id="fileUploadCancel" href="#" class="btn btn-mini btn-danger">Cancel</a>
				<a id="fileUploadRestart" href="#" class="btn btn-mini btn-info">Transferir
					outro</a>
				<a id="fileUploadView" href="#" class="btn btn-mini btn-success">Verificar</a>
					
			</div>
		</div>
		<!-- uploadWidget  -->
	
	</div>



</body>
</html>
