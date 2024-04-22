integer sip = 7;

init(){
    llSetLinkAlpha(2,0.850,ALL_SIDES);
    llSetLinkAlpha(3,0.850,ALL_SIDES);
    llSetLinkAlpha(4,0.850,ALL_SIDES);
    llSetLinkAlpha(5,0.850,ALL_SIDES);
    llSetLinkAlpha(6,1.0,ALL_SIDES);
    llSetTimerEvent(10);
}

default{
    state_entry(){
        init();
    }
    
    timer(){
        sip--;
        if(sip > 1){
            llSetLinkAlpha(sip,0.0,ALL_SIDES);
        }else{
            llResetScript();
        }
    }
}

