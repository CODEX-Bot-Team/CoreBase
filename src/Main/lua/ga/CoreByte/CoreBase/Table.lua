local Table = Object:extend()

local Json = require("json")

function Table:initialize(TableName, Database)
    self.TableName = TableName
    self.Database = Database
    self.SqlConnection = Database.SqlConnection

    self.SqlConnection:exec('create table if not exists ' .. TableName .. ' ( "Key"	TEXT, "Value"	TEXT, PRIMARY KEY("Key") )')
end

function Table:GetValue(Key)
    local Response = self.SqlConnection:prepare("SELECT Value FROM '" .. self.TableName .. "' WHERE Key = ?"):reset():bind(Key):step()
    if not Response then return nil end
    return Json.decode(Response[1])
end

function Table:SetValue(Key, Value)
    self.SqlConnection:prepare("INSERT or REPLACE INTO '" .. self.TableName .. "' ('Key', 'Value') VALUES (?, ?)"):reset():bind(Json.encode(Key), Json.encode(Value)):step()
    return true
end

function Table:ListKeys(Max)
    local Keys
    if Max == nil then
        Keys = self.SqlConnection:exec("SELECT Key FROM '" .. self.TableName .. "'")[1]
    else
        Keys = self.SqlConnection:exec("SELECT Key FROM '" .. self.TableName .. "' LIMIT " .. Max)[1]
    end
    local ReturnKeys = {}
    for i, Key in pairs(Keys) do
        ReturnKeys[i] = Json.decode(Keys[i])
    end
    return ReturnKeys
end

return Table