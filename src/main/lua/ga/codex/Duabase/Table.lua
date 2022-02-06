local TableBase = Class:extend()

function TableBase:initialize(Database, Name)
    self.Name = Name
    self.Database = Database
end

function TableBase:GetKey(Key)
    return self.Database.Data.Tables[self.Name][Key]
end

function TableBase:SetKey(Key, Value)
    self.Database.Data.Tables[self.Name][Key] = Value
    self.Database:Save()
    return true
end

function TableBase:GetKeys()
    local Keys = {}
    for Key, Value in pairs(self.Database.Data.Tables[self.Name]) do
        table.insert(Keys, Key)
    end
    return Keys
end

function TableBase:Get(Key)
    return self:GetKey(Key)
end

function TableBase:Set(Key, Value)
    return self:SetKey(Key, Value)
end

function TableBase:List()
    return self:GetKeys()
end

return TableBase