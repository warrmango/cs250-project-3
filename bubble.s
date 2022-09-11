.text
.globl bubblesort     
                   
         bubblesort:             # void bubble(long n, long * a)                       
                                 #    // n = %rdi     a = %rsi
                                 #    // i = %rdx     j = %rax
                                 #    // r8 = n-i-1

         pushq   %rbp            # Save frame pointer
         movq    %rsp, %rbp      #
                                 
         movq    $0,%rdx         #    i = 0
         movq    $0,%rax         #    j = 0
         subq    $1,%rdi         #    n-- (this step for array index,store n-1 in %rdi)

while:   cmpq    %rdx,%rdi       #    while (i < n-1) { 
         jle     afterw          
                                 
while1:  movq    %rdi,%r8        #    j(r8) = n - 1 - i
         subq    %rdx,%r8        #    while(j < n-1-i)
         cmpq    %rax,%r8        
         jle     afterw1

         movq    %rax,%rcx       #    long*ptr(rcx) = &a[j]; 
         imulq   $8,%rcx         
         addq    %rsi,%rcx
         
         movq    %rcx,%r9        #    long*ptr2 = &a[j+1]
         addq    $8,%r9          
         movq    (%r9),%r10

         cmpq    (%rcx),%r10
         jge     afterif         #    if (a[j] > a[j+1])

         movq    (%rcx),%r11     #    swap a[j] and a[j+1] if statement is true
         movq    %r10,(%rcx)
         movq    %r11,(%r9)      #    (using r10 was modified by cmpq,so r9)

afterif: addq    $1,%rax         #    j++ (inear loop)
         jmp     while1

afterw1: movq    $0,%rax
         addq    $1,%rdx         #    i++ (outer loop)
         jmp     while                 
                                 
afterw:  leave                   #
         ret                     # }


