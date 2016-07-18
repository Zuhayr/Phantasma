/technique/healing
	name = "Recover"
	target_self = 1
	delay = 15
	var/heal_min = 0.3
	var/heal_max = 0.5

/technique/healing/apply_to(var/minion/user, var/minion/target)
	if(!..())
		return

	var/mhealth = target.data[MD_MHP]
	target.data[MD_CHP] += round(rand(mhealth*heal_min, mhealth*heal_max))
	if(target.data[MD_CHP] > mhealth)
		target.data[MD_CHP] = mhealth
	return TECHNIQUE_SUCCESS

/technique/healing/do_user_front_anim(var/battle_data/player/target)
	if(!..())
		return
	animate(target.opponent_img, color = "#00FF00", time = 5)
	sleep(5)
	animate(target.opponent_img, color = "#FFFFFF", time = 5)

/technique/healing/do_user_rear_anim(var/battle_data/player/target)
	if(!..())
		return
	animate(target.minion_img, color = "#00FF00", time = 5)
	sleep(5)
	animate(target.minion_img, color = "#FFFFFF", time = 5)