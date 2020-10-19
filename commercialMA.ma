% commercial.ma
% Model B: Traffic in the Commercial Neighborhood (Cell-DEVS)

[top]
components : commercial
in : in_highway in_ferry
out : out_highway out_ferry
link : in_highway in_highway@commercial
link : in_ferry in_ferry@commercial
link : out_highway@commercial out_highway
link : out_ferry@commercial out_ferry

[commercial]
type : cell
dim : (4, 9)
delay : transport
defaultDelayTime  : 100
border : wrapped
%select is decided by the sequence of the following cells
neighbors : commercial(1,0), commercial(0,-1), commercial(0,0), commercial(-1,0), commercial(0,1)
% i.e. select : SouthWest -> NorthEast
initialvalue : 0
initialrowvalue :  0      000000100
initialrowvalue :  1      000000000
initialrowvalue :  2      010000000
initialrowvalue :  3      000000000

in : in_highway in_ferry
out : out_highway out_ferry
link : in_highway in_highway@commercial(0,1)
link : in_ferry in_ferry@commercial(0,6)
link : out_highway@commercial(0,2) out_highway
link : out_ferry@commercial(0,8) out_ferry

portInTransition : in_highway@commercial(0,1) movingRuleB
portInTransition : in_ferry@commercial(0,6) movingRuleB
localtransition : movingRuleB

zone : generateOut_highway { (0,2) }
zone : generateOut_ferry { (0,8) }

[generateOut_highway]
rule : { (0,0) - 1 + send( out_highway , 1 )} 100 { (0,0) = 1  }
% following rules are same as [movingRuleB]
rule : 0 100 {((0,0) = 1 and (-1,0) = 0)}  	% car goes up
rule : 0 100 {((0,0) = 1 and (0,1) = 0)}	 	% car goes right
rule : 0 100 {((0,0) = 0 and (1,0) = 0 and (0,-1) = 0)}	% no car and no car coming from bottom and left
rule : 1 100 {((0,0) = 0 and (1,0) = 1)}	 	% no car and car coming from bottom
rule : 1 100 {((0,0) = 0 and (0,-1) = 1)}  	% no car and car coming from left
rule : 1 100 {((0,0) = 1 and (0,1) = 1)}	 	% blocked by right car
rule : 1 100 {((0,0) = 1 and (1,0) = 1)}		%  
rule : {(0,0)} 100 {t}

[generateOut_ferry]
rule : { (0,0) - 1 + send( out_ferry , 1 )} 100 { (0,0) = 1  }
% following rules are same as [movingRuleB]
rule : 0 100 {((0,0) = 1 and (-1,0) = 0)}  	% car goes up
rule : 0 100 {((0,0) = 1 and (0,1) = 0)}	 	% car goes right
rule : 0 100 {((0,0) = 0 and (1,0) = 0 and (0,-1) = 0)}	% no car and no car coming from bottom and left
rule : 1 100 {((0,0) = 0 and (1,0) = 1)}	 	% no car and car coming from bottom
rule : 1 100 {((0,0) = 0 and (0,-1) = 1)}  	% no car and car coming from left
rule : 1 100 {((0,0) = 1 and (0,1) = 1)}	 	% blocked by right car
rule : 1 100 {((0,0) = 1 and (1,0) = 1)}		%  
rule : {(0,0)} 100 {t}

[movingRuleB]
%rule : 0 100 {	((0,0) = 1 and (-1,0) = 0) or  	% car goes up
%		((0,0) = 1 and (0,1) = 0) or 	% car goes right
%		((0,0) = 0 and (1,0) = 0 and (0,-1) = 0)	% no car and no car coming from bottom and left
%	   }
%rule : 1 100 {	((0,0) = 0 and (1,0) = 1) or 	% no car and car coming from bottom
%		((0,0) = 0 and (0,-1) = 1) or  	% no car and car coming from left
%		((0,0) = 1 and (0,1) = 1) or 	% blocked by right car
%		((0,0) = 1 and (1,0) = 1)	%  
%	   }
%rule : {(0,0)} 100 {t}

rule : 0 100 {((0,0) = 1 and (-1,0) = 0)}  	% car goes up
rule : 0 100 {((0,0) = 1 and (0,1) = 0)}	 	% car goes right
rule : 0 100 {((0,0) = 0 and (1,0) = 0 and (0,-1) = 0)}	% no car and no car coming from bottom and left
rule : 1 100 {((0,0) = 0 and (1,0) = 1)}	 	% no car and car coming from bottom
rule : 1 100 {((0,0) = 0 and (0,-1) = 1)}		% no car and car coming from left
rule : 1 100 {((0,0) = 1 and (0,1) = 1)}	 	% blocked by right car
rule : 1 100 {((0,0) = 1 and (1,0) = 1)}		%  
rule : {(0,0)} 100 {t}
