local simplehttp = require'simplehttp'
local json = require'json'

local utify8 = function(str)
	str = str:gsub("\\u(....)", function(n)
		n = tonumber(n, 16)

		if(n < 128) then
			return string.char(n)
		elseif(n < 2048) then
			return string.char(192 + ((n - (n % 64)) / 64), 128 + (n % 64))
		else
			return string.char(224 + ((n - (n % 4096)) / 4096), 128 + (((n % 4096) - (n % 64)) / 64), 128 + (n % 64))
		end
	end)

	return str
end

local urlEncode = function(str)
	return str:gsub(
		'([^%w ])',
		function (c)
			return string.format ("%%%02X", string.byte(c))
		end
	):gsub(' ', '+')
end

local trim = function(s)
	return s:match('^%s*(.-)%s*$')
end

local parseData = function(source, destination, data, search)
	data = utify8(data)
	data = json.decode(data)

	local found
	for i=1, #data.movies do
		local title = data.movies[i].title:lower()
		-- ha! ha! ha!
		if(title == search) then
			found = i
			break
		end
	end

	if(not found and not data.movies[1]) then
		return ivar2:Msg('privmsg', destination, source, "Not even Rotten Tomatoes would rate that movie.")
	end

	local movie = data.movies[found] or data.movies[1]
	local out = string.format(
		"\002%s\002 (%d) %s/%d min - Critics: %d%% (%s) Audience: %d%% (%s) - %s",
		movie['title'], movie['year'], movie['mpaa_rating'], movie['runtime'],
		movie['ratings']['critics_score'], movie['ratings']['critics_rating'],
		movie['ratings']['audience_score'], movie['ratings']['audience_rating'],
		movie['critics_consensus']
	)

	ivar2:Msg('privmsg', destination, source, out)
end

local urlFormat = 'http://api.rottentomatoes.com/api/public/v1.0/movies.json?page_limit=5&apikey=%s&q=%s'
local handler = function(self, source, destination, input)
	local search = urlEncode(trim(input))

	simplehttp(
		urlFormat:format(self.config.rottenTomatoesAPIKey, search),
		function(data)
			parseData(source, destination, data, input:lower())
		end
	)
end

return {
	PRIVMSG = {
		['^!rt (.+)$'] = handler,
		['^!rotten (.+)$'] = handler,
	},
}