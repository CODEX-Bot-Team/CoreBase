local Database = Object:extend()

local Table = Import("ga.CoreByte.CoreBase.Table")

local Sql = require("sqlite3")


function Database:initialize(Path)
    self.Path = Path
    self.SqlConnection = Sql.open(Path)

    self.Tables = {}
end

function Database:Close()
    self.SqlConnection:close()
end

function Database:GetTable(TableName)
    if self.Tables[TableName] == nil then
        self.Tables[TableName] = Table:new(TableName, self)
    end
    return self.Tables[TableName]
end

function Database:ListTables()
    return self.SqlConnection:exec("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name")[1]
end

return Database