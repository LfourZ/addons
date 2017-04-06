E2Lib.RegisterExtension("teamcore", false, "Allows creating and editing teams.")

__e2setcost(1)

--Normal functions

e2function void teamAddScore(number index, number increment)
	team.AddScore(index, increment)
end

e2function number bestAutoJoinTeam()
	return team.BestAutoJoinTeam()
end

e2function table teamGetClass(number index)
	return team.GetClass(index)
end

e2function vector4 teamColorRgba(number index)
	local col = team.GetColor(index)
	return {col.r, col.g, col.b, col.a}
end

e2function table teamGetSpawnPoint(number index)
	return team.GetSpawnPoint(index)
end

e2function table teamGetSpawnPoints(number index)
	return team.GetSpawnPoints(index)
end

e2function number teamIsJoinable(number index)
	if team.Joinable(index) then return 1 else return 0 end
end

--teamSetClass --I wanna do this, but more research is needed

e2function void teamSetColor(number index, vector color)
	team.SetColor(index, Color(color[1],color[2],color[3],255))
end

e2function void teamSetColorRgba(number index, vector4 color)
	team.SetColor(index, Color(color[1],color[2],color[3],color[4]))
end

e2function void teamSetScore(number index, number score)
	team.SetScore(index, score)
end

--teamSetSpawnPoint --Have to look into it more

e2function void teamSetUp(number index, string name, vector color, number joinable)
	team.SetUp(index, name, Color(color[1],color[2],color[3],255), joinable == 1)
end

e2function number teamIsValid(number index)
	if team.Valid(number) then return 1 else return 0 end
end
