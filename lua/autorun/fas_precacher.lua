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
PrecacheDir("materials/")
PrecacheDir("models/")
PrecacheDir("sound/")

end
end
PrecacheAll()
concommand.Add( "reprecache_fas", PrecacheAll )