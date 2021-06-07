# 这里简述一下部分门的实现                                 
# 要注意，索引0表示的是高位，即右起第一位                  
## 1.And                                                   
Nand(a, b) = Not(And(a, b))                                
因此，可以用Nand(Nand(a, b), Nand(a, b))表示And(a, b)      
                                                           
## 2.Not                                                   
Not(in) = Nand(in, in)                                     
                                                           
## 3.Or                                                    
Nand(a, b) = Or(Not(a), Not(b))                            
Or(a, b) = Nand(Not(a), Not(b))                            
                                                           
## 4.Mux                                                   
Mux是一个选择器，如果sel为0选择a，否则选择b                
因此，可以考虑：                                           
a与Not(sel)通过And门相连                                   
b与sel通过And门相连                                        
再把二者的输出通过Or门相连并输出到结果中即可               
                                                           
## 5.DMux                                                  
Mux门的逆操作                                              
                                                           
## 6.Mux4Way16                                             
将{a,b,c,d}分为{a,b}，{c,d}                                
sel[1]决定着两个集合的选择                                 
0则选择{a,b}，1则选择{c,d}                                 
sel[0]决定着{a,b}，{c,d}中的选择结果                       
0则选择a或c，1则选择b或d                                   
                                                           
## 7.Mux8Way16                                             
与Mux4Way16同样的思路                                      
不过这里传入的sel是两位                                    
                                                           
## 8.DMux4Way                                              
{a, b, c, d} = {in, 0, 0, 0} if sel == 00                  
               {0, in, 0, 0} if sel == 01                  
               {0, 0, in, 0} if sel == 10                  
               {0, 0, 0, in} if sel == 11                  
我们依旧可以利用DMux门的思想，利用And门输出                
这就是Mux4Way16.hdl的Version 1                             
不过这样比较复杂，我们不妨直接利用DMux                     
发现sel[0]=0时是向a，c输出                                 
发现sel[0]=1时是向b，d输出	                                
因此，可以使用sel[0]，并利用DMux先确定输出方向             
发现sel[1]=0时是向a，b输出                                 
发现sel[1]=1时是向c，d输出	                                
因此，可以使用sel[1]，并利用DMux确定输出结果               
                                                           
## 9.DMux8Way                                              
思想同DMux4Way                                             
不过这里传入的sel是两位                                    
