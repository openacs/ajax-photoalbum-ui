<html>
<head>
<title>Upload Widget</title>
</head>
<body style="padding:0;margin:0">

<object id='thinapplet' type='application/x-java-applet' width= '300' height= '250' name='ThinUpload'>
<param name='archive' value='/ajaxpa/java-upload/ThinUPload.jar'>
<param name='code' value='com.thinfile.upload.ThinImageUpload'>
<param name='scriptable' value='true'>
<param name='MAYSCRIPT' value='yes'>
<param name='props_file' value='http://10.0.0.208/ajaxpa/java-upload/thinupload.properties'>
<param name='user_id' value='@user_id@'>
<param name='album_id' value='@album_id@'>
<param name='package_id' value='@package_id@'>
<param name='name' value='Thin Upload'>
</object>

<center>
<!--
TODO :
- script to close this window
- restore the parent window
- script to refresh the currently selected album
-->
<a href="javascript:void(0)" style="display:block;padding:3px;background:#cccccc;text-decoration:none;font-weight:bold;margin:2px;font-family:arial,verdana" onclick="close_window()">CLOSE</a>
</center>

<script>
function close_window() {
    window.opener.paInstance.restore_window();
    window.close();
}
</script>

<iframe id="extiframe" name="extiframe" src="begin.html" style="width:0px;height:0px;border:0px"></iframe>

</body>
</html>