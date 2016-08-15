#
# CoxIter: Computation of invariants of hyperbolic Coxeter groups
#
# Implementations
#
InstallGlobalFunction( CoxIter_Example, function()
	Print( "This is a placeholder function, replace it with your own code.\n" );
end );

InstallGlobalFunction( CoxIter_Compute, function()
	local cur_dir, ci_file, ci_stream, ci_output;
	
	cur_dir := DirectoryCurrent();
	ci_file := Filename(DirectoriesPackagePrograms("coxiter"), "coxiter");
	ci_stream := InputOutputLocalProcess(cur_dir,ci_file,["test"]);

	WriteLine(ci_stream,"The cat sat on the mat");
	WriteLine(ci_stream,"exit");

	Print(ReadLine(ci_stream));
	Print(ReadLine(ci_stream));
	Print(ReadLine(ci_stream));
	Print(ReadLine(ci_stream));
	CloseStream(ci_stream);
end );

InstallMethod( Cofinite,
	"for hyperbolic Coxeter groups", 
	[IsCoxIter and IsCoxIterRep], 
	function(obj)
		Setter(Cofinite)(obj,0);
		return 0; # TODO
	end);

InstallMethod( ViewObj,	
	"for object in `IsCoxIter'",
	[ IsCoxIter and IsCoxIterRep ],
	function( obj )
		Print( "TODO: viewobj" );
	end );

InstallMethod( PrintObj,
	"for object in `IsCoxIter'",
	[ IsCoxIter and IsCoxIterRep ],
	function( obj )
		Print( "TODO: printobj" );
	end );
	
ExpandSquareMatrix := function( mat, n, el )
	local cur_mat_size, i, v;
	
	cur_mat_size := Length(mat);
	
	if cur_mat_size > n then
		return;
	fi;
	
	v := [];
	for i in [cur_mat_size+1..n] do
		Append(v,[el]);
	od;
	
	for i in [1..cur_mat_size] do
		Append(mat[i],v);
	od;
	
	v := [];
	for i in [1..n] do
		v[i] := el;
	od;
	for i in [cur_mat_size+1..n] do
		Append(mat,[v]);
	od;
end;

InstallMethod( CreateCoxIterFromCoxeterGraph,	
	"Create `CoxIter' from the Coxeter graph",
	[ IsList ],
	function( G )
		local graph_size, i, j, temp_size, starting_vertex, mat;
	
		mat := [[1]];
		
		graph_size := Length(G);
		for i in [1..graph_size] do
			temp_size := Length( G[i] );
			if temp_size = 0 then
				continue;
			fi;
			
			starting_vertex := G[i][1];
			
			if Length(mat) < starting_vertex then
				ExpandSquareMatrix( mat, starting_vertex, 2 );
			fi;
			
			for j in [2..temp_size] do
				if Length(G[i][j]) > 2 then
					Error("Ill formed graph");
				fi;
				
				if Length(mat) < G[i][j][1] then
					ExpandSquareMatrix( mat, G[i][j][1], 2 );
				fi;
				
				if Length(G[i][j]) > 1 then
					if mat[starting_vertex][G[i][j][1]] <> 2 and mat[starting_vertex][G[i][j][1]] <> G[i][j][2] then
						Error("Two different weights for edge(",starting_vertex,",",G[i][j][1],") given");
					fi;
					
					Print("[",starting_vertex,",",G[i][j][1],"] <-- ",G[i][j][2],"\n");
					mat[starting_vertex][G[i][j][1]] := G[i][j][2];
					mat[G[i][j][1]][starting_vertex] := G[i][j][2];
				fi;
			od;
		od;
		
		temp_size := Length(mat);
		for i in [1..temp_size] do
			mat[i][i] := 1;
		od;
		
		return mat;
	end );
