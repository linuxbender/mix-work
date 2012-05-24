/*
************************************************************
<JS>
	<NAME>net.js</NAME>
	<AUTOR>glenn</AUTOR>
	<LOCATION>CH</LOCATION>
	<PROJECT>NetBox</PROJECT>
	<TECHNOLOGY>LAMP</TECHNOLOGY>
	<DATE>2010-10-15</DATE>
	<VERSION>1.00</VERSION>
	<COMMENT><![CDATA[n.a]]></COMMENT>
	<DESCRITION>
		<![CDATA[
		js for the NetBox.
		]]>
	</DESCRITION>
	<DOCHISTORY><![CDATA[n.a]]></DOCHISTORY>
</JS>
************************************************************
*/
$(document).ready(function() {
	$('#fmPing').show();
    $('#fmTraceroute').hide();
	$('#fmNSlookup').hide();
	$('#fmNmap').hide();
	$('#fmWhois').hide();
	$('#Ping').addClass('selected');
			
	$('#fmPingProcess').hide();
	$('#content-response').empty();
			
	/* Ping */
	$('#Ping').click(function(e) {
		$('div.content-header h2' ).text("NetBox - Ping Tool");
		$('#fmPing').show();
		$('#fmTraceroute').hide();
		$('#fmNSlookup').hide();
		$('#fmNmap').hide();
		$('#fmWhois').hide();
		$('#Ping').addClass('selected');
		$('#Traceroute').removeClass('selected');
		$('#NSlookup').removeClass('selected');
		$('#Nmap').removeClass('selected');
		$('#Whois').removeClass('selected');
		
		$('#fmPingProcess').hide();
		$('#content-response').empty();				
	});
	$('#fmPingSend').click(function(e){
		var URL = $('#fmPingURL').val();
		if (URL != "") {
			$('#fmPingProcess').show();
			$.getJSON('gateway.php', {'MOD' :'PING' ,'URL' : URL},function(dataPing){
				$('#fmPingProcess').hide();
				$('#content-response').html(""+dataPing.ping+"");
			});
		} else {
			//alert("bin im else - do nothing");
		}
	});
	/* Traceroute */
	$('#Traceroute').click(function(e) {
		$('div.content-header h2' ).text("NetBox - Traceroute Tool");
		$('#fmPing').hide();
		$('#fmTraceroute').show();
		$('#fmNSlookup').hide();
		$('#fmNmap').hide();
		$('#fmWhois').hide();
		$('#Ping').removeClass('selected');
		$('#Traceroute').addClass('selected');
		$('#NSlookup').removeClass('selected');
		$('#Nmap').removeClass('selected');
		$('#Whois').removeClass('selected');
				
		$('#fmTracerouteProcess').hide();
		$('#content-response').empty();
	});
	$('#fmTracerouteSend').click(function(e){
		var URL = $('#fmTracerouteURL').val();
		var PORT  = $('#fmTraceroutePORT').val();
                               	if (URL != "" && PORT != "") {
                                	$('#fmTracerouteProcess').show();
                                     	$.getJSON('gateway.php', {'MOD' : 'TRACEROUTE' ,'URL' : URL, 'PORT': PORT},function(dataTraceroute){
                                        	$('#fmTracerouteProcess').hide();
                                          	$('#content-response').html(""+dataTraceroute.ping+"");
                                         });
                                                } else {
                                                        //alert("bin im else - do nothing");
                                        }
                      	});	
			/* NSlookup */
			$('#NSlookup').click(function(e) {
                                $('div.content-header h2' ).text("NetBox - NSlookup Tool");
                                $('#fmPing').hide();
				$('#fmTraceroute').hide();
                                $('#fmNSlookup').show();
                                $('#fmNmap').hide();
                                $('#fmWhois').hide();
                                $('#Ping').removeClass('selected');
				$('#Traceroute').removeClass('selected');
                                $('#NSlookup').addClass('selected');
                                $('#Nmap').removeClass('selected');
                                $('#Whois').removeClass('selected');
                                
                                $('#fmNSlookupProcess').hide();
                                $('#content-response').empty();                                
                        });
                        $('#fmNSlookupSend').click(function(e){
                     		var URL = $('#fmNSlookupURL').val();
                    		var TYPE  = $('#fmNSlookupTYPE').val();
                      		if (URL != "" && TYPE != "") {
                            		$('#fmNSlookupProcess').show();
                                   	$.getJSON('gateway.php', {'MOD' : 'NSLOOKUP' ,'URL' : URL, 'TYPE':TYPE},function(dataNSlookup){
                                 		$('#fmNSlookupProcess').hide();
                                    		$('#content-response').html(""+dataNSlookup.ping+"");
                                         });
                          	} else {
                           		//alert("bin im else - do nothing");
                          	}
                  	});
                  	/* Nmap */
                  	$('#Nmap').click(function(e) {
                  		$('div.content-header h2' ).text("NetBox - Nmap Tool");
                                $('#fmPing').hide();
				$('#fmTraceroute').hide();
				$('#fmNSlookup').hide();
                                $('#fmNmap').show();
                                $('#fmWhois').hide();
                                $('#Ping').removeClass('selected');
				$('#Traceroute').removeClass('selected');
				$('#NSlookup').removeClass('selected');
                                $('#Nmap').addClass('selected');
                                $('#Whois').removeClass('selected');
                                
                                $('#fmNmapProcess').hide();
                                $('#content-response').empty();                                
                        });
                        $('#fmNmapSend').click(function(e){
                     		var URL = $('#fmNmapURL').val();
                    		var PORT  = $('#fmNmapPORT').val();
                      		if (URL != "" && PORT != "") {
                            		$('#fmNmapProcess').show();
                                   	$.getJSON('gateway.php', {'MOD' : 'NMAP' , 'URL' : URL, 'PORT':PORT},function(dataNmap){
                                 		$('#fmNmapProcess').hide();
                                    		$('#content-response').html(""+dataNmap.ping+"");
                                         });
                          	} else {
                           		//alert("bin im else - do nothing");
                          	}
                  	});
                  	/* whois */
                  	$('#Whois').click(function(e) {
                                $('div.content-header h2' ).text("NetBox - Whois Tool");
                                $('#fmPing').hide();
				$('#fmTraceroute').hide();
				$('#fmNSlookup').hide();
				$('#fmNmap').hide();
                                $('#fmWhois').show();
                                $('#Ping').removeClass('selected');
				$('#Traceroute').removeClass('selected');
				$('#NSlookup').removeClass('selected');
				$('#Nmap').removeClass('selected');
                                $('#Whois').addClass('selected');
                                
                                $('#fmWhoisProcess').hide();
                                $('#content-response').empty();                                
                        });
                        $('#fmWhoisSend').click(function(e){
                     		var URL = $('#fmWhoisURL').val();
                      		if (URL != "") {
                            		$('#fmWhoisProcess').show();
                                   	$.getJSON('gateway.php', {'MOD' : 'WHOIS' ,'URL' : URL},function(dataWhois){
                                 		$('#fmWhoisProcess').hide();
                                    		$('#content-response').html(""+dataWhois.ping+"");
                                         });
                          	} else {
                           		//alert("bin im else - do nothing");
                          	}
                  	});
		});
