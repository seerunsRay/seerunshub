-- =========================================================================
-- ⚡ SeerunsNice hub - Fix Lag Cực Mạnh, Dịch Tiếng Việt & Đổi Logo S thành N
-- =========================================================================

-- 1. FIX LAG CỰC MẠNH (Tối ưu hóa FPS tối đa cho điện thoại)
task.spawn(function()
    pcall(function()
        local lighting = game:GetService("Lighting")
        lighting.GlobalShadows = false
        lighting.Brightness = 1
        lighting.FogEnd = 9e9
        
        for _, v in ipairs(lighting:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
        
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.WaterTransparency = 1
            terrain.WaterWaveSize = 0
            pcall(function() terrain.Decoration = false end)
        end
        
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        pcall(function()
            settings().Rendering.EagerBulkExecution = true
        end)
        
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CastShadow = false
                v.Material = Enum.Material.SmoothPlastic
            elseif v:IsA("Texture") or v:IsA("Decal") then
                v:Destroy()
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("Beam") then
                v:Destroy()
            end
        end
        print("⚡ SeerunsNice: Đã kích hoạt Fix Lag cực mạnh thành công!")
    end)
end)

-- 2. Tải và chạy script gốc (Menu giữ nguyên bản gốc)
local loadSuccess, result = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/SlimexDev/LoaderScript/refs/heads/main/LoaderScript.lua")
end)

if loadSuccess and result then
    pcall(function()
        loadstring(result)()
    end)
end

-- 3. Bộ từ điển dịch toàn diện sang Tiếng Việt
local translations = {
    ["Search"] = "Tìm Kiếm",
    ["Home"] = "Trang Chủ",
    ["Main"] = "Chính",
    ["Shop"] = "Cửa Hàng",
    ["Animals"] = "Động Vật",
    ["Player"] = "Người Chơi",
    ["Teleport"] = "Dịch Chuyển",
    ["Misc"] = "Khác",
    ["Settings"] = "Cài Đặt",
    
    ["Throw and train"] = "Ném và Huấn Luyện",
    ["Throw"] = "Ném",
    ["Auto throw"] = "Tự Động Ném",
    ["Throw food again and again"] = "Ném thức ăn liên tục",
    ["Perfect meter"] = "Thanh Hoàn Hảo",
    ["Always land a PERFECT throw"] = "Luôn đạt cú ném HOÀN HẢO",
    ["Skip animations"] = "Bỏ Qua Hoạt Họa",
    ["Shorten the flight and animal reveal scenes"] = "Rút ngắn thời gian bay và cảnh hiển thị động vật",
    ["Train"] = "Huấn Luyện",
    ["Auto train"] = "Tự Động Huấn Luyện",
    ["Train on the pull-up bar and tap x2 bonuses"] = "Tập trên xà đơn và nhận thưởng x2",
    ["Train time before throw"] = "Thời gian huấn luyện trước khi ném",
    ["Used when auto throw and auto..."] = "Sử dụng khi tự động ném và tự động...",
    ["Auto x2"] = "Tự Động x2",
    ["Tap the x2 bonuses while training (also when you train yourself)"] = "Chạm nhận thưởng x2 khi huấn luyện (cả khi tự tập)",

    ["Auto buy upgrades"] = "Tự động mua nâng cấp",
    ["Auto Buy"] = "Tự Động Mua",
    ["Auto buy best food"] = "Tự Động Mua Thức Ăn Tốt Nhất",
    ["Buy the next food when you can afford it and equip the best"] = "Mua thức ăn tiếp theo khi đủ tiền và trang bị loại tốt nhất",
    ["Auto buy bar"] = "Tự Động Mua Xà Đơn",
    ["Upgrade the pull-up bar when you can afford it"] = "Nâng cấp xà đơn khi đủ tiền",
    ["Auto buy fence"] = "Tự Động Mua Hàng Rào",
    ["Upgrade the plot fence for more animal slots"] = "Nâng cấp hàng rào khu đất để có thêm ô chứa động vật",
    ["Check delay"] = "Độ Trễ Kiểm Tra",

    ["Claim, equip and sell"] = "Nhận, trang bị và bán",
    ["Auto claim"] = "Tự Động Nhận",
    ["Claim offline earnings and the free animal"] = "Nhận thu nhập ngoại tuyến và động vật miễn phí",
    ["Auto equip best"] = "Tự Động Trang Bị Tốt Nhất",
    ["Put your best animals on the plot"] = "Đặt những con động vật tốt nhất của bạn lên ô đất",
    ["Auto sell"] = "Tự Động Bán",
    ["Sell backpack animals (never placed or bought ones)"] = "Bán động vật trong ba lô (không bán con đã đặt hoặc đã mua)",
    ["Sell Config"] = "Cấu Hình Bán",
    ["Sell mode"] = "Chế Độ Bán",
    ["Filtered uses the settings below"] = "Lọc sử dụng các cài đặt bên dưới",
    ["Filtered"] = "Lọc",
    ["Sell up to rarity"] = "Bán Theo Độ Hiếm",
    ["Rarer animals are kept"] = "Động vật hiếm hơn sẽ được giữ lại",
    ["Rare"] = "Hiếm",
    ["Keep mutations"] = "Giữ Lại Đột Biến",
    ["Animals with these mutations are never sold"] = "Động vật có những đột biến này sẽ không bao giờ bị bán",
    ["Gold, Diamond,..."] = "Vàng, Kim Cương,...",
    ["Keep big animals"] = "Giữ Lại Động Vật Lớn",
    ["Never sell animals bigger than normal size"] = "Không bao giờ bán động vật lớn hơn kích thước bình thường",
    ["Once"] = "Thao Tác Nhanh",
    ["Equip best now"] = "Trang Bị Tốt Nhất Ngay",
    ["Run"] = "Chạy",
    ["Sell now"] = "Bán Ngay",
    ["Uses the sell config"] = "Sử dụng theo cấu hình bán",
    ["Sell"] = "Bán",

    ["Movement"] = "Di Chuyển",
    ["Walk speed"] = "Tốc Độ Đi",
    ["Jump power"] = "Sức Nhảy",
    ["Infinite jump"] = "Nhảy Vô Hạn",
    ["Noclip"] = "Đi Xuyên Tường (Noclip)",

    ["Places and servers"] = "Địa Điểm Và Máy Chủ",
    ["Places"] = "Địa Điểm",
    ["Place"] = "Khu Vực",
    ["My plot"] = "Khu đất của tôi",
    ["Teleport to place"] = "Dịch chuyển đến địa điểm",
    ["Go"] = "Đi",
    ["Server"] = "Máy Chủ",
    ["Rejoin"] = "Vào Lại",
    ["Join this server again"] = "Vào lại máy chủ này",

    ["Other tools"] = "Các công cụ khác",
    ["Utility"] = "Tiện Ích",
    ["Anti AFK"] = "Chống AFK",
    ["Stop the 20 minute idle kick"] = "Chặn việc bị đá khỏi game sau 20 phút không hoạt động",

    ["Theme, controls and configs"] = "Giao diện, điều khiển và cấu hình",
    ["Appearance"] = "Giao Diện",
    ["Theme"] = "Chủ Đề",
    ["Glass"] = "Kính",
    ["Accent color"] = "Màu Điểm Nhấn",
    ["Window opacity"] = "Độ Trong Suốt Cửa Sổ",
    ["100% is solid, lower lets the game..."] = "100% là đặc, thấp hơn sẽ nhìn xuyên game...",
    ["Background blur"] = "Làm Mờ Nền",
    ["Blur the game world behind the window"] = "Làm mờ thế giới game phía sau cửa sổ",
    ["UI scale"] = "Tỷ Lệ Giao Diện",
    ["Controls"] = "Điều Khiển",
    ["Toggle UI"] = "Bật/Tắt Giao Diện",
    ["Floating button"] = "Nút Nổi",
    ["Round button to open the UI on any device"] = "Nút tròn để mở giao diện trên mọi thiết bị",
    ["Config"] = "Cấu Hình",
    ["Config name"] = "Tên Cấu Hình",
    ["Save config"] = "Lưu Cấu Hình",
    ["Save"] = "Lưu",
    ["Load config"] = "Tải Cấu Hình",
    ["Load"] = "Tải",
    ["About"] = "Giới Thiệu",
    ["UI library for Roblox scripts by SeerunsNicexDev"] = "Thư viện giao diện cho script Roblox bởi SeerunsNicexDev",
    ["Unload UI"] = "Tắt Giao Diện",
    ["Close the window and remove everything"] = "Đóng cửa sổ và gỡ bỏ mọi thứ",
    ["Unload"] = "Tắt"
}

-- 4. Vòng lặp tự động đổi tên, chuyển chữ S thành N và dịch full tiếng Việt
task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            local coreGui = game:GetService("CoreGui")
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
            local containers = { coreGui, localPlayer:FindFirstChild("PlayerGui") }

            for _, container in ipairs(containers) do
                if container then
                    for _, obj in ipairs(container:GetDescendants()) do
                        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                            local text = obj.Text
                            if text and text ~= "" then
                                -- Đổi logo chữ S thành N (Ví dụ logo đơn lẻ là "S")
                                if text == "S" or text == "s" then
                                    obj.Text = "N"
                                -- Đổi tên thương hiệu Hub
                                elseif text:find("Slime Hub") or text:find("Slime") then
                                    obj.Text = text:gsub("Slime Hub", "SeerunsNice hub"):gsub("Slime", "SeerunsNice")
                                end

                                -- Dịch tự động sang Tiếng Việt chuẩn xác
                                for eng, vie in pairs(translations) do
                                    if text == eng or text:lower() == eng:lower() then
                                        obj.Text = vie
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
