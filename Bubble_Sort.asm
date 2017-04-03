            
        
         
        
        include 'emu8086.inc'
        
       
        
        
       
         .model large
         
         .stack 100h
        
        .data 
        
        uno dw 0,6,5000,1,3,8,4,7,9,2
         
        ;Variable Registers
        ; si contains value of i 
        ; DI contains the value of j
        ; AX contains the size of array 
        ; BX contaions the size-1 array
        ; size contains the size of array 
        
        size dw 20 
        swap_var dw 0 
        v1 dw 0
        v2 dw 0 
        
        ;These variables are used by print array procedure 
        nsi dw  0
        nax dw 0
        ndx dw 0
        ; End of variables print array procedure 
       .code 
        
        mov ax,@data
        mov ds,ax
        
        main proc 
               
               
            call bubble_sort
            call print_arr
            .EXIT 
        endp main
        
        bubble_sort proc
          mov si , 0  
          mov ax, size 
          mov bx, size 
         
          
           
           
          bubble: 
               cmp si, ax
               jge end_bubble
                 ; Now the Inner Loop Starts 
                  mov di , 2
                  mov bx, ax 
                  sub bx, si
                  inner_loop: 
                  
                   cmp di,bx
                   jge end_inner_loop 
                     mov dx, uno[di-2] 
                     mov cx, uno[di] 
                      ; Inner if statement 
                      cmp dx, cx
                      jle end_inner_if

                        mov swap_var, cx 
                        mov cx, dx
                        mov dx, swap_var
                        
                        mov uno[di], cx
                        
                        mov uno[di-2], dx
                        
                        mov v1, cx
                        mov v2, dx
                        ; call swap_print 
                     
                     end_inner_if: 
                  add di ,2 
                  jmp inner_loop
                  end_inner_loop: 
                  
               
               add si , 2
               jmp bubble 
          end_bubble: 
            RET  
        endp bubble_sort
       
              print_arr proc
            ; Set the variables, So I wont lost the value of these registers 
             mov nsi, si
             mov nax, ax
             mov ndx, dx
             mov si, 0 
             mov ah,2 
                     
             mov dl, 0Ah 
             int 21h
             mov dl, 0Dh 
             int 21h 
              print "So, The array is "
            start_print:
                 mov ax, size
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
       
       
   
        
         define_scan_num 
         define_print_num
         define_print_num_uns