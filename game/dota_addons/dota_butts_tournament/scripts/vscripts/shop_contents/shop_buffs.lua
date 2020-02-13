modifier_looting = class({})
function modifier_looting:GetTexture() return "alchemist_goblins_greed" end
function modifier_looting:IsPurgable() return false end

--================================================================================

modifier_emergency_training = class({})
function modifier_emergency_training:GetTexture() return "item_tome_of_knowledge" end
function modifier_emergency_training:IsPurgable() return false end

--================================================================================

modifier_shop_charge = class({})
function modifier_shop_charge:GetTexture() return "item_phase_boots" end
function modifier_shop_charge:IsPurgable() return false end

function modifier_shop_charge:DeclareFunctions()
	return { MODIFIER_PROPERTY_IGNORE_MOVESPEED_LIMIT, MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT }
end

function modifier_shop_charge:GetModifierIgnoreMovespeedLimit()	return 1 end

function modifier_shop_charge:GetModifierMoveSpeedBonus_Constant()
	return self:GetParent():GetModifierStackCount("shop_charge_speed", self:GetParent())
end

if IsServer() then
	function modifier_shop_charge:CheckState()
		return { [MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = SETTINGS.BUFFS.CHARGE_FREE_PATHING }
	end

	function modifier_shop_charge:OnCreated()
		local parent = self:GetParent()
		local mod = parent:AddNewModifier( parent, nil, "shop_charge_speed", { duration = self:GetRemainingTime() } )
		mod:SetStackCount( SETTINGS.BUFFS.CHARGE_MOVESPEED )
	end
end

LinkLuaModifier("shop_charge_speed", "shop_contents/shop_buffs.lua", LUA_MODIFIER_MOTION_NONE)
shop_charge_speed = class({})
function shop_charge_speed:IsHidden() return true end
function shop_charge_speed:IsPurgable() return false end

--================================================================================

modifier_iron_wall = class({})
function modifier_iron_wall:GetTexture() return "item_shivas_guard" end
function modifier_iron_wall:IsPurgable() return false end

function modifier_iron_wall:DeclareFunctions()
	return { MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS, MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS }
end

function modifier_iron_wall:GetModifierPhysicalArmorBonus()
	return self:GetParent():GetModifierStackCount("iron_wall_armour", self:GetParent())
end

function modifier_iron_wall:GetModifierMagicalResistanceBonus()
	return self:GetParent():GetModifierStackCount("iron_wall_mr", self:GetParent())
end

if IsServer() then
	function modifier_iron_wall:OnCreated()
		local parent = self:GetParent()
		local armour = parent:AddNewModifier( parent, nil, "iron_wall_armour", { duration = self:GetRemainingTime() } )
		local mr = parent:AddNewModifier( parent, nil, "iron_wall_mr", { duration = self:GetRemainingTime() } )
		armour:SetStackCount( SETTINGS.BUFFS.IRON_WALL_ARMOUR )
		mr:SetStackCount( SETTINGS.BUFFS.IRON_WALL_MR )
	end
end

LinkLuaModifier("iron_wall_armour", "shop_contents/shop_buffs.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("iron_wall_mr", "shop_contents/shop_buffs.lua", LUA_MODIFIER_MOTION_NONE)
iron_wall_armour = class({})
function iron_wall_armour:IsHidden() return true end
function iron_wall_armour:IsPurgable() return false end
iron_wall_mr = class({})
function iron_wall_mr:IsHidden() return true end
function iron_wall_mr:IsPurgable() return false end

--================================================================================

