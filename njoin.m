function join = njoin(n1,n2,start)
join = n1;
join(length(n1)-start+1:end) = join(length(n1)-start+1:end) + n2(1:start);
join = [join n2(start+1:end)];
end