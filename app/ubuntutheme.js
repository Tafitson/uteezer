(window.onload = function () {
	var css = 
	"@media (max-width: 990px){\
		body{\
			overflow:auto !important;\
			min-width: unset !important;\
		}\
		#page_topbar{\
			min-width: unset !important;\
		} \
		#page_sidebar{\
			visibility:hidden !important;\
		} \
		#page_topbar{\
			left: 0px !important;\
		}\
		#page_content{\
			margin-left: 0px !important;\
		}\
		.player-track{\
			padding: 0px !important;\
		}\
		#page_player .player-bottom{\
			min-width: 0px!important;\
			overflow-x: scroll !important;\
			height: auto;\
			display: block !important;\
		} \
		.page-player .player-bottom .player-track .track-container .track-heading .track-actions{\
			display: none;\
		} \
		.page-player .player-bottom .player-track{\
			width: 100%;\
		}\
		.page-player .player-bottom .player-controls{\
			width: 100%;\
		}\
		.page-player .player-bottom .player-controls ul{\
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
		.page-player .lyrics-content {\
			max-width: 92%!important;\
		}\
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
      } else {
        document.documentElement.appendChild(node);
      }
    }, 1000);
	}
})();