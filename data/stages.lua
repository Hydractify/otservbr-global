-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 25,
		multiplier = 2
	}, {
		minlevel = 26,
		maxlevel = 50,
		multiplier = 1.5
	}, {
		minlevel = 51,
		multiplier = 1
	}
}

skillsStages = {
	{
		minlevel = 0,
		multiplier = 1
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		multiplier = 1
	}
}
