data segment   
string1   db   'move the cursor backward.'
String2   db   'move the cursor backward.'
Mess1    db  'match.',13,10,'$'
Mess2    db  'no match.',13,10,'$'
data ends
  
prognam segment
main proc far  
assume cs:prognam,ds:data,es:data   
start:
 push    ds
 sub     ax,ax
 push    ax
 mov    ax,data
 mov    ds,ax
 mov    es,ax
 lea     si,string1
 lea     di,string2
 cld
 mov    cx,25
 repz    cmpsb
 jz      match
 lea     dx,mess2
 jmp    short disp
match:
 lea     dx,mess1
disp:
 mov    ah,09
 int      21h
 ret
main endp
prognam ends
end start
