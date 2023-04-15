botList = {
    "LOG1","LOG2","LOG3","LOG4"
}
password = ""
strg,strgId = "REZPICK","ROT"

function round(number)
    return number % 1 > 0.5 and math.ceil(number) or math.floor(number)
end

for i = 1,#botList do 
    addBot(botList[i],password)
    sleep(10000)
    while getBot().status ~= "online" do 
        connect()
        sleep(10000)
    end 
    sleep(3000)
    if not findClothes(98) then 
        sendPacket(3,"action|join_request\nname|"..strg.."|"..strgId.."\ninvitedWorld|0")
        sleep(8000)
        while findItem(98) == 0 do 
            for _,obj in pairs(getObjects()) do
                if obj.id == 98 then 
                    findPath(round(obj.x/32),math.floor(obj.y/32))
                    sleep(1000)
                    collect(3)
                    sleep(1000)
                end 
                if findItem(98) > 0 then 
                    break 
                end 
            end 
            sleep(1000)
        end 
        wear(98)
        sleep(1000)
        move(-1,0)
        sleep(1000)
        sendPacket(2,"action|drop\n|itemID|98")
        sendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|98|\ncount|"..(findItem(98)-1))
        sleep(1000)
    end
    removeBot(getBot().name)
    sleep(5000)
end 
