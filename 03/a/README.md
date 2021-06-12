## 1.Bit                                                                           
D触发器：                                                                          
if in == 1                                                                         
  out[t] = in[t-1]                                                                 
else                                                                               
  out[t] = out[t-1]                                                               
这与Bit非常相似，因此可以考虑用D触发器实现位                                      
使用Mux对preout和in进行选择：                                                     
```                                                                               
Mux(a=preout, b=in, sel=load, out=o1);                                            
```                                                                               
再将结果进行输出就是一个位                                                        
```                                                                               
DFF(in=o1, out=preout, out=out);                                                  
```                                                                               
																				  
## 2.Register                                                                     
一个Register16位，因此需要16个Bit，对于每个Bit位，由输入in决定其的输出            
																				  
## 3.RAM8                                                                         
一个RAM8是由8个Register组成的，address决定选择的Register                          
所以使用DMux8Way选择合适的Register                                                
																				  
## 4.RAM64                                                                        
道理同RAM8                                                                        
RAM64有8个RAM8，address[3..5]决定了哪一个RAM8，address[0..2]决定了RAM8内的哪一个   
Bit  : 0 0 0 0 0 0 0 0                                                             
index: 7 >---------> 0                                                             
																				   
## 5.PC                                                                            
先获得t时刻内的寄存器的值preOut                                                    
获得PC寄存器加一后的值                                                             
```                                                                                
Inc16(in=preOut, out=addOut);                                                      
```                                                                                
现在根据输入进行选择                                                               
```                                                                                
// 根据inc选择输出                                                                 
Mux16(a=preOut, b=addOut, sel=inc, out=o1);                                        
// 根据load选择输出                                                                
Mux16(a=o1, b=in, sel=load, out=o2);                                               
// 根据reset选择输出                                                               
Mux16(a=o2, b=false, sel=reset, out=o3);                                           
```                                                                                
此时o2就应该是Register所应该存储的值                                               
最后的输出就可以这样写                                                             
```                                                                                
Register(in=o3, load=true, out=preOut, out=out);     
