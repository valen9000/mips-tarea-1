.data
newline: .asciiz "\n"

.text
.globl main
main:
  li         $s0, 0              #almacena el 0 en s0
  li         $s1, 1              #almacena el 1 en s1
  
  #imprime lo que se almacena en s0
  li         $v0, 1
  move       $a0, $s0
  syscall                        

  #imprime el \n
  li         $v0, 4
  la         $a0, newline
  syscall

  #imprime lo que se almacena en s1
  li         $v0, 1
  move       $a0, $s1
  syscall

  #imprime el \n 
  li         $v0, 4
  la         $a0, newline
  syscall
  
  li         $s3, 18            #almacena el 18 en s3 (18 porque ya se imprimieron los 2 primeros numeros de los 20 que se piden)

  #loop que cumple la funcion del ciclo for
  loop:
  beq        $s3, $zero, exit       
  add        $s2, $s0, $s1      #s2 = s0 + s1
  #imprime lo que se almacena en s2
  li         $v0, 1
  move       $a0, $s2
  syscall                      
  #imprime \n
  li         $v0, 4
  la         $a0, newline
  syscall
  move       $s0, $s1
  move       $s1, $s2
  
  addi       $s3, $s3, -1      #decrementa

  j loop

  exit:
  li         $v0, 10
  syscall
