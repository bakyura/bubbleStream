function touch(x, y, color){
	$.post("/update_table", { x: x, y: y, color: color },
        function(data) {
          $("#board").html(data);  
        }
    );
}

function reset(){
	$.post("/reset_table", {},
        function(data) {
          $("#board").html(data);  
        }
    );
}

function help(){
	
}