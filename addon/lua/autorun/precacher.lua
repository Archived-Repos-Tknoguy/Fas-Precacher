--NOTE: This code was MODIFIED from the first version of the SCAR precacher! I take NO credit for the PrecacheDir function!
print("Notice for the FA:S Precacher Addon\nI take NO CREDIT for the precacher script in this addon, all credit goes to the original author!");

function PrecacheDir( dir ) // Recursively adds everything in a directory to be cached
    local files, directories = file.Find( dir.."*", "GAME" )
    for _, fdir in pairs(directories) do
        if fdir != ".svn" then // Don't spam people with useless .svn folders'
            PrecacheDir(dir..fdir.."/")
        end
    end

    for k,v in pairs(files) do
        local fname = string.lower(dir..v)
                print(fname)
        local ismodel = -1
        local ismaterial = -1
        local isparticle = -1
        local issound = -1
        ismodel = (string.find(fname,".mdl"))
        ismaterial = (string.find(fname,".vtf") or string.find(fname,".vmt"))
        isparticle = (string.find(fname,".pcf"))
        issound = (string.find(fname,".wav") or string.find(fname,".mp3")  )
        if ismaterial then
            if ismaterial >= 0 then
                local tmpmat = Material(fname,"mips")
            end
        elseif isparticle then
            if isparticle >= 0 then

                PrecacheParticleSystem(fname)
            end
        elseif issound then
            if issound >= 0 then
                util.PrecacheSound(fname)
            end
        else

            if ismodel then
                if ismodel >= 0 then
                    util.PrecacheModel(fname)
                end
            end
        end
    end
end

if SERVER then
AddCSLuaFile()
end

-- below is the part where it does stuff. it checks for client status and if so precaches all directories using the script above!
function PrecacheAll()
if SERVER then
-- Below displays a message to the server console and sends the LUA file to clients (in case they don't have it)
print("The FA:S precacher has no use on a server console! However, clients will still precache files.\n");
elseif CLIENT then
-- below precaches all required directories.. I'm still testing code to see if all of these are needed.
PrecacheDir("materials/models/weapons/shells/")
PrecacheDir("materials/models/weapons/v_models/")
PrecacheDir("materials/models/weapons/v_models/accesories/")
PrecacheDir("materials/models/weapons/view/accessories/acog/")
PrecacheDir("materials/models/weapons/view/hands/")
PrecacheDir("materials/models/weapons/view/pistols/glock20/")
PrecacheDir("materials/models/weapons/view/pistols/ots33/")
PrecacheDir("materials/models/weapons/view/pistols/ragingbull/")
PrecacheDir("materials/models/weapons/view/rifles/akm/")
PrecacheDir("materials/models/weapons/view/rifles/g3a3/")
PrecacheDir("materials/models/weapons/view/rifles/m14/")
PrecacheDir("materials/models/weapons/view/rifles/rk95/")
PrecacheDir("materials/models/weapons/view/rifles/sg55x/")
PrecacheDir("materials/models/weapons/view/rifles/sks/")
PrecacheDir("materials/models/weapons/view/shotguns/m3s90/")
PrecacheDir("materials/models/weapons/view/smgs/mac11/")
PrecacheDir("materials/models/weapons/view/smgs/mp5/")
PrecacheDir("materials/models/weapons/view/support/m24/")
PrecacheDir("materials/models/weapons/w_models/")
PrecacheDir("materials/models/weapons/w_models/bizon/")
PrecacheDir("materials/models/weapons/world/accessories/")
PrecacheDir("materials/models/weapons/world/rifles/rk95/")
PrecacheDir("materials/models/weapons/world/rifles/sks/")
PrecacheDir("materials/sprites/fas2/")
PrecacheDir("materials/vgui/entities/")
PrecacheDir("materials/vgui/fas2/")
PrecacheDir("materials/vgui/fas2atts/")
PrecacheDir("models/shells/")
PrecacheDir("models/weapons/")
PrecacheDir("models/weapons/view/pistols/")
PrecacheDir("models/weapons/view/rifles/")
PrecacheDir("models/weapons/view/shotguns/")
PrecacheDir("models/weapons/view/smgs/")
PrecacheDir("models/weapons/view/support/")
PrecacheDir("models/weapons/world/rifles/")
PrecacheDir("sound/cstm/")
PrecacheDir("sound/weapons/")
PrecacheDir("sound/weapons/ak47/")
PrecacheDir("sound/weapons/ak74/")
PrecacheDir("sound/weapons/bizon/")
PrecacheDir("sound/weapons/g3a3/")
PrecacheDir("sound/weapons/glock20/")
PrecacheDir("sound/weapons/handling/")
PrecacheDir("sound/weapons/m3s90p/")
PrecacheDir("sound/weapons/m4a1/")
PrecacheDir("sound/weapons/m24/")
PrecacheDir("sound/weapons/m14/")
PrecacheDir("sound/weapons/mp5/")
PrecacheDir("sound/weapons/p226/")
PrecacheDir("sound/weapons/ragingbull/")
PrecacheDir("sound/weapons/rpk47/")
PrecacheDir("sound/weapons/sako95/")
PrecacheDir("sound/weapons/sg55x/")
PrecacheDir("sound/weapons/sks/")
PrecacheDir("sound/weapons/sterling/")
end
end
PrecacheAll()
concommand.Add( "reprecache_fas", PrecacheAll )