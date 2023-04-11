-- SKIP TUTOR
msgto = "ZAVFGC2" -- optional

function puncc()
for i=4,1,-1 do
punch(1,0)
sleep(200)
end
end
function text()
for i = 19,1,-1 do
totTxt = totTxt..string.char(math.random(97,122))
end
end
sendPacket(2, "ftue_start_popup_close")
sleep(500)
move(5,0)
sleep(200)
move(5,0)
sleep(200)
move(7,-3)
sleep(200)
enter()
sleep(2000)
move(7,0)
sleep(200)
puncc()
place(2,1,0)
sleep(1000)
puncc()
collectSet(true,4)
sleep(1000)
place(3,1,0)
sleep(1000)
place(10672,1,0)
sleep(1000)
punch(1,0)
sleep(1000)
collectSet(false,2)
sleep(1000)
wear(48)
sleep(1000)
sendPacket(3, "action|quit_to_exit")
sleep(1000)
totTxt = ""
text()
sendPacket(3, "action|join_request\nname|" .. totTxt.."\ninvitedWorld|0")
sleep(2000)
place(9640,0,-1)
sleep(1000)
say("/msg"..msgto.." Done")
