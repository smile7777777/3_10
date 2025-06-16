#include <8051.h>
#include "preemptive.h"
#include "keylib.h"
#include "buttonlib.h"
#include "lcdlib.h"

__data __at (0x39) char buffer;

__data __at (0x3A) char mutex;
__data __at (0x3B) char full;
__data __at (0x3C) char iter;

__data __at (0x3E) char prev_input;
__data __at (0x3F) char cur_input;

__data __at (0x20) char dino_pos;       // Dinosaur position (row)
__data __at (0x2E) char score;           // Game score
__data __at (0x23) char game_over;      // Game over flag
__data __at (0x24) char i;
__data __at (0x25) char j;
__data __at (0x26) char k;
__data __at (0x29) char cactus_pos[5];
__data __at (0x27) char pre_score;
__data __at (0x28) char flag;
__data __at (0x2F) char diff;

void keypad_ctrl(void) {
        while (1) {
        if (game_over) {ThreadExit(); return;}
        if (AnyButtonPressed()) {
            cur_input = ButtonToChar();
            if (cur_input != prev_input && prev_input == 0x00) {
                EA = 0; 
                buffer = cur_input; 
                prev_input = cur_input; 
                EA = 1;
            }
        }
        else if (AnyKeyPressed()) {
            cur_input = KeyToChar();
            if (cur_input != prev_input && prev_input == 0x00) {
                EA = 0;
                buffer = cur_input; 
                if (buffer == '2' ) { // Move up
                    LCD_cursorGoTo(dino_pos, 0); 
                    LCD_write_char(' ');
                    dino_pos = 0;
                    LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
                    LCD_write_char(0x00);
                } else if (buffer == '8') { // Move down
                    LCD_cursorGoTo(dino_pos, 0); 
                    LCD_write_char(' ');
                    dino_pos = 1;
                    LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
                    LCD_write_char(0x00);
                } 
                prev_input = cur_input; 
                EA = 1;
            }
        }
        else {
                prev_input = 0x00; 
        }
    }
}

void render_task(void) {
    //init(); // Initialize game state
    while (1) {
        if (game_over) {ThreadExit(); return;}
        //SemaphoreWait(mutex);
        SemaphoreWait(mutex);
        //LCD_clearScreen();
        //SemaphoreWait(full);
       // SemaphoreWait(mutex);
        // Draw cacti
        EA = 0;
        if(!k){;
                k = 1;
                LCD_cursorGoTo(0, cactus_pos[0]);
                LCD_write_char(' ');
                LCD_cursorGoTo(1, cactus_pos[1]);
                LCD_write_char(' ');
                LCD_cursorGoTo(0, cactus_pos[2]);
                LCD_write_char(' ');
                LCD_cursorGoTo(1, cactus_pos[3]);
                LCD_write_char(' ');
                LCD_cursorGoTo(0, cactus_pos[4]);
                LCD_write_char(' ');

                if(game_over) {return;}
                //LCD_cursorGoTo(0, 0); // 固定在第 0 列
                if (cactus_pos[0] == 0) cactus_pos[0] = 15;
                else cactus_pos[0] = cactus_pos[0] - 1;
                if (cactus_pos[1] == 0) cactus_pos[1] = 15;
                else cactus_pos[1] = cactus_pos[1] - 1;
                if (cactus_pos[2] == 0) cactus_pos[2] = 15;
                else cactus_pos[2] = cactus_pos[2] - 1;
                if (cactus_pos[3] == 0) cactus_pos[3] = 15;
                else cactus_pos[3] = cactus_pos[3] - 1;
                if (cactus_pos[4] == 0) cactus_pos[4] = 15;
                else cactus_pos[4] = cactus_pos[4] - 1;
                //cactus_pos[0] = (cactus_pos[0] == 0) ? 15 : cactus_pos[0] - 1;
                //cactus_pos[1] = (cactus_pos[1] == 0) ? 15 : cactus_pos[1] - 1;
                //cactus_pos[2] = (cactus_pos[2] == 0) ? 15 : cactus_pos[2] - 1;
                //cactus_pos[3] = (cactus_pos[3] == 0) ? 15 : cactus_pos[3] - 1;
                //cactus_pos[4] = (cactus_pos[4] == 0) ? 15 : cactus_pos[4] - 1;
                if(game_over) { 
                    return;
                }
                else{   
                        if(!flag){
                            if (score == 9){
                                score = 0;
                                pre_score = pre_score + 1;
                            }
                            else {
                                score = score + 1;
                            }
                        }
                        flag = 1;
                        LCD_cursorGoTo(0, cactus_pos[0]);
                        LCD_write_char(0x01);
                        LCD_cursorGoTo(1, cactus_pos[1]);
                        LCD_write_char(0x01);
                        LCD_cursorGoTo(0, cactus_pos[2]);
                        LCD_write_char(0x01);
                        LCD_cursorGoTo(1, cactus_pos[3]);
                        LCD_write_char(0x01);
                        LCD_cursorGoTo(0, cactus_pos[4]);
                        LCD_write_char(0x01);
                        LCD_returnHome();
        }
        //LCD_clearScreen();
        //LCD_setDdRamAddress(0x00);
        }
        EA = 1;
        //LCD_cursorGoTo(0, 0);
        SemaphoreSignal(mutex);
        //SemaphoreSignal(mutex);
        //SemaphoreSignal(empty);
        //SemaphoreSignal(mutex);
        //EA = 0;
        //SemaphoreSignal(mutex);
        ThreadYield(); 
    }
}

void init(void) {
    TMOD |= 0x20;
    SCON = 0x50;        
    TH1 = (char) -6;            
    TR1 = 1;            
    TI = 1;
    dino_pos = 0; // Dinosaur starts at row 0
    score = 0;      // Reset score
    pre_score = 0;
    game_over = 0;  // Game is running
    cactus_pos[0] = 4;
    cactus_pos[1] = 6;
    cactus_pos[2] = 8;
    cactus_pos[3] = 12;
    cactus_pos[4] = 14;  
    k = 0;;
    flag = 1;
    LCD_cursorGoTo(0, 0); // 固定在第 0 列
    LCD_write_char(0x00);
    LCD_cursorGoTo(0, cactus_pos[0]);
    LCD_write_char(0x01);
    LCD_cursorGoTo(1, cactus_pos[1]);
    LCD_write_char(0x01);
    LCD_cursorGoTo(0, cactus_pos[2]);
    LCD_write_char(0x01);
    LCD_cursorGoTo(1, cactus_pos[3]);
    LCD_write_char(0x01);
    LCD_cursorGoTo(0, cactus_pos[4]);
    LCD_write_char(0x01);
    diff = 0;
    i = 0;
    //LCD_returnHome();
}

void update_cactus(void) {
    //SemaphoreWait(empty);
    if(game_over) {
        return;}
    SemaphoreWait(mutex);
    //EA = 0;
    if (k) {
        k = 0;
    }
    //EA = 1;
    SemaphoreSignal(mutex); 
    //SemaphoreSignal(full);
}


void move_dinosaur(void) {
    if(game_over) return;
    else {
        dino_pos = dino_pos;
    }
    
    if (dino_pos != 0 && dino_pos != 1) {
        dino_pos = 0; // 回到安全值 0
    }  
}

void end_game(void) {
            i = 0;
            j = 0;
            while(1){
                while(1){
                    LCD_cursorGoTo(i, j);
                    LCD_write_char(' ');
                    j = j + 1;
                    if(j == 16){ j = 0; break;}
                }
                i = i + 1;
                if(i == 2)break;
            }
            i = 0;
            j = 0;
            LCD_cursorGoTo(0, 0);
            j = 'G';
            LCD_write_char(j);
            LCD_cursorGoTo(0, 1);
            j = 'a';
            LCD_write_char(j);
            LCD_cursorGoTo(0, 2);
            j = 'm';
            LCD_write_char(j);
            LCD_cursorGoTo(0, 3);
            j = 'e';
            LCD_write_char(j);
            LCD_cursorGoTo(0, 4);
            j = ' ';
            LCD_write_char(j);
            LCD_cursorGoTo(0, 5);
            j = 'o';
            LCD_write_char(j);
            LCD_cursorGoTo(0, 6);
            j = 'v';
            LCD_write_char(j);
            LCD_cursorGoTo(0, 7);
            j = 'e';
            LCD_write_char(j);
            LCD_cursorGoTo(0, 8);
            j = 'r';
            LCD_write_char(j);
            LCD_cursorGoTo(1, 0);
            j = 'S';
            LCD_write_char(j);
            LCD_cursorGoTo(1, 1);
            j = 'c';
            LCD_write_char(j);
            LCD_cursorGoTo(1, 2);
            j = 'o';
            LCD_write_char(j);
            LCD_cursorGoTo(1, 3);
            j = 'r';
            LCD_write_char(j);
            LCD_cursorGoTo(1, 4);
            j = 'e';
            LCD_write_char(j);
            LCD_cursorGoTo(1, 5);
            j = ' ';
            LCD_write_char(j);
            LCD_cursorGoTo(1, 6);
            j = ':';
            LCD_write_char(j);
            LCD_cursorGoTo(1, 7);
            j = ' ';
            LCD_write_char(j);
            LCD_cursorGoTo(1, 8);
            j = pre_score % 10 + '0';
            LCD_write_char(j); // 
            LCD_cursorGoTo(1, 9);
            j = score % 10 + '0';
            LCD_write_char(j); //
            delay(40);     
            LCD_returnHome();
            return;
}


void game_ctrl(void) {
    //if(game_over) return;
   // init(); // Initialize game state
    while (1) {
        //LCD_setDdRamAddress(0x00);
        if (LCD_ready()) {
            //EA = 0;
            update_cactus();
            //EA = 0;
            flag = 1;
            EA = 0;
            i = 0;
                while(1){
                    if (i == 5){ break;}
                    if((cactus_pos[i] == 0)){
                        if((i-dino_pos) % 2 == 0){
                            game_over = 1; 
                            EA = 1;
                            return;        
                        }else if(flag){
                            flag = 0;
                        }
                    }
                    i = i + 1;
                }
            i = 0;
            j = 20 - 2*diff;
            while(1){
                delay(255); // Control game speed
                delay(255);
                delay(255);
                delay(255);
                delay(255);
                //ThreadYield();
                delay(255);
                delay(255);
                delay(255);
                delay(255);
                delay(255);
                move_dinosaur();
               if (AnyKeyPressed()) {
                    cur_input = KeyToChar();
                    if (cur_input != prev_input && prev_input == 0x00) {
                        buffer = cur_input; 
                        if (buffer == '2' ) { // Move up
                            LCD_cursorGoTo(dino_pos, 0); 
                            LCD_write_char(' ');
                            dino_pos = 0;
                            LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
                            LCD_write_char(0x00);
                        } else if (buffer == '8') { // Move down
                            LCD_cursorGoTo(dino_pos, 0); 
                            LCD_write_char(' ');
                            dino_pos = 1;
                            LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
                            LCD_write_char(0x00);
                        } 
                        prev_input = cur_input; 
                    }
                }
                else {
                        prev_input = 0x00; 
                }
                iter = 0;
                while(1){
                    if (iter == 5){ break;}
                    if((cactus_pos[iter] == 0)){
                        if((iter-dino_pos) % 2 == 0){
                            game_over = 1; 
                            EA = 1;
                            return;        
                        }else if(flag){
                            flag = 0;
                        }
                    }
                    iter = iter + 1;
                }
                delay(255);
                delay(255);
                delay(255);
                delay(255);
                delay(255);
                //ThreadYield();
                delay(255);
                delay(255);
                delay(255);
                delay(255);
                delay(255);
                //ThreadYield();
                i = i + 1;
                if ((j-i) == 0) break;
            }
            //LCD_cursorGoTo(1,15);
            //LCD_write_char(diff + '0');
            EA = 1;

            if (game_over == 1) {
                LCD_clearScreen();
                delay(300);
                ThreadExit();
                return; // Exit the loop
            }
            //ThreadYield();
        }
    }
}

void main(void) {
        LCD_Init();
        Init_Keypad();
        SemaphoreCreate(mutex,1);
        SemaphoreCreate(full,0);
        //SemaphoreCreate(empty,5);
        init();

        while(1){
            if (AnyButtonPressed()) {
                cur_input = ButtonToChar();
                if (cur_input != prev_input && prev_input == 0x00 && diff == 0){
                    i = cur_input;
                }
            }
            else if (AnyKeyPressed()) {
                cur_input = KeyToChar();
                if (cur_input != prev_input && prev_input == 0x00) {
                    if(!diff){
                        if ('1' <= i && i <= '9' && cur_input == '#') {
                            diff = i - '0';
                        }else {
                            i = cur_input;
                        }
                    }
                    prev_input = cur_input; 
                }
            }
            else {
                    prev_input = 0x00; 
            }
            if(diff) break;
        } 
        ThreadCreate(keypad_ctrl);
        //while(!diff);
        if (!game_over)
            ThreadCreate(render_task);
        //while(!diff);
        if (!game_over) 
            game_ctrl();
        

        end_game(); 
        game_over = 0;  
        score = 0;
        pre_score = 0;
        while(1);
}

void _sdcc_gsinit_startup(void) {
        __asm
                ljmp  _Bootstrap
        __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}

void timer0_ISR(void) __interrupt(1) {
        __asm
            ljmp _myTimer0Handler
        __endasm;
}


