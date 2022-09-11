		# Define global variable a in data section
.data
        .comm   n,8             # long n (input number's quantity)
        .comm   num,8           # long number (each input number)
        .comm   sum,8           #
        .comm   index,8         # index i for iteration
.text
format1:
        .string "N?"
format2:
        .string "%ld"
format3:
        .string "SUM=%ld\n"
format4:
        .string "AVG=%ld\n"
.globl main
main:                          # main()
                               
        pushq   %rbp           # Save frame pointer
        movq    %rsp, %rbp     
                               
        movq    $0,index
        movq    $0,sum
        movq    $0,num
        movq    $format1, %rdi # printf("N?");
        movq    $0, %rax       
        call    printf         
                               
        movq    $format2, %rdi # scanf("%ld",&n);
        movq    $n, %rsi       
        movq    $0, %rax       
        call    scanf          
while:
        movq    n, %rdx
        movq    index, %rcx
        cmpq    %rcx, %rdx     #compare if n = i, if n >= i jump to after
        jle      after         

aftercmp:
        movq    $format2, %rdi #scanf("%ld",&num)
        movq    $num, %rsi
        movq    $0, %rax
        call    scanf
          
        movq   num, %rdx
        addq    %rdx ,sum
        addq    $1, index      # i++ and iterate
        jmp     while
after:
        movq    $format3, %rdi # printf("SUM=%ld\n",SUM);
        movq    sum, %rsi      
        movq    $0, %rax       
        call    printf         

        movq    sum,%rax       # return = sum / n
        idivq   n

        movq    $format4, %rdi # printf("AVG=\n",avg)
        movq    %rax, %rsi
        movq    $0, %rax
        call    printf

        leave                  # pops the frame pointer
        ret                    # }


