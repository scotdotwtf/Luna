--// Dev options
getgenv().dev = true

local function devprint(Text)
    if dev then
        warn("!devprint")
        print("   > "..Text.."\n")
    end
end

--// Clutter
loadstring(game:HttpGet("https://raw.githubusercontent.com/specowos/Luna/main/Clutter%20Updated.lua"))()(getfenv())

local function Notify(NotificationText, Customization, Options, Functions)
    --// Function to check if a notif was already made
    local function CheckExistance()
        if game:GetService("CoreGui"):FindFirstChild("Luno") then
            devprint("ui did exist")
            return true
        else
            devprint("ui didnt exist")
            return false
        end
    end

    --// Makes notif/notif core depending on if it exist or not
    if not CheckExistance() then
        --// The UI doesnt exist
        ScreenGui {
            Parent = game:GetService("CoreGui"),
            Name = "Luno",
            Frame {
                Name = "Main",
                Size = UDim2.new(0, 50, 0, 50),
                Position = UDim2.new(1, -25, 1, -25),
                BackgroundTransparency = 1
            }
        }
        devprint("ui made, it used to not exist")
    else
        for i, v in pairs(game:GetService("CoreGui").Luno.Main:GetChildren()) do
            if v:IsA("Frame") then
                v:TweenPosition(UDim2.new(v.Position.X.Scale, v.Position.X.Offset, v.Position.Y.Scale, v.Position.Y.Offset - 120),"Out","Quint",.2)
            end 
        end
        devprint("tweened position")
    end

    --// Set Colors
    if Customization["Theme"] == "Light" then
        getgenv().bgmain1 = Color3.fromHex("#e6e8ea")
        getgenv().bgmain2 = Color3.fromHex("#dbdddf")
        getgenv().btnclose1 = Color3.fromHex("#ef575a")
        getgenv().btnclose2 = Color3.fromHex("#d96c6e")
        getgenv().strokemain1 = Color3.fromHex("#fcfeff")
        getgenv().textmain1 = Color3.fromHex("#1b282f")
        devprint("Theme set to light")
    elseif Customization["Theme"] == "Dark" then
        getgenv().bgmain1 = Color3.fromHex("#1b282f")
        getgenv().bgmain2 = Color3.fromHex("#21323b")
        getgenv().btnclose1 = Color3.fromHex("#fff46c")
        getgenv().btnclose2 = Color3.fromHex("#e6de73")
        getgenv().strokemain1 = Color3.fromHex("#406680")
        getgenv().textmain1 = Color3.fromHex("#e6e8ea")
        devprint("Theme set to dark")
    end

    --// The notification itself
    Notification = Frame {
        Parent = game:GetService("CoreGui").Luno:WaitForChild("Main"),
        Name = "Notification",
        Size = UDim2.new(0, 225, 0, 100),
        Position = UDim2.new(0, 100, 0, -100),
        BackgroundColor3 = bgmain1,
        
        UICorner {
            CornerRadius = UDim.new(0, 7)
        },
        
        UIStroke {
            Color = strokemain1
        }
    }

    spawn(function()
        Notification:TweenPosition(UDim2.new(0, -225, 0, -100),"Out","Quint",.2)
        wait(Options["Duration"])
        Notification:TweenPosition(UDim2.new(Notification.Position.X.Scale, Notification.Position.X.Offset + 300, Notification.Position.Y.Scale, Notification.Position.Y.Offset),"Out","Quint",.2)
        wait(0.2)
        Notification:Destroy()
    end)
    devprint("notification made!")
end

Notify({
    ["Text"] = "Hello world!",
    ["Description"] = "Im a description.",
    ["Invite"] = "None"
}, {
    ["Image"] = "Default",
    ["Theme"] = "Light",
    ["Style"] = 1
}, {
    ["Type"] = 1,
    ["Duration"] = 5
}, {
    ["Yes"] = function()

    end
})

devprint("clear! \n\n\n\n\n\n\n\n\n\n\n")
