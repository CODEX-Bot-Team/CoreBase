local Database = Class:extend()

local FS = require("fs")
local Json = require("json")

local Table = Import("ga.codex.Duabase.Table")

function Database:initialize(Settings)
    self.Settings = Settings

    if FS.existsSync(Settings.Location) then
        local FileData = FS.readFileSync(Settings.Location)
        local SplitData = Split(FileData, "\n")
        local RawData = SplitData[#SplitData]

        self.Data = Json.decode(({Settings.AfterRead(self, RawData)})[2])
        self:Save()
    else
        self.Data = {}
        self.Data.Tables = {}
        self.Data.Version = 1

        self:Save()
    end

    self.ClassedTables = {}

end

function Database:Save()
    FS.writeFileSync(
        self.Settings.Location,
        self.Settings.Header .. "\n\nHere comes the data:\n" .. ({self.Settings.BeforeSave(self, Json.encode(self.Data))})[2]
    )
end

function Database:GetTable(Name)
    self:CreateTable(Name)
    if self.ClassedTables[Name] then
        return self.ClassedTables[Name]
    end

    local ClassedTable = Table:new(self, Name)
    self.ClassedTables[Name] = ClassedTable
    return ClassedTable
end

function Database:CreateTable(Name)
    if self.Data.Tables[Name] then
        return false
    end
    self.Data.Tables[Name] = {}
    return true
end

return Database