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
 
 
PrecacheDir("materials/gui/")
PrecacheDir("materials/models/gas_station/")
PrecacheDir("materials/models/bobcat/")
PrecacheDir("materials/models/borderlands/")
PrecacheDir("materials/models/chaos126p/")
PrecacheDir("materials/models/gtaiv/")
PrecacheDir("materials/models/hedgehog/")
PrecacheDir("materials/models/huntley/")
PrecacheDir("materials/models/nirrti/")
PrecacheDir("materials/models/ratmobile/")
PrecacheDir("materials/models/sabregt/")
PrecacheDir("materials/models/seat_m/")
PrecacheDir("materials/models/taxi/")
PrecacheDir("materials/models/tiggomods/")
PrecacheDir("materials/models/vigilante8/")
PrecacheDir("materials/splayn/")
PrecacheDir("materials/engine/")
PrecacheDir("materials/models/ilcar/")
PrecacheDir("materials/models/tiggogm/")
PrecacheDir("materials/models/tiggomods/")
PrecacheDir("materials/scarhud/")
PrecacheDir("materials/scarhud/")
PrecacheDir("materials/scarmisc/")
PrecacheDir("materials/scartank/")
PrecacheDir("models/gas_station/")
PrecacheDir("models/borderlands/")
PrecacheDir("models/dean/")
PrecacheDir("models/diprip/")
PrecacheDir("models/seat_m/")
PrecacheDir("models/splayn/")
PrecacheDir("models/tiggomods/")
PrecacheDir("models/vigilante8/")
PrecacheDir("models/ilcar/")
PrecacheDir("models/tiggogm/")
PrecacheDir("models/tiggomods/")
PrecacheDir("sound/advanced_engine_sounds/")
PrecacheDir("sound/car/")
PrecacheDir("sound/carstools/")
PrecacheDir("sound/delorean/")
PrecacheDir("sound/geareffectsounds/")
PrecacheDir("sound/racemusic/")
PrecacheDir("sound/scarenginesounds/")
PrecacheDir("sound/scarhorns/")
PrecacheDir("sound/scartank/")
PrecacheDir("sound/tire/")
PrecacheDir("sound/vehicles/")
