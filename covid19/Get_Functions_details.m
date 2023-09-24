

function [lb,ub,dim,fobj] = Get_Functions_details(F)


switch F
        
    case 'F1'
        fobj=@MLP_Cancer;
        lb=-10;
        ub=10;
        dim=209;
        
     case 'F2'
        fobj=@MLP_Heart;
        lb=-10;
        ub=10;
        dim=1081;      
        
          case 'F3'
        fobj=@MLP_Hepatitis;
        lb=-10;
        ub=10;
        dim=1081;
        
    
end

end




function o=MLP_Cancer(solution)
load Cancer.txt
 x=Cancer;
 %I2=x(1:150,1:4);
 H2=x(1:699,2:11);
 for iii=1:699
     for jjj=1:10
         H2(iii,jjj)=((H2(iii,jjj)-1)/9);
     end
 end
 I2=H2(1:699,1:9);
 
 T=H2(1:699,10);
 Hno=19;
 dim=11*19;


        for ww=1:10*Hno
            W(ww)=solution(1,ww);
        end
        for bb=10*Hno+1:dim
            B(bb-(10*Hno))=solution(1,bb);
        end
        fitness=0;
        for pp=1:599
            actualvalue=my_simulate(9,Hno,1,W,B,I2(pp,:));

            fitness=fitness+(T(pp)-actualvalue)^2;

        end
        fitness=fitness/599;
        o=fitness;

end


function o=MLP_Heart(solution)
 load heart.txt
 x=heart;
 %I2=x(1:150,1:4);
 I2(:,1)=x(1:80,2);  I2(:,2)=x(1:80,3);  I2(:,3)=x(1:80,4);  I2(:,4)=x(1:80,5);
 I2(:,5)=x(1:80,6);  I2(:,6)=x(1:80,7);  I2(:,7)=x(1:80,8);  I2(:,8)=x(1:80,9);
 I2(:,9)=x(1:80,10); I2(:,10)=x(1:80,11);I2(:,11)=x(1:80,12);I2(:,12)=x(1:80,13);
 I2(:,13)=x(1:80,14);I2(:,14)=x(1:80,15);I2(:,15)=x(1:80,16);I2(:,16)=x(1:80,17);
 I2(:,17)=x(1:80,18);I2(:,18)=x(1:80,19);I2(:,19)=x(1:80,20);I2(:,20)=x(1:80,21);
 I2(:,21)=x(1:80,22);I2(:,22)=x(1:80,23);  
 T=x(1:80,1);

 Hno=45;
dim = 24*45+1;                      % Dimension of the problem

        for ww=1:23*Hno
            W(ww)=solution(1,ww);
        end
        for bb=23*Hno+1:dim
            B(bb-(23*Hno))=solution(1,bb);
        end        
        fitness=0;
        for pp=1:80
            actualvalue=my_simulate(22,Hno,1,W,B,I2(pp,:) );

            fitness=fitness+(T(pp)-actualvalue)^2;

        end
        fitness=fitness/80;    
        o=fitness;
        
end

function o=MLP_Hepatitis(solution)
 load hepatitis_2_csv.txt
 x=hepatitis_2_csv;
 %I2=x(1:150,1:4);
 I2(:,1)=x(1:568,2);  I2(:,2)=x(1:568,3);  I2(:,3)=x(1:568,4);  I2(:,4)=x(1:568,5);
 I2(:,5)=x(1:568,6);  I2(:,6)=x(1:568,7);  I2(:,7)=x(1:568,8);  I2(:,8)=x(1:568,9);
 I2(:,9)=x(1:568,10); I2(:,10)=x(1:568,11);I2(:,11)=x(1:568,12);I2(:,12)=x(1:568,13);
 I2(:,13)=x(1:568,14);I2(:,14)=x(1:568,15);I2(:,15)=x(1:568,16);I2(:,16)=x(1:568,17);
 I2(:,17)=x(1:568,18);I2(:,18)=x(1:568,19);I2(:,19)=x(1:568,20);I2(:,20)=x(1:568,21);
 I2(:,21)=x(1:568,22);I2(:,22)=x(1:568,23);  
 T=x(1:568,1);

 Hno=45;
dim = 24*45+1;                      % Dimension of the problem
        for ww=1:23*Hno
            W(ww)=solution(1,ww);
        end
        for bb=23*Hno+1:dim
            B(bb-(23*Hno))=solution(1,bb);
        end        
        fitness=0;
        for pp=1:568
            actualvalue=my_simulate(22,Hno,1,W,B,I2(pp,:) );

            fitness=fitness+(T(pp)-actualvalue)^2;

        end
        fitness=fitness/568;    
        o=fitness;
        
end



