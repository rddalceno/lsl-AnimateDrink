float volume = 0.250;
float position = -0.005;
integer interval = 15;
integer sips = 0;
integer ticks = 0;

say(string text){
    llOwnerSay(text);
}

default{

    attach(key av){
        llResetScript();
    }
    
    state_entry(){
        llSetLinkPrimitiveParams(2,[PRIM_SIZE,<0.110,0.110,volume>]);
        llSetLinkPrimitiveParams(2,[PRIM_POS_LOCAL,<0.0007,0.0000,position>]);
        llRequestPermissions(llGetOwner(),
            PERMISSION_TRIGGER_ANIMATION|
            PERMISSION_ATTACH|
            0);
    }
    
    run_time_permissions(integer perm){
        if(perm & PERMISSION_ATTACH){
            llAttachToAvatarTemp(0);
            llSetTimerEvent(1);
        }
    }
    
    timer(){
        integer perm = llGetPermissions();
        llStartAnimation("sip rest loop");
        
        ticks++;
        if( (ticks%interval) == 0){
            if(sips < 5){
                llStartAnimation("sipping sl");
                llSleep(0.7);
                volume = volume - 0.05;
                position = position - 0.025;
                llSetLinkPrimitiveParamsFast(2,[PRIM_SIZE,<0.110,0.110,volume>]);
                llSetLinkPrimitiveParamsFast(2,[PRIM_POS_LOCAL,<0.0007,0.0000,position>]);
                sips++;
            } else {
               // llStopAnimation("hold_r_handgun");
                llStopAnimation("sipping sl");
                llStopAnimation("sip rest loop");
                llSay(0,"Hmmm... tha was good...");
                if (perm && PERMISSION_ATTACH){
                    llDetachFromAvatar();
                }
            }
        }else {
            llStartAnimation("sip rest loop");
        }
         
    }
}

