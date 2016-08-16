#include <iostream>
#include <string>

#include "coxiter.h"

using namespace std;

int main(int argc, char *argv[]) 
{
	string strInput;
	cout << "Child Process" << endl; 
	cout << "-------------" << endl;
	
	do{ 
		getline( std::cin, strInput );
		
		if( strInput.find( "exit" ) != string::npos )
			break;
	}
	while( true );
	
	return 0;
}
