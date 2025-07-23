-- Criação do botão na tela
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "HGsHub"

local button = Instance.new("TextButton", screenGui)
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0, 20, 0, 100)
button.Text = "Ativar ESP Vermelho"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 16

-- Função para ativar ESP
local function ativarESP()
	for _, p in pairs(game.Players:GetPlayers()) do
		if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			if not p.Character:FindFirstChild("HG_ESP") then
				local highlight = Instance.new("Highlight")
				highlight.Name = "HG_ESP"
				highlight.Adornee = p.Character
				highlight.FillColor = Color3.fromRGB(255, 0, 0)
				highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
				highlight.FillTransparency = 0.5
				highlight.OutlineTransparency = 0
				highlight.Parent = p.Character
			end
		end
	end
end

-- Clicar no botão ativa ESP
button.MouseButton1Click:Connect(function()
	ativarESP()
end)

-- Atualiza o ESP quando novos players entram
game.Players.PlayerAdded:Connect(function(newPlayer)
	newPlayer.CharacterAdded:Connect(function()
		wait(2)
		ativarESP()
	end)
end)
