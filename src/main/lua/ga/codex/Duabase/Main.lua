local Duabase = {}

local FS = require("fs")
local Path = require("path")

local Database = Import("ga.codex.Duabase.Database")

local Header = [[
This is a database file written by Duabase
Library created by CoreByte
For the CODEX-Bot-Team]]

function Duabase.Open(Location, Settings)
    Settings = Settings or {}
    Settings.AfterRead = Settings.AfterRead or function (self, Data)
        return true, Data
    end

    Settings.BeforeSave = Settings.BeforeSave or function (self, Data)
        return true, Data
    end

    Settings.Location = Location .. ".db"
    Settings.Header = Header


    return Database:new(Settings)
end

function Duabase.IsDatabase(Location, Create, Settings)
    if Create == nil then Create = true end

    if not FS.existsSync(Location) then
        if Create then
            FS.writeFileSync()
        end
    end
    return true
end

return Duabase