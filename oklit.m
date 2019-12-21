function uzaklik  = oklit( a,b )
%a=[a(1:3)*0.2 a(4:7)*0.1];
%b=[b(1:3)*0.2 b(4:7)*0.1];

uzaklik=sqrt(sum((a-b).*(a-b)));


end

