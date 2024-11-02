(window.onload = function () {
	let css = 
	"@media (max-width: 850px){\
		body{\
			overflow:auto !important;\
			min-width: unset !important;\
		}\
		body::-webkit-scrollbar {\
        display: none;\
    }\
    .container {\
      padding: 8px;\
    }\
		#page_topbar{\
			min-width: unset !important;\
			left: 0px !important;\
		} \
    #page_topbar .popper-wrapper .popper .popper-content.popper-account{\
      z-index: 301;\
      max-width: 97%;\
    }\
    #page_topbar .popper-wrapper .popper .popper-content.popper-account{\
      z-index: 301;\
      max-width: 97%;\
    }\
    [data-testid=\"duration\_sort\"]{\
      display: none;\
    }\
    [data-testid=\"duration\"]{\
      display: none;\
    }\
    [data-testid=\"explicit\_label\"]{\
      display: none;\
    }\
    [data-testid=\"MicrophoneIcon\"]{\
      display: none;\
    }\
    .JIYRe>:not(:first-child) {\
      margin-left: 8px;\
    }\
    .RYR7U.TTdph.icMti {\
      display: none;\
    }\
    .TTdph {\
      width: 0px;\
    }\
    .css-xw5h76 {\
      min-width: 0px;\
    }\
		.css-efpag6{\
			visibility:hidden !important;\
		} \
		#page_player .css-1d4hfp6{\
			min-width: 0px!important;\
			height: auto;\
			display: block !important;\
      z-index: 300 !important;\
		} \
		.page-player .css-1d4hfp6 .css-1hrq5q6 {\
			padding: 0px !important;\
			width: 100%;\
      padding-bottom: 20px;\
		}\
		.page-player .css-1d4hfp6 .css-s4gaps{\
			width: 100%;\
		}\
		.page-player .css-1d4hfp6 .css-4vwzwv{\
			width: 100%;\
      justify-content: space-around;\
		}\
		.track-title{\
			min-width: 80px !important;\
		}\
		.page-player .player-queuelist .player-container {\
			margin: 5px 1% 0 !important;\
		}\
		.page-player .player-full .player-container {\
			display: block !important;\
			overflow: scroll;\
		}\
		.page-player .player-full .player-container .queuelist-cover .queuelist-cover-thumbnail figure.thumbnail {\
			position: relative;\
			left: 50%;\
			transform: translateX(-50%);\
		}\
		.page-player .player-full .player-container .queuelist-cover {\
			width: unset !important;\
			margin-right: unset !important;\
		}\
    .page-player .player-full .player-container .queuelist-content .datagrid-cell.cell-duration{\
      display: none;\
    }\
    .page-player .player-full .player-container .queuelist-content .datagrid-row{\
      padding: none !important;\
    }\
		.page-player .player-full {\
			min-width: 0px!important;\
		}\
    .page-player .player-full .player-header{\
      justify-content: space-evenly;\
    }\
    .page-player .player-full .player-close {\
      transform: unset;\
      position: static;\
    }\
		.page-player .lyrics-content {\
			max-width: 92%!important;\
    }\
    .page-player .lyrics-line {\
      font-size: 18px;\
    }\
    .page-player .lyrics-line.is-active {\
      font-size: 25px;\
    }\
    .page-player .lyrics-synchro .lyrics-item {\
      margin-bottom: unset;\
    }\
    .carousel .container{\
      margin-left: 5px !important;\
      width: 79vw !important;\
    }\
    .carousel .container .channel-headings .heading-2, .carousel .container .channel-headings .heading-2-sub {\
      max-width: 65vw !important;\
      white-space:nowrap;\
      overflow:hidden;\
      text-overflow:ellipsis;\
    }\
    .page-main{\
      min-width: 0px !important;\
    }\
    .naboo{\
      min-width: 0px !important;\
      padding-bottom: 180px !important;\
    }\
    .explicit, .cell-explicit, .cell-explicit-small{\
      display: none;\
    }\
    .datagrid-cell.cell-date{\
      width: 70px;\
      font-size: 8px;\
    }\
    .datagrid-cell-action.cell-heard{\
      padding-left: 5px;\
    }\
    .search-top-result .thumbnail .picture-img{\
      width: 100px;\
      height: 100px;\
    }\
    .thumbnail .action-item-btn{\
      opacity: 0.8 !important;\
      font-size: 10px !important;\
      height: 20px !important;\
      width: 20px !important;\
      line-height: 20px !important;\
    }\
    .container ._1hePk._2ZD3_._3gdBA, .container ._2YQby>.chakra-button.css-irwtr3:first-child {\
      display: none\
    }\
    .container ._1hePk._2ZD3_._33B7t {\
      margin-left: 7px;\
    }\
    .container ._1hePk._2ZD3_._33B7t ._3v4QN {\
      display: none;\
    }\
    .container ._2YQby {\
      margin-left: unset;\
    }\
    .container ._1caJL>:not(:first-child) {\
      margin-left: 8px;\
    }\
	}\
  \
  .slider-track{\
    height: 0px;\
  }\
  .slider-track-input {\
    height: 18px;\
    margin-top: -18px;\
  }\
  .slider-track-default {\
    margin-top: 0px;\
    height: 6px;\
  }\
  .slider-track-active {\
    margin-top: 0px;\
    height: 6px;\
    background: linear-gradient(1deg,#d81b60 13%,#f06262) !important;\
  }\
  .slider-track-input::-webkit-slider-thumb {\
    -webkit-appearance: none;\
    appearance: none;\
    width: 18px;\
    height: 18px;\
    background: #ef5365;\
    top: 12px;\
  }";

	if (typeof GM_addStyle != "undefined") {
		GM_addStyle(css);
	} else if (typeof PRO_addStyle != "undefined") {
		PRO_addStyle(css);
	} else if (typeof addStyle != "undefined") {
		addStyle(css);
	} else {
    setTimeout(function () {
      var node = document.createElement("style");
      node.appendChild(document.createTextNode(css));
      var head = document.head;
      if (head) {
        head.appendChild(node);
        let slider = document.getElementsByClassName("slider")[0];
        if(slider){
          slider.addEventListener("touchstart", touchHandler, true);
          slider.addEventListener("touchmove", touchHandler, true);
          slider.addEventListener("touchend", touchHandler, true);
          slider.addEventListener("touchcancel", touchHandler, true);
        }
        let sliderDiv = document.getElementsByClassName("slider-autohide")[0];
        if(sliderDiv){
          sliderDiv.classList.remove("slider-autohide");
          sliderDiv.classList.add("is-active");
        }
        document.body.addEventListener("touchstart", ()=>{
          let sliderDiv = document.getElementsByClassName("slider-autohide")[0];
          if(sliderDiv){
            sliderDiv.classList.remove("slider-autohide");
            sliderDiv.classList.add("is-active");
          }
        });
        document.body.addEventListener("touchend", ()=>{
          let sliderDiv = document.getElementsByClassName("slider-autohide")[0];
          if(sliderDiv){
            sliderDiv.classList.remove("slider-autohide");
            sliderDiv.classList.add("is-active");
          }
        });
        document.body.addEventListener("touchcancel", ()=>{
          let sliderDiv = document.getElementsByClassName("slider-autohide")[0];
          if(sliderDiv){
            sliderDiv.classList.remove("slider-autohide");
            sliderDiv.classList.add("is-active");
          }
        });
        document.body.addEventListener("touchmove", ()=>{
          let sliderDiv = document.getElementsByClassName("slider-autohide")[0];
          if(sliderDiv){
            sliderDiv.classList.remove("slider-autohide");
            sliderDiv.classList.add("is-active");
          }
        });
      } else {
        document.documentElement.appendChild(node);
      }
    }, 1000);
	}
})();

function touchHandler(event) {
  var touches = event.changedTouches,
    first = touches[0],
    type = "";
  switch(event.type) {
    case "touchstart": type = "mousedown"; break;
    case "touchmove":  type = "mousemove"; break;        
    case "touchend":   type = "mouseup";   break;
    default:           return;
  }

  // initMouseEvent(type, canBubble, cancelable, view, clickCount, 
  //                screenX, screenY, clientX, clientY, ctrlKey, 
  //                altKey, shiftKey, metaKey, button, relatedTarget);

  let simulatedEvent = new MouseEvent(type, { 
    bubbles: true,
    cancelable: true,
    view: window,
    screenX: first.screenX, 
    screenY: first.screenY,
    clientX: first.clientX,
    clientY: first.clientY,
    ctrlKey: false,
    altKey: false,
    shiftKey: false,
    metaKey: false,
    button: 0,
    relatedTarget: null
  });
  first.target.dispatchEvent(simulatedEvent);
  event.preventDefault();
}