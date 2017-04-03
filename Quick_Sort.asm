         
        
         
        
        include 'emu8086.inc'
        
       
        
        
       
         .model large
         
         .stack 100h
        
        .data 
        
        ; Array That
        uno dw 0,9,20,3,90,1000,1,3,4,8 
        ; Back_Up the values first
        
        swap_var dw 0
        b_dx dw 0 
        lower dw 2 
        pivot dw 18 
        ;These variables are used by print array procedure 
        nsi dw  0
        nax dw 0
        ndx dw 0
        ; End of variables print array procedure 
        
        v1 dw 0
        v2 dw 0
        
       ; AX contains the pivot 
       ; BX Contains uno[j]
       ; CX contains uno[p]
       ; DX contains the Key 
       ; SI contains the lower/p
       ; DI contains j
       ;
       ;
       ;
       ;
       ;
       ;
       ;
        
         
         
       
       .code 
        
        mov ax,@data
        mov ds,ax
        
        main proc 
           mov si, lower
           mov ax, pivot
           
           
            call QuickSort
            print "Ended"
            call print_arr
            .Exit
           
            
            
        endp main
        
        
        
        QuickSort proc
            
               Quick:
                   cmp si, ax
                   jge EndQuick
                   
                   call part
                   
                   mov ax, si
                   sub ax, 2
                   mov lower, 2
                   mov si, lower
                   call QuickSort
                   
                   mov ax, 18
                   add si , 2
                   mov lower, si
                   
                   call QuickSort
                   .Exit
           
               EndQuick: 
               print "TADA"
               RET 
        endp QuickSort    
        
         part proc 
            Partition:
             
             mov di, ax       ; Ax contains the current pivot
             mov dx, uno[di]  ; DX contains the Key
             mov si, lower    ; Lower contains the current position of wall
             mov di, si       ; DI contains J
             sub si, 2        ; Si now contains P
             
             p_for: 
                cmp di, ax
                jge End_for
                
                 ; Start of The Inner If Statement 
                 
                  p_if:
                    mov bx, uno[di]
                    cmp bx, dx
                    jg End_p_if
                    
                        
                        add si, 2
                        mov cx , uno[si]  ; CX contains the value of uno[p]
                        mov swap_var, cx  ; Swap var contains uno[p]=CX
                        mov cx, bx        ; CX contains value of uno[j]
                        mov bx, swap_var  ; bx containes value of uno[p]
                        mov uno[si], cx   ; 
                        mov uno[di], bx   ;
                        ;print "Swapping Values"
                        mov v1,  cx
                        mov v2, bx
                        ;call swap_print
                 
                  End_p_if:
                 ; End of Inner If Statement 
                add di, 2
                jmp p_for
                End_for:   
                
                 mov di, ax         ; DI contains the current pivot
                 add si, 2          ; SI contains p+1
                 mov cx, uno[si]    ; cx contains uno[p+1]
                 mov swap_var, cx   ; Swap var contains uno[p+1]
                 mov cx, dx         ; cx contains key
                 mov dx , swap_var  ; dx contains uno[p+1]
                 
                 mov uno[di], dx
                 mov uno[si], cx
           
                
           End_Partition:
            call print_arr
           
           RET 
            
            
            
         endp part
       
           print_arr proc
            ; Set the variables, So I wont lost the value of these registers 
             mov nsi, si
             mov nax, ax
             mov ndx, dx
             mov si, 2 
             mov ah,2 
                     
             mov dl, 0Ah 
             int 21h
             mov dl, 0Dh 
             int 21h 
              print "So, The array is "
            start_print:
            
                 cmp si, 18 
                 
                 jg end_print 
                     ; Print the array content
                        
                      mov ax, uno[si]
                      call print_num
                      
                      
                      ;New line and carriage return
                      
                      
                    print ","  
                    add si,2
                 jmp start_print 
                   
              
             end_print:
              mov ah,2 
                      
                      mov dl, 0Ah 
                      int 21h
                      mov dl, 0Dh 
                      int 21h  
                mov si, nsi            
                mov ax, nax
                mov dx, ndx 
                ret 
                  
        endp print_arr
       
        swap_print proc 
             mov nsi, si
             mov nax, ax
             mov ndx, dx
          print "Swapping: Value "
             mov ax, v2
             call print_num
             print " With "
             mov ax, v1
             call print_num
             mov ah,2 
                      
             mov dl, 0Ah 
             int 21h
             mov dl, 0Dh 
             int 21h
             
             mov si, nsi            
             mov ax, nax
             mov dx, ndx
             
             RET 
        endp swap_print
   
        
         define_scan_num 
         define_print_num
         define_print_num_uns