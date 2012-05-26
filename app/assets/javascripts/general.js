// JavaScript Document for All

/*
* Author: SaliproIT
*/
var xmlhttp;
function abc() {
    document.getElementById("rate").innerHTML = xmlhttp.responseText;
}
function exeVote(id, vote) {

    /*
    if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
    }*/
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 3) {
            document.getElementById("rate").innerHTML = "» Cám ơn bạn đã bình chọn...";
        }
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            setTimeout("abc()", 1000);

        }
    }
    xmlhttp.open("GET", "ajax/handle_vote.aspx?id=" + id + "&vote=" + vote, true);
    xmlhttp.send();
}


// SHOW ADVANCED SEARCH
function show_search(kind)
	{
								if(kind =="id")
								{
									var newstr = "<u>Mã sản phẩm</u>";
									var oldstr = document.getElementById('s-id');
									oldstr.innerHTML = newstr;
									document.getElementById("searchid").style.display="block";
									var newstr2 = "<a onClick=\"show_search('high')\">Nâng cao</a>";
									var oldstr2 = document.getElementById('s-high');
									oldstr2.innerHTML = newstr2;
							 		document.getElementById("searchhigh").style.display="none";
								}
								else {
									var newstr = "<a onClick=\"show_search('id')\">Mã sản phẩm</a>";
									var oldstr = document.getElementById('s-id');
									oldstr.innerHTML = newstr;
									document.getElementById("searchid").style.display="none";
									var newstr2 = "<u>Nâng cao</u>";
									var oldstr2 = document.getElementById('s-high');
									oldstr2.innerHTML = newstr2;
							 		document.getElementById("searchhigh").style.display="block";
								}



		}
    
    
    // SHOW/HIDE DIALOG
		function showhide(bg,dialog) {
		    var x = document.getElementById(bg).style.display;
		    if (x == "" || x == "none") {
		        document.getElementById(bg).style.display = "block";
		        document.getElementById(dialog).style.display = "block";		        
		    }
		    else {
		        document.getElementById(bg).style.display = "none";
		        document.getElementById(dialog).style.display = "none";
		    }

		}

		// Close area error info
		function closeIt(id) {
		    document.getElementById(id).style.display = "none";
		}

