require'chasen'

local pre = {
	['キャ'] = 'kya', ['キュ'] = 'kyu', ['キョ'] = 'kyo',
	['シャ'] = 'sha', ['シュ'] = 'shu', ['ショ'] = 'sho',
	['チャ'] = 'cha', ['チュ'] = 'chu', ['チョ'] = 'cho',
	['ニャ'] = 'nya', ['ニュ'] = 'nyu', ['ニョ'] = 'nyo',
	['ヒャ'] = 'hya', ['ヒュ'] = 'hyu', ['ヒョ'] = 'hyo',
	['ミャ'] = 'mya', ['ミュ'] = 'myu', ['ミョ'] = 'myo',
	['リャ'] = 'rya', ['リュ'] = 'ryu', ['リョ'] = 'ryo',
	['ヰャ'] = 'wya', ['ヰュ'] = 'wyu', ['ヰョ'] = 'wyo',

	['ギャ'] = 'gya', ['ギュ'] = 'gyu', ['ギョ'] = 'gyo',
	['ジャ'] = 'ja', ['ジュ'] = 'ju', ['ジョ'] = 'jo',
	['ヂャ'] = 'ja', ['ヂュ'] = 'ju', ['ヂョ'] = 'jo',
	['ビャ'] = 'bya', ['ビュ'] = 'byu', ['ビョ'] = 'byo',
	['ピャ'] = 'pya', ['ピュ'] = 'pyu', ['ピョ'] = 'pyo',

	['イェ'] = 'ye',
	['ヴァ'] = 'va', ['ヴィ'] = 'vi', ['ヴ'] = 'vu', ['ヴェ'] = 've', ['ヴォ'] = 'vo', ['ヴャ'] = 'vya', ['ヴュ'] = 'vyu', ['ヴョ'] = 'vyo',

	['シェ'] = 'she',
	['ジェ'] = 'je',
	['チェ'] = 'che',

	['スィ'] = 'si', ['スャ'] = 'sya', ['スュ'] = 'syu', ['スョ'] = 'syo',
	['ズィ'] = 'zi', ['ズャ'] = 'zya', ['ズュ'] = 'zyu', ['ズョ'] = 'zyo',
	['ティ'] = 'ti', ['トゥ'] = 'tu', ['テャ'] = 'tya', ['テュ'] = 'tyu', ['テョ'] = 'tyo',
	['ディ'] = 'di', ['ドゥ'] = 'du', ['デャ'] = 'dya', ['デュ'] = 'dyu', ['デョ'] = 'dyo',
	['ツァ'] = 'tsa', ['ツィ'] = 'tsi', ['ツェ'] = 'tse', ['ツォ'] = 'tso',
	['ファ'] = 'fa', ['フィ'] = 'fi', ['ホゥ'] = 'hu', ['フェ'] = 'fe', ['フォ'] = 'fo', ['フャ'] = 'fya', ['フュ'] = 'fyu', ['フョ'] = 'fyo',
	['リェ'] = 'rye',
	['ウァ'] = 'wa', ['ウィ'] = 'wi', ['ウェ'] = 'we', ['ウォ'] = 'wo', ['ウャ'] = 'wya', ['ウュ'] = 'wyu', ['ウョ'] = 'wyo',
	['クァ'] = 'kwa', ['クィ'] = 'kwi', ['クゥ'] = 'kwu', ['クェ'] = 'kwe', ['クォ'] = 'kwo',
	['グァ'] = 'gwa', ['グィ'] = 'gwi', ['グゥ'] = 'gwu', ['グェ'] = 'gwe', ['グォ'] = 'gwo',
	['クヮ'] = 'kwa', ['グヮ'] = 'gwa',
}

local katakana = {
	['ア'] = 'a', ['イ'] = 'i', ['ウ'] = 'u', ['エ'] = 'e', ['オ'] = 'o',
	['カ'] = 'ka', ['キ'] = 'ki', ['ク'] = 'ku', ['ケ'] = 'ke', ['コ'] = 'ko',
	['サ'] = 'sa', ['シ'] = 'shi', ['ス'] = 'su', ['セ'] = 'se', ['ソ'] = 'so',
	['タ'] = 'ta', ['チ'] = 'chi', ['ツ'] = 'tsu', ['テ'] = 'te', ['ト'] = 'to',
	['ナ'] = 'na', ['ニ'] = 'ni', ['ヌ'] = 'nu', ['ネ'] = 'ne', ['ノ'] = 'no',
	['ハ'] = 'ha', ['ヒ'] = 'hi', ['フ'] = 'fu', ['ヘ'] = 'he', ['ホ'] = 'ho',
	['マ'] = 'ma', ['ミ'] = 'mi', ['ム'] = 'mu', ['メ'] = 'me', ['モ'] = 'mo',
	['ヤ'] = 'ya', ['ユ'] = 'yu', ['ヨ'] = 'yo',
	['ラ'] = 'ra', ['リ'] = 'ri', ['ル'] = 'ru', ['レ'] = 're', ['ロ'] = 'ro',
	['ワ'] = 'wa', ['ヰ'] = 'wi', ['⼲'] = 'wu', ['ヱ'] = 'we', ['ヲ'] = 'wo',

	['ン'] = '\002n\002',

	['ガ'] = 'ga', ['ギ'] = 'gi', ['グ'] = 'gu', ['ゲ'] = 'ge', ['ゴ'] = 'go',
	['ザ'] = 'za', ['ジ'] = 'ji', ['ズ'] = 'zu', ['ゼ'] = 'ze', ['ゾ'] = 'zo',
	['ダ'] = 'da', ['ヂ'] = 'ji', ['ヅ'] = 'dzu', ['デ'] = 'de', ['ド'] = 'do',
	['バ'] = 'ba', ['ビ'] = 'bi', ['ブ'] = 'bu', ['ベ'] = 'be', ['ボ'] = 'bo',
	['パ'] = 'pa', ['ピ'] = 'pi', ['プ'] = 'pu', ['ペ'] = 'pe', ['ポ'] = 'po',

	['ヷ'] = 'va', ['ヸ'] = 'vi', ['ヹ'] = 've', ['ヺ'] = 'vo',

	[' 。'] = '.',
	['、'] = ',',

	-- hmm...
	['ァ'] = 'a', ['ィ'] = 'i', ['ゥ'] = 'u', ['ェ'] = 'e', ['ォ'] = 'o',
	['ャ'] = 'ya', ['ュ'] = 'yu', ['ョ'] = 'yo',
}

local post = {
	['(.)ー'] = '%1%1',
	['ッ(.)'] = '%1%1',
}

return {
	["^:(%S+) PRIVMSG (%S+) :!kr (.+)$"] = function(self, src, dest, msg)
		msg = chasen.sparse(msg:gsub('%s', '\n'))
		msg = utils.split(msg, '\n')

		-- chop of the last bit.
		table.remove(msg)

		for i=1,#msg do
			msg[i] = utils.split(msg[i], '\t')
		end

		local output = ''

		for k, data in next, msg do
			if(data[4] == '未知語') then
				output = output .. data[1]
			elseif(data[4] == '記号-アルファベット') then
				output = output..data[1]
			elseif(data[1] == 'EOS') then
				output = output .. ' '
			else
				output = output..' '..data[2]
			end
		end

		for find, replace in next, pre do
			output = output:gsub(find, replace)
		end

		for find, replace in next, katakana do
			output = output:gsub(find, replace)
		end

		for find, replace in next, post do
			output = output:gsub(find, replace)
		end

		self:msg(dest, src, 'In romaji: %s', output)
	end
}
