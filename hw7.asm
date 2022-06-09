format PE console
include 'win32ax.inc'

;=======================================
section '.code' code readable executable
;=======================================
start:
        cinvoke printf, "Play tic-tac-toe with a computer! "
        cinvoke printf, "You will be X's and the computer will be O's %c",  10
        cinvoke printf, "The board will be laid out as the following:%c",10
        cinvoke printf, "%c          1 | 2 | 3 %c", 10, 10
        cinvoke printf, "         ---|---|---%c", 10
        cinvoke printf, "          4 | 5 | 6 %c", 10
        cinvoke printf, "         ---|---|---%c", 10
        cinvoke printf, "          7 | 8 | 9 %c%c%c", 10, 10,10



        cinvoke time, 0       ; get time for seed
        cinvoke srand, eax    ; seed rng

gameLoop:
        call printBoard
        cinvoke printf, "What square (1-9) to place an X? "
        cinvoke scanf, "%d", Square
        call placeX
        call checkXWin
        call checkDraw
        call computerMove
        call checkOWin
        jmp gameLoop
computerMove:
;=================================================================
;                  Checking for any computer wins moves
;=================================================================


;==============Checking for S1====================================
   checkS1row:
        cmp [S1],' '
        jne checkS2row
        cmp [S2],'O'
        jne checkS1colum
        cmp [S3],'O'
        jne checkS1colum
        mov [S1],'O'
        jmp computerWins
   checkS1colum:

        cmp [S4],'O'
        jne checkS1diagonal
        cmp [S7],'O'
        jne checkS1diagonal
        mov [S1],'O'
        jmp computerWins

   checkS1diagonal:
        cmp [S5],'O'
        jne checkS2row
        cmp [S9],'O'
        jne checkS2row
        mov [S1],'O'
        jmp computerWins
;=============Checking for S2=====================================
   checkS2row:
        cmp [S2],' '
        jne checkS3row
        cmp [S1],'O'
        jne checkS2colum
        cmp [S3],'O'
        jne checkS2colum
        mov [S2],'O'
        jmp computerWins
   checkS2colum:
        cmp [S5],'O'
        jne checkS3row
        cmp [S8],'O'
        jne checkS3row
        mov [S2],'O'
        jmp computerWins

;===========Checking for S3=======================================
   checkS3row:
        cmp [S3],' '
        jne checkS4row
        cmp [S1],'O'
        jne checkS3colum
        cmp [S2],'O'
        jne checkS3colum
        mov [S3],'O'
        jmp computerWins
   checkS3colum:
        cmp [S6],'O'
        jne checkS3diagonal
        cmp [S9],'O'
        jne checkS3diagonal
        mov [S3],'O'
        jmp computerWins
   checkS3diagonal:
        cmp [S5],'O'
        jne checkS4row
        cmp [S7],'O'
        jne checkS4row
        mov [S3],'O'
        jmp computerWins

;==========Checking for S4========================================

   checkS4row:
        cmp [S4],' '
        jne checkS5row
        cmp [S1],'O'
        jne checkS4colum
        cmp [S7],'O'
        jne checkS4colum
        mov [S4],'O'
        jmp computerWins
   checkS4colum:
        cmp [S5],'O'
        jne checkS5row
        cmp [S6],'O'
        jne checkS5row
        mov [S4],'O'
        jmp computerWins

;==========Checking for S5========================================

   checkS5row:
        cmp [S5],' '
        jne checkS6row
        cmp [S4],'O'
        jne checkS5colum
        cmp [S6],'O'
        jne checkS5colum
        mov [S5],'O'
        jmp computerWins
   checkS5colum:
        cmp [S2],'O'
        jne checkS5diagonal
        cmp [S8],'O'
        jne checkS5diagonal
        mov [S5],'O'
        jmp computerWins
   ;this is for the middle diagonal parts

   checkS5diagonal:
        cmp [S3],'O'
        jne checkS5diagonal2
        cmp [S7],'O'
        jne checkS5diagonal2
        mov [S5],'O'
        jmp computerWins

   checkS5diagonal2:
        cmp [S1],'O'
        jne checkS6row
        cmp [S9],'O'
        jne checkS6row
        mov [S5],'O'
        jmp computerWins
;==========Checking for S6========================================

   checkS6row:
        cmp [S6],' '
        jne checkS7row
        cmp [S4],'O'
        jne checkS6colum
        cmp [S5],'O'
        jne checkS6colum
        mov [S6],'O'
        jmp computerWins
   checkS6colum:
        cmp [S3],'O'
        jne checkS7row
        cmp [S9],'O'
        jne checkS7row
        mov [S6],'O'
        jmp computerWins

;==========Checking for S7========================================

   checkS7row:
        cmp [S7],' '
        jne checkS8row
        cmp [S8],'O'
        jne checkS7colum
        cmp [S9],'O'
        jne checkS7colum
        mov [S7],'O'
        jmp computerWins
   checkS7colum:
        cmp [S1],'O'
        jne checkS7diagonal
        cmp [S4],'O'
        jne checkS7diagonal
        mov [S7],'O'
        jmp computerWins
   checkS7diagonal:
        cmp [S5],'O'
        jne checkS8row
        cmp [S3],'O'
        jne checkS8row
        mov [S7],'O'
        jmp computerWins

;==========Checking for S8========================================

   checkS8row:
        cmp [S8],' '
        jne checkS9row
        cmp [S7],'O'
        jne checkS8colum
        cmp [S9],'O'
        jne checkS8colum
        mov [S8],'O'
        jmp computerWins
   checkS8colum:
        cmp [S2],'O'
        jne checkS9row
        cmp [S5],'O'
        jne checkS9row
        mov [S8],'O'
        jmp computerWins

;==========Checking for S9========================================
   checkS9row:
        cmp [S9],' '
        jne checkS1blockrow
        cmp [S7],'O'
        jne checkS9colum
        cmp [S8],'O'
        jne checkS9colum
        mov [S9],'O'
        jmp computerWins
   checkS9colum:
        cmp [S3],'O'
        jne checkS9diagonal
        cmp [S6],'O'
        jne checkS9diagonal
        mov [S9],'O'
        jmp computerWins
   checkS9diagonal:
        cmp [S1],'O'
        jne checkS1blockrow
        cmp [S5],'O'
        jne checkS1blockrow
        mov [S9],'O'
        jmp computerWins






;=================================================================

;Checking for any block moves

;=================================================================


;___________________block S1_____________________
   checkS1blockrow:
        cmp [S1],' '
        jne checkS2blockrow
        cmp [S2],'X'
        jne checkS1blockColum
        cmp [S3],'X'
        jne checkS1blockColum
        mov [S1],'O'
        ret

   checkS1blockColum:
        cmp [S4],'X'
        jne checkS1blockdiagonal
        cmp [S7],'X'
        jne checkS1blockdiagonal
        mov [S1],'O'
        ret

   checkS1blockdiagonal:
        cmp [S5],'X'
        jne checkS2blockrow
        cmp [S9],'X'
        jne checkS2blockrow
        mov [S1],'O'
        ret



;___________________block S2_____________________
   checkS2blockrow:
        cmp [S2],' '
        jne checkS3blockrow
        cmp [S1],'X'
        jne checkS2blockcolum
        cmp [S3],'X'
        jne checkS2blockcolum
        mov [S2],'O'
        ret

   checkS2blockcolum:
        cmp [S5],'X'
        jne checkS3blockrow
        cmp [S8],'X'
        jne checkS3blockrow
        mov [S2],'O'
        ret
;___________________block S3_____________________
   checkS3blockrow:
        cmp [S3],' '
        jne checkS4blockrow
        cmp [S1],'X'
        jne checkS3blockcolum
        cmp [S2],'X'
        jne checkS3blockcolum
        mov [S3],'O'
        ret
   checkS3blockcolum:
        cmp [S6],'X'
        jne checkS3blockdiagonal
        cmp [S9],'X'
        jne checkS3blockdiagonal
        mov [S3],'O'
        ret
   checkS3blockdiagonal:
        cmp [S5],'X'
        jne checkS4blockrow
        cmp [S7],'X'
        jne checkS4blockrow
        mov [S3],'O'
        ret
;___________________block S4_____________________

   checkS4blockrow:
        cmp [S4],' '
        jne checkS5blockrow
        cmp [S1],'X'
        jne checkS4blockcolum
        cmp [S7],'X'
        jne checkS4blockcolum
        mov [S4],'O'
        ret
   checkS4blockcolum:
        cmp [S5],'X'
        jne checkS5blockrow
        cmp [S6],'X'
        jne checkS5blockrow
        mov [S4],'O'
        ret

;___________________block S5_____________________

   checkS5blockrow:
        cmp [S5],' '
        jne checkS6blockrow
        cmp [S4],'X'
        jne checkS5blockcolum
        cmp [S6],'X'
        jne checkS5blockcolum
        mov [S5],'O'
        ret
   checkS5blockcolum:
        cmp [S2],'X'
        jne checkS5blockdiagonal
        cmp [S8],'X'
        jne checkS5blockdiagonal
        mov [S5],'O'
        ret
   ;this is for the middle diagonal parts

   checkS5blockdiagonal:
        cmp [S3],'X'
        jne checkS5blockdiagonal2
        cmp [S7],'X'
        jne checkS5blockdiagonal2
        mov [S5],'O'
        ret

   checkS5blockdiagonal2:
        cmp [S1],'X'
        jne checkS6blockrow
        cmp [S9],'X'
        jne checkS6blockrow
        mov [S5],'O'
        ret

;___________________block S6_____________________

   checkS6blockrow:
        cmp [S6],' '
        jne checkS7blockrow
        cmp [S4],'X'
        jne checkS6blockcolum
        cmp [S5],'X'
        jne checkS6blockcolum
        mov [S6],'O'
        ret
   checkS6blockcolum:
        cmp [S3],'X'
        jne checkS7blockrow
        cmp [S9],'X'
        jne checkS7blockrow
        mov [S6],'O'
        ret
;___________________block S7_____________________

   checkS7blockrow:
        cmp [S7],' '
        jne checkS8blockrow
        cmp [S8],'X'
        jne checkS7blockcolum
        cmp [S9],'X'
        jne checkS7blockcolum
        mov [S7],'O'
        ret
   checkS7blockcolum:
        cmp [S1],'X'
        jne checkS7blockdiagonal
        cmp [S4],'X'
        jne checkS7blockdiagonal
        mov [S7],'O'
        ret
   checkS7blockdiagonal:
        cmp [S5],'X'
        jne checkS8blockrow
        cmp [S3],'X'
        jne checkS8blockrow
        mov [S7],'O'
        ret
;___________________block S8_____________________

   checkS8blockrow:

        cmp [S8],' '
        jne checkS9blockrow
        cmp [S7],'X'
        jne checkS8blockcolum
        cmp [S9],'X'
        jne checkS8blockcolum
        mov [S8],'O'
        ret
   checkS8blockcolum:
        cmp [S2],'X'
        jne checkS9blockrow
        cmp [S5],'X'
        jne checkS9blockrow
        mov [S8],'O'
        ret

;___________________block S9_____________________

   checkS9blockrow:

        cmp [S9],' '
        jne checkDraw
        cmp [S7],'X'
        jne checkS9blockcolum
        cmp [S8],'X'
        jne checkS9blockcolum
        mov [S9],'O'
        ret
   checkS9blockcolum:
        cmp [S3],'X'
        jne checkS9blockdiagonal
        cmp [S6],'X'
        jne checkS9blockdiagonal
        mov [S9],'O'
        ret
   checkS9blockdiagonal:
        cmp [S1],'X'
        jne computerRandomMove
        cmp [S5],'X'
        jne computerRandomMove
        mov [S9],'O'
        ret
;==========================================
; computer random move
;==========================================
    computerRandomMove:
        cinvoke rand ;rand num returned to eax
        mov EBX, 9
        cdq
        idiv EBX     ;divide by 9 and put remainder in edx
        inc EDX      ;EDX has random number 1-9
        cmp EDX, 1
        jne computerMoveS2
        cmp[S1], ' '
        jne computerRandomMove
        mov [S1], 'O'
        ret
    computerMoveS2:
        cmp EDX, 2
        jne computerMoveS3
        cmp[S2], ' '
        jne computerRandomMove
        mov [S2], 'O'
        ret
    computerMoveS3:
        cmp edx, 3
        jne computerMoveS4
        cmp[S3], ' '
        jne computerRandomMove
        mov [S3], 'O'
        ret
    computerMoveS4:
        cmp edx, 4
        jne computerMoveS5
        cmp[S4], ' '
        jne computerRandomMove
        mov [S4], 'O'
        ret
    computerMoveS5:
        cmp edx, 5
        jne computerMoveS6
        cmp[S5], ' '
        jne computerRandomMove
        mov [S5], 'O'
        ret
    computerMoveS6:
        cmp edx, 6
        jne computerMoveS7
        cmp[S6], ' '
        jne computerRandomMove
        mov [S6], 'O'
        ret
    computerMoveS7:
        cmp edx, 7
        jne computerMoveS8
        cmp[S7], ' '
        jne computerRandomMove
        mov [S7], 'O'
        ret
    computerMoveS8:
        cmp edx, 8
        jne computerMoveS9
        cmp[S8], ' '
        jne computerRandomMove
        mov [S8], 'O'
        ret
    computerMoveS9:
        cmp edx, 9
        jne computerRandomMove
        mov [S9], 'O'
        ret



checkDraw:
        cmp [S1], ' '
        je notDraw
        cmp [S2], ' '
        je notDraw
        cmp [S3], ' '
        je notDraw
        cmp [S4], ' '
        je notDraw
        cmp [S5], ' '
        je notDraw
        cmp [S6], ' '
        je notDraw
        cmp [S7], ' '
        je notDraw
        cmp [S8], ' '
        je notDraw
        cmp [S9], ' '
        je notDraw
        jmp draw

notDraw:
        ret

checkXWin:
;Checking wins for horizontal X's
        checkTopRowX:
           cmp [S1], 'X'
           jne checkMiddleRowX
           cmp [S2], 'X'
           jne checkMiddleRowX
           cmp [S3], 'X'
           jne checkMiddleRowX
           jmp playerWins
        checkMiddleRowX:
           cmp [S4], 'X'
           jne checkBottomRowX
           cmp [S5], 'X'
           jne checkBottomRowX
           cmp [S6], 'X'
           jne checkBottomRowX
           jmp playerWins
        checkBottomRowX:
           cmp [S7], 'X'
           jne check1ColumX
           cmp [S8], 'X'
           jne check1ColumX
           cmp [S9], 'X'
           jne check1ColumX
           jmp playerWins

;Checking wins for vertical X's
        check1ColumX:
           cmp [S1], 'X'
           jne check2ColumX
           cmp [S4], 'X'
           jne check2ColumX
           cmp [S7], 'X'
           jne check2ColumX
           jmp playerWins
        check2ColumX:
           cmp [S2], 'X'
           jne checkColumX
           cmp [S5], 'X'
           jne checkColumX
           cmp [S8], 'X'
           jne checkColumX
           jmp playerWins
        checkColumX:
           cmp [S3], 'X'
           jne checkDiagonalX
           cmp [S6], 'X'
           jne checkDiagonalX
           cmp [S9], 'X'
           jne checkDiagonalX
           jmp playerWins

;Checking for Diagonal Wins
        checkDiagonalX:
           cmp [S1], 'X'
           jne checkDiagonal2X
           cmp [S5], 'X'
           jne checkDiagonal2X
           cmp [S9], 'X'
           jne checkDiagonal2X
           jmp playerWins
        checkDiagonal2X:
           cmp [S3], 'X'
           jne noXwin
           cmp [S5], 'X'
           jne noXwin
           cmp [S7], 'X'
           jne noXwin
           jmp playerWins

        noXwin: ;after the last X check
           ret

checkOWin:



placeX:
placeX1:
        cmp [Square], 1
        jne placeX2
        cmp [S1], ' '
        jne gameLoop
        mov [S1], 'X'
        ret

placeX2:
        cmp [Square], 2
        jne placeX3
        cmp [S2], ' '
        jne gameLoop
        mov [S2], 'X'
        ret

placeX3:
        cmp [Square], 3
        jne placeX4
        cmp [S3], ' '
        jne gameLoop
        mov [S3], 'X'
        ret

placeX4:
        cmp [Square], 4
        jne placeX5
        cmp [S4], ' '
        jne gameLoop
        mov [S4], 'X'
        ret

placeX5:
        cmp [Square], 5
        jne placeX6
        cmp [S5], ' '
        jne gameLoop
        mov [S5], 'X'
        ret

placeX6:
        cmp [Square], 6
        jne placeX7
        cmp [S6], ' '
        jne gameLoop
        mov [S6], 'X'
        ret

placeX7:
        cmp [Square], 7
        jne placeX8
        cmp [S7], ' '
        jne gameLoop
        mov [S7], 'X'
        ret

placeX8:
        cmp [Square], 8
        jne placeX9
        cmp [S8], ' '
        jne gameLoop
        mov [S8], 'X'
        ret

placeX9:
        cmp [Square], 9
        jne placeX10
        cmp [S9], ' '
        jne gameLoop
        mov [S9], 'X'
        ret

placeX10:


printBoard:
        cinvoke printf,"%c=======================================================%c",10,10
        cinvoke printf, "%c          %1.1s | %1.1s | %1.1s %c", 10, S1, S2, S3, 10
        cinvoke printf, "         ---|---|---%c", 10
        cinvoke printf, "          %1.1s | %1.1s | %1.1s %c", S4, S5, S6, 10
        cinvoke printf, "         ---|---|---%c", 10
        cinvoke printf, "          %1.1s | %1.1s | %1.1s %c%c", S7, S8, S9, 10,10
        ret

playerWins:
        call printBoard
        cinvoke printf, "You saved the human race! You beat the computer! %c%c", 10, 10
        jmp ending

computerWins:
        call printBoard
        cinvoke printf, "The Computer beat you... I guess Elon Musk was right..%c%c", 10, 10
        jmp ending

draw:
        call printBoard
        cinvoke printf, "%cIt's a draw! %c", 10, 10
        jmp ending

ending:
        cinvoke printf, "%cPress almost any key to continue...%c", 10 ,10
        invoke getch
;======================================
section '.data' data readable writeable
;======================================
Square   dd 0
S1       db ' '
S2       db ' '
S3       db ' '
S4       db ' '
S5       db ' '
S6       db ' '
S7       db ' '
S8       db ' '
S9       db ' '
RandomNumber dd 0
;====================================
section '.idata' import data readable
;====================================
library msvcrt,'msvcrt.dll',kernel32,'kernel32.dll'
import msvcrt,printf,'printf',scanf,'scanf', getch,'_getch', rand, 'rand',srand,'srand',time,'time'
import kernel32,Sleep,'Sleep'