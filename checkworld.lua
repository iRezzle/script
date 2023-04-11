-- CHECK WORLD

farmList = {"OMYBQ","UXMXW","EYLBS","UXMXH","KHYGC","UQLNX","OUVSB","JMYRF","FPGVB","ALYNJ","DTIBB","SLBMX","XMAZEF","ZXIHM","ZIIAB","KXOHW","QGYOL","PZEIC","WDUZH","PQEJG","HAHAHZ29","FRSOG","FRNOG","DZUQG","FJYDB","XFUPS","CWQWL","QTFCW","SQJUV","QNMYM","VOWVU","EDIVR","CWVJM","XNEHG","TRKLI","KXOHX","PMLKN","QYEIU","WZEQF","QTFCZ","TOVNV","JXSYJ","QTFCT","DLNKL","SMQQI","HRWDC", "ISXGM","SHSGWY1","CJGCV","KM325","EHBIY","GSZFZ", "NDUGS","KEJWA","NCFZU", "CLVAE","LTFOG","OLTRG","NUQPF","JGBJQ","UMRNT","NIZBT","DAJYD","CXSIV","WTNJR","HKNEX","HTHCO","ZFQTQ","RWJQH","HDPXA", "RXDRB","VTXSH","UXMXZ","TPJUY","QTHBA","TJRZJ","QZWRN","IBBRV","PYRJG","QAVXI","BPLLJ","EFFWN","WSWFG","GOYXM","KLKSZ"}
tree = 4585 --SEED ID
webhook = "https://discord.com/api/webhooks/1045224935150329857/MV6_pODRPo6ZwkPUBO5MU1wh9orfl5WGvpddoAYq8azNOAPrL3OtKgjrjpaNg7tJn35a"

local function scanTree(itemid)
    local count = 0
    for _, tile in pairs(getTiles()) do
        if tile.fg == itemid and tile.ready then
            count = count + 1
        end
    end
    return count
end

local function scanUnready(itemid)
    local count = 0
    for _, tile in pairs(getTiles()) do
        if tile.fg == itemid and not tile.ready then
            count = count + 1
        end
    end
    return count
end

local function scanFossil()
    local count = 0
    for _, tile in pairs(getTiles()) do
        if tile.fg == 3918 or tile.bg == 3918 then
            count = count + 1
        end
    end
    return count
end

function webhookel(status)
    local wh = {}
    wh.url = webhook
    wh.username = "Rezzle | CHECK FARM"
    wh.content = status
    webhook(wh)
end

local foundNukedFarm = false --[ DON'T CHANGE!!! ]--

local total = 0
local hah = 0
local NUKED = false --[ DON'T CHANGE!!! ]--
webhookel("@everyone `SCRIPT CHECK FARM MADE By : `<@895235665980194816>")
for i = 1, #farmList do
    while getBot().world ~= farmList[i]:upper() and not NUKED do
        sendPacket(3, "action|join_request\nname|"..farmList[i].."\ninvitedWorld|0")
        sleep(6000)
        if hah == 5 then
            NUKED = true
            total = total + 1
            hah = 0
            break
        else
            hah = hah + 1
        end
    end
    if getBot().world == farmList[i]:upper() and not NUKED then
        webhookel("`"..farmList[i]:upper().." | "..scanTree(tree).." READY | "..scanUnready(tree).." UN-READY | "..scanFossil().." FOSSIL`")
        sleep(1000)
        hah = 0
    elseif getBot().world ~= farmList[i]:upper() and NUKED then
        webhookel("`"..farmList[i]:upper().." | NUKED`")
        sleep(1000)
        NUKED = false
        hah = 0
        foundNukedFarm = true
    end
end
webhookel("`TOTAL NUKED : "..total.." WORLD`")
removeBot(getBot().name)
