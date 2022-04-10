print("Hello World!")

local Database = Import("ga.CoreByte.CoreBase"):new("./Test.db")

local TestTable = Database:GetTable("Test")
p(TestTable:GetValue("Test2"))
p(TestTable:SetValue("Test2", 1))
p(TestTable:ListKeys())

for i = 1, 10000 do
    TestTable:SetValue(i, math.random(1, 100))
    --p(i)
end
require("timer").sleep(1000)