#include <stdio.h>

int main(){
	const int SIZE = 80;
	int x = 0;
	int td = 15;
	int reach_edge = 0;
	while(1){
		int start = x - td;
		for(int i = 0; i<=td*2; i++){
			if(x>0 && start+i < SIZE+td){
				if(i < td && start+i+1 > 0 && !reach_edge){
					fprintf(stdout, "%d - ", start+i+1);
				} else if(i >= td && start+i+1 > 0 && reach_edge){
					fprintf(stdout, "%d - ", start+((td-i)*-1)+1);
				}
			}else if(x > 0){
				reach_edge = 1;
			}
		}
		if(x + td > SIZE*2){return 0;}
		fprintf(stdout, "\n");
		x++;
	};
	return 0;
}
