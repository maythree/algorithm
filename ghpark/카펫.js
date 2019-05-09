function solution(brown, red) {

    var sum = brown/2+2; 

	var x = sum; 
	
	var y = 1;

 

	 while(y <= x) {
	
		 x = sum - y;    
	
		 if(x*y == brown+red) {
	
			 break;
	
		 }
	
		 y++;                 
	
	 }

	 return [x,y];

}