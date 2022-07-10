--// Dev options
getgenv().dev = true

local function devprint(Text)
    if dev then
        warn("!devprint")
        print("   > "..Text.."\n")
    end
end

--// Clutter
loadstring(game:HttpGet("https://cutt.ly/XFKjXRR"))()(getfenv())

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
        for i, v in pairs(game:GetService("CoreGui").Luno.Main:GetDescendants()) do
            v:TweenPosition(UDim2.new(0, v.AbsolutePosition.X, 0, v.AbsolutePosition.),"In","Quint",.3)
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
        Position = UDim2.new(0, -225, 0, -100)
    }
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

devprint("\n\n\n\n\n\n\n\n\n\n\n")
