var highestClientCount = 0; // id of the most recent post displayed on the page
var highestServerCount = 0; // id of the most recent post available form the server
var lowestClientPage =  -1; // lowest page number of posts displayed on the page
var checkScrollTimeout = 250;
var checkCountTimeout = 5000;
var handleMoreButtonPerPage = 5;
var handleMoreButtonRunning = false;

function gotPageFromServer(count, pageNumber) {
	if (count > highestClientCount) {
		highestClientCount = count;
	}
	if (count > highestServerCount) {
		highestServerCount = count;
	}
	if (pageNumber < lowestClientPage || lowestClientPage == -1) {
		lowestClientPage = pageNumber;
	}
	if (lowestClientPage > 1) {
		$("#loading").show();
	} else {
		$("#loading").hide();
	}
	if (lowestClientPage > 1) {
		setTimeout("checkScroll()", checkScrollTimeout);
	}
}

function gotMoreFromServer(count) {
	if (count > highestClientCount) {
		highestClientCount = count;
	}
	checkCount();
}

function showOrHideMoreButton() {
	if (handleMoreButtonRunning) {
		$("#more_form").hide();
	}
	else if (highestServerCount > highestClientCount)
		$("#more_form").show();
	else {
		$("#more_form").hide();
		setTimeout("checkCount()", checkCountTimeout);
	}
}

function gotCountFromServer(count) {
	if (count > highestServerCount) {
		highestServerCount = count;
	}
	showOrHideMoreButton();
}

function checkCount() {
	$.ajax({
		url: "/count.js",
		dataType: "script",
		type: "GET"
	});
	// http://localhost:3000/count.js calls gotCountFromServer()
}

function checkScroll() {
	if (lowestClientPage > 1) {
		if (nearBottomOfPage()) {
			lowestClientPage--;
			$.ajax({
				url: "http://localhost:3000/home.js?page=" + lowestClientPage,
				dataType: "script",
				type: "GET"
			});
			// http://localhost:3000/home.js will call gotPageFromServer()
		}
		else {
			setTimeout("checkScroll()", checkScrollTimeout);
		}
	}
}

function nearBottomOfPage() {
  return scrollDistanceFromBottom() < 150;
}

function scrollDistanceFromBottom(argument) {
  return pageHeight() - (window.pageYOffset + self.innerHeight);
}

function pageHeight() {
  return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}

function handleMoreButton() {
	if (handleMoreButtonRunning) return;
	handleMoreButtonRunning = true;
	showOrHideMoreButton();
	$.ajax({
		url: "http://localhost:3000/more.js?page=1&per_page=" + handleMoreButtonPerPage + "&skip=" + highestClientCount,
		dataType: "script",
		type: "GET",
		complete: function(){
			handleMoreButtonRunning = false;
			showOrHideMoreButton();
			checkCount();
		}
	});
	// http://localhost:3000/home.js will call gotMoreFromServer()
}

function start_ublog() {
	$("#more_form").hide();
	$("#more_btn").click(function(event){
		handleMoreButton();
		event.preventDefault();
	});
	checkCount();
}

// --------------- From: http://www.jplayer.org/latest/demo-01/

function start_jplayer() {
	$("#jquery_jplayer_1").jPlayer({
		ready: function () {
			$(this).jPlayer("setMedia", {
				//m4a: "http://www.jplayer.org/audio/m4a/Miaow-07-Bubble.m4a",
				//oga: "http://www.jplayer.org/audio/ogg/Miaow-07-Bubble.ogg"

				//mp3: "http://live.noagendamix.com:8000" // works in Safari
				//mp3: "http://live.noagendamix.com:8000/listen.pls" // works in Safari

				//mp3: "../music/song.mp3" // works in Safari, Firefox, Chrome
				//m4a: "../music/song.m4a" // works in Safari, Firefox, Chrome
				//oga: "../music/song.ogg" // fails in Safari, works in Firefox, Chrome

				mp3: "http://ec2-184-72-84-255.compute-1.amazonaws.com:8000/stream.mp3", // works in Safari, Firefox, fails in Chrome
				oga: "http://ec2-184-72-84-255.compute-1.amazonaws.com:8080/stream.ogg" // fails in Safari, works in Firefox, Chrome

				//mp3: "http://localhost:8000/stream.mp3"
				//oga: "http://localhost:8080/stream.ogg"

			}).jPlayer("play");
		},
		ended: function (event) {
			$(this).jPlayer("play");
		},
		swfPath: "../javascripts",	// change path for Rails, it was swfPath: "js"
		//supplied: "m4a, oga"		// must match the list above
		supplied: "oga, mp3"		// must have opa first for Chrome
		//solution: "flash, html",
		//nativeSupport: "false"
	});
}

// --------------- 

function load_home_index() {
	//start_jplayer();
	start_ublog();
}
