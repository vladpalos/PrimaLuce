
print ("Hello from PrimaLuce - Animation!!!");

dog = plImage("res/sm.bmp");

pos = {};
pos.x = 0;
pos.y = 0;

v = 3.0;
xt = v;
yt = v;

function plOnPulse()

    if (pos.x>300) then xt = -v; end
    if (pos.y>300) then yt = -v; end
    if (pos.x<0) then xt = v; end
    if (pos.x<0) then yt = v; end

    pos.x = pos.x + xt;
    pos.y = pos.x + yt;
    dog:draw(pos.x, pos.y);    
end


