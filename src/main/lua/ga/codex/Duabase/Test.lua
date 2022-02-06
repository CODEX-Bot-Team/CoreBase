local Package = {}

function Package.OnInitialize()

    print("And The package has loaded!")
    print("Hello!")
    
    local Database = Import("ga.codex.Duabase.Main").Open("./Test")
    Database:CreateTable("Test")
    local Table = Database:GetTable("Test")
    p(Table:Set("abc", "def"))
    p(Table:Get("abc"))
    p(Table:GetKeys())
end

return Package
