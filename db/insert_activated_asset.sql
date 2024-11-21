INSERT INTO activated_assets
(year, location, is_supplementary, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(100, '舊安南地政事務所', false, '刑大二、四、六、八隊及保大隊第二中隊',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    30872560, 13440877, 44313437, true, '進行中', '2011-01-01'),

(100, '東門派出所', false, '供警察局外事科、公關室使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    96200000, 1396613, 97596613, true, '進行中', '2011-01-01'),

(100, '原臺南縣團管區', false, '供警察局保安大隊使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    116876022, 59530000, 176406022, true, '進行中', '2011-01-01'),

(100, '原崎內國小', false, '供社會局照顧園區使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    3527700, 6375600, 9903300, true, '進行中', '2011-01-01'),

(100, '佳里代表會2樓', false, '社會局北門區家庭服務中心',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    14849730, 3728621, 18578351, true, '進行中', '2011-01-01'),

(100, '仁德第一市場4樓', false, '供辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    76525592, 35521626, 112047218, true, '進行中', '2011-01-01'),

(100, '東區竹篙厝段1684地號土地', false, '工務局放置機具',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    17687100, null, 17687100, true, '進行中', '2011-01-01'),

(100, '臺南地政事務所4樓部分空間', false, '供工務局秘書室存放檔案使用',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    86287200, 59167083, 145454283, true, '進行中', '2011-01-01'),

(100, '台南市佳里區潭墘段617地號', false, '消防局第三大隊使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    26117647, null, 26117647, true, '進行中', '2011-01-01'),

(100, '台南市楠西區東勢段532地號', false, '撥用作楠西消防分隊遷建辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    12174840, null, 12174840, true, '進行中', '2011-01-01'),

(100, '北區北元段1059地號', false, '撥用作第6大隊和緯分隊廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    34698570, null, 34698570, true, '進行中', '2011-01-01'),

(100, '文華公有零售市場二樓', false, '供文南、文華里規劃為「社區產業文化展示館、社區圖書館」',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    189996000, 15990000, 205986000, false, '進行中', '2011-01-01'),

(100, '民治市政中心世紀大樓三樓', false, '供農業局辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    67217698, 52768685, 119986383, true, '進行中', '2011-01-01'),

(100, '元安里活動中心', false, '供交通局公共運輸處辦公室使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    41940000, 20800000, 62740000, true, '進行中', '2011-01-01'),

(100, '台南市中西區廣慈段547地號', false, '健保局洽公民眾停車使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    16121160, null, 16121160, true, '進行中', '2011-01-01');



INSERT INTO activated_assets
(year, location, is_supplementary, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(101, '中西區友愛公有零售市場2、3樓', false, '供經濟發展局工商行政科檔案管理辦公室',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    37707670, 14879800, 52587470, true, '進行中', '2012-01-01'),

(101, '第一幼稚園北門分園', false, '供工務局第一工務大隊作為辦公廳舍及放置機具使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    31388988, null, 31388988, true, '進行中', '2012-01-01'),

(101, '安平區海興公有零售市場', false, '供安平區公所忠誠社區及沙灘社區活動中心使用',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    33499800, 13639000, 47138800, true, '進行中', '2012-01-01'),

(101, '本淵寮公有零售市場2、3樓', false, '供秘書處檔案管理辦公室使用',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    9221349, 11780000, 21001349, true, '進行中', '2012-01-01'),

(101, '善化第一公有零售市場2樓', false, '供水利局曾文溪以南辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    52697093, 288450846, 341147939, true, '進行中', '2012-01-01'),

(101, '原關廟原代表會2、3樓', false, '供環保局辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    41297956, 1411200, 42709156, true, '進行中', '2012-01-01'),

(101, '北門區永華國小', false, '供交通部觀光局雲嘉南濱海風景管理處辦理「生態魔法學園」活化計畫',
    (SELECT id FROM usage_types WHERE name='觀光遊憩設施'),
    5470110, null, 5470110, true, '進行中', '2012-01-01'),

(101, '台南市關廟區民生段570地號', false, '供交通局轉運站使用',
    (SELECT id FROM usage_types WHERE name='交通設施'),
    3790100, null, 3790100, true, '進行中', '2012-01-01'),

(101, '永康原代表會3樓', false, '供安康區家庭福利服務中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    21470205, 1794100, 23264305, true, '進行中', '2012-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(102, '麻豆果菜市場', false, '供交通局作客轉中心使用',
    (SELECT id FROM usage_types WHERE name='交通設施'),
    40768300, 6396656, 47164956, true, '進行中', '2013-01-01'),

(102, '佳里區原法務部調查局臺南市調查處', false, '供六安里作為里辦公室及里集會空間使用',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    886900, 382080, 1268980, true, '進行中', '2013-01-01'),

(102, '台南市仁德區車頭段185、291、292及296地號', false, '供交通局作臺鐵保安站前公車轉運站使用',
    (SELECT id FROM usage_types WHERE name='交通設施'),
    21196827, null, 21196827, true, '進行中', '2013-01-01'),

(102, '中西區「機25」臨安段1082-1及1082-2地號', false, '供交通局作多功能公共運輸轉運站使用',
    (SELECT id FROM usage_types WHERE name='交通設施'),
    330685965, null, 330685965, true, '進行中', '2013-01-01'),

(102, '永新社區活動中心3樓', false, '供民族事務委員會作為西拉雅文化會館使用',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    4978909, 2152360, 7131269, true, '進行中', '2013-01-01'),

(102, '台南市仁德區崁腳段380-31、32、33、34、35、41、43地號(以上全部土地)、同段380-29 、30地號(以上部分土地)', false, '交通局規劃作為本市市區公車、幹線公車及往南國道客運之綜合轉運使用',
    (SELECT id FROM usage_types WHERE name='交通設施'),
    473689900, null, 473689900, true, '進行中', '2013-01-01'),

(102, '柳營原代表會2、3樓', false, '供工務局第二工務大隊之辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    73301892, 3762000, 77063892, true, '進行中', '2013-01-01'),

(102, '柳營科技工業區暨環保園區服務中心2樓', false, '供經濟發展局、勞工局作為檔案室使用',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    120457865, 185026680, 305484545, true, '進行中', '2013-01-01'),

(102, '台南市鹽水區仁愛段159-1、176、176-1、176-2、177、177-1、178及179-1地號', false, '供消防局興建消防隊使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    18088704, null, 18088704, true, '進行中', '2013-01-01'),

(102, '台南市鹽水區仁愛段268地號', false, '供環境保護局停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    9414994, null, 9414994, true, '進行中', '2013-01-01'),

(102, '原西港代表會', false, '供西港區公所作為做為圖書館使用',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    43504606, 3099000, 46603606, true, '進行中', '2013-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(103, '原官田代表會', false, '1樓為公所調解業務使用，2、3樓為官田區清潔隊辦公廳舍及隊員休息室使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    4408480, 1635000, 6043480, true, '進行中', '2014-01-01'),

(103, '友愛公有零售市場4樓', false, '供警察局作為婦幼警察隊辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    24838354, 3719950, 28558304, true, '進行中', '2014-01-01'),

(103, '麻豆市三公有零售市場3樓', false, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    47004227, 9604970, 56609197, true, '進行中', '2014-01-01'),

(103, '新化區公所2樓', false, '供工務局第三工務大隊之辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    132683623, 12895000, 145578623, true, '進行中', '2014-01-01'),

(103, '原學甲代表會', false, '供學甲區公所作學甲藝文中心使用',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    86267295, 1089431, 87356726, true, '進行中', '2014-01-01'),

(103, '開元市場3樓', false, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    25161694, 1191298, 26352992, true, '進行中', '2014-01-01'),

(103, '平通市場1樓及地下停車場', false, '供臺南市停車管理處使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    54989753, 5211260, 60201013, true, '進行中', '2014-01-01'),

(103, '仁德區正義段953建號', false, '供仁德區公所作為替代役參與區里社造之宿舍',
    (SELECT id FROM usage_types WHERE name='其他'),
    13033743, 62136, 13095879, true, '進行中', '2014-01-01'),

(103, '仁德第二圖書館', false, '地下室、2樓東側與3樓供工務局作檔案室使用、1樓與2樓西側供大甲國小做教室使用、其餘空間由仁德區公所規劃使用',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    16784784, 13856094, 30640878, true, '進行中', '2014-01-01'),

(103, '柳營小腳腿多功能活動中心2樓', false, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    12581894, 14994315, 27576209, true, '進行中', '2014-01-01'),

(103, '柳營科技工業區暨環保科技園區之管研大樓3樓', false, '供文化局規劃柳科典藏室建置計畫',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    11581006, 41379093, 52960099, true, '進行中', '2014-01-01'),

(103, '新化段王公廟小段1105地號', false, '供環保局回收業務及大型環保車輛進出使用',
    (SELECT id FROM usage_types WHERE name='環保設施'),
    148910700, null, 148910700, true, '進行中', '2014-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, supplementary_year, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(104, '原新營代表會', false, null, '供社會局作多功能親子大樓',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    157039440, 4874000, 161913440, true, '進行中', '2015-01-01'),

(104, '西港區老人文康活動中心2樓', false, null, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    3568842, 2895121, 6463963, true, '進行中', '2015-01-01'),

(104, '佳里代表會1樓', false, null, '供社會局做北門區家庭服務中心',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    9214291, 2031095, 11245386, true, '進行中', '2015-01-01'),

(104, '關廟代表會1樓', false, null, '供環保局關廟區隊辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    11889269, 392860, 12282129, false, '進行中', '2015-01-01'),

(104, '鹽水區老人文康活動中心1樓', false, null, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    5911769, 6561970, 12473739, true, '進行中', '2015-01-01'),

(104, '六甲區七甲龍湖活動中心2樓', false, null, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    null, 5160512, 5160512, true, '進行中', '2015-01-01'),

(104, '大內代表會3樓', false, null, '供大內區公所做為該區多元使用空間',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    24452780, 1243000, 25695780, true, '進行中', '2015-01-01'),

(104, '南瀛綠都心建物及地下層', false, null, '捐血中心及供勞工局出租青年創業使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    11762084, 1006256, 12768340, true, '進行中', '2015-01-01'),

(104, '北門公有零售市場2樓', false, null, '供北門區公所做區民文康活動中心',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    2980911, 3294150, 6275061, true, '進行中', '2015-01-01'),

(104, '原新營憲兵隊及地下室2間房間', false, null, '供警察局少年警察隊使用、觀旅局存放檔案使用',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    63039755, 51787491, 114827246, true, '進行中', '2015-01-01'),

(104, '將軍區西和社區活動中心1樓', false, null, '奇美醫院設置在地且社區化長期照護服務據點',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    189029, 70403, 259432, true, '進行中', '2015-01-01'),

(104, '新市區社內里老人文康中心1、3樓', false, null, '奇美醫院設置在地且社區化長期照護服務據點',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    368370, 761285, 1129655, true, '進行中', '2015-01-01'),

(104, '後壁代表會', false, null, '圖書館',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    8818000, null, 8818000, true, '進行中', '2015-01-01'),

(104, '白河老人文康活動中心2樓', true, 102, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    6856808, 1689585, 8546393, true, '進行中', '2015-01-01'),

(104, '關廟果菜市場', false, null, '供交通局作為關廟轉運站使用',
    (SELECT id FROM usage_types WHERE name='交通設施'),
    19670399, 1472900, 21143299, true, '進行中', '2015-01-01'),

(104, '六甲營區（六甲段4-10、4-11、15地號）', true, 102, '供動物防疫保護處作為動物管制業務及留置動物使用',
    (SELECT id FROM usage_types WHERE name='動物福利設施'),
    109624120, null, 109624120, true, '進行中', '2015-01-01'),

(104, '善化區老人文康活動中心3樓', true, 103, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    2246842, 4179715, 6426557, true, '進行中', '2015-01-01'),

(104, '警察局白河分局青山派出所', false, null, '供東山區公所做該區青山里及高原里聯合辦公處',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    6858288, 425973, 7284261, true, '進行中', '2015-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(105, '麻豆區保安段992、994、995地號', false, '供消防局第二救災救護大隊廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    27226788, null, 27226788, false, '進行中', '2016-01-01'),

(105, '警察局中西區忠義路4間眷屬宿舍', false, '供文化局活化利用',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    7512271, 32975, 7545246, true, '進行中', '2016-01-01'),

(105, '開元公有零售市場4樓', false, '供文化局藝文團隊排練空間',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    44687647, 5188818, 49876465, true, '進行中', '2016-01-01'),

(105, '善化第一公有零售市場2樓', false, '供東關里活動中心使用',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    31217298, 5519046, 36736344, true, '進行中', '2016-01-01'),

(105, '國防部陸軍隆田退舍', false, '供六甲、官田區清潔隊聯合辦公室暨停車場',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    40198000, null, 40198000, true, '進行中', '2016-01-01'),

(105, '七股區國民黨部', false, '供七股區戶政事務所辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    7069200, 239800, 7309000, true, '進行中', '2016-01-01'),

(105, '麻豆市三公有零售市場4樓', false, '供麻豆區公所多功能活動中心使用',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    23566372, 3389010, 26955382, false, '進行中', '2016-01-01'),

(105, '原將軍代表會1、2樓', false, '供警察局學甲分局將軍分駐所辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    1506545, 799636, 2306181, true, '進行中', '2016-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, supplementary_year, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(106, '楠西區鹿田派出所', false, null, '供社會局設置C級巷弄長照站',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    1610350, 1065925, 2676275, true, '進行中', '2017-01-01'),

(106, '仁德老人文康活動中心4樓', false, null, '供社會局作為托育資源中心',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    13708732, 2565054, 16273786, true, '進行中', '2017-01-01'),

(106, '安南區安西段2157、2158地號', false, null, '供警察局興建第三分局安順派出所辦公廳舍',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    14930268, null, 14930268, true, '進行中', '2017-01-01'),

(106, '柳營科技工業區暨環保園區管理研究大樓2樓商務辦公室', false, null, '供觀光旅遊局及勞工局儲存檔案使用',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    2372391, 1370747, 3743138, true, '進行中', '2017-01-01'),

(106, '新營區忠政段931-1地號(稅務局宿舍)', false, null, '供興建忠政里活動中心使用',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    10655400, null, 10655400, true, '進行中', '2017-01-01'),

(106, '中西區康樂段541-1、543、543-2、547、548、548-15、548-16、564-2、564-3地號市有土地', false, null, '供停車管理處開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    105629600, null, 105629600, true, '進行中', '2017-01-01'),

(106, '中西區萬昌段241地號市有土地', false, null, '供停車管理處開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    34913970, null, 34913970, true, '進行中', '2017-01-01'),

(106, '中西區南寧段213-1、213-2、213-3、213-4地號市有土地', true, 105, '供停車管理處開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    103073014, null, 103073014, true, '進行中', '2017-01-01'),

(106, '東區泉南段702、703地號市有土地', false, null, '供停車管理處開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    47758977, null, 47758977, true, '進行中', '2017-01-01'),

(106, '東區育樂段302、302-1、302-2地號國有土地', false, null, '供停車管理處開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    129839469, null, 129839469, true, '進行中', '2017-01-01'),

(106, '中西區玉宇段79-1地號市有土地', false, null, '供中西區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    12675264, null, 12675264, true, '進行中', '2017-01-01'),

(106, '中西區南寧段210地號市有土地', true, 105, '供停車管理處開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    139978890, null, 139978890, true, '進行中', '2017-01-01'),

(106, '中西區康樂段236、254、336、336-19、336-20地號市有土地', false, null, '供中西區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    121732104, null, 121732104, true, '進行中', '2017-01-01'),

(106, '中西區環河段29-2、29-3、29-4、31-1、32-2、33、33-4地號市有土地', false, null, '供停車管理處開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    262711125, null, 262711125, true, '進行中', '2017-01-01'),

(106, '東區竹篙厝段2111、2111-1、2111-27、2111-39地號市有土地', true, 105, '供停車管理處開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    341420100, null, 341420100, true, '進行中', '2017-01-01'),

(106, '東區路東段852、853-3、853-4地號市有土地', false, null, '供停車管理處開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    7170348, null, 7170348, true, '進行中', '2017-01-01'),

(106, '東區泉南段495、496、497、685、700地號市有土地', true, 105, '供東區區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    90920610, null, 90920610, true, '進行中', '2017-01-01'),

(106, '南區公英段1150地號市有土地', true, 101, '供南區區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    10816512, null, 10816512, true, '進行中', '2017-01-01'),

(106, '南區鹽埕段234-32、234-33地號市有土地', true, 102, '供南區區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    2787800, null, 2787800, true, '進行中', '2017-01-01'),

(106, '南區新都段71-33、71-34地號市有土地', true, 102, '供南區區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    45540415, null, 45540415, true, '進行中', '2017-01-01'),

(106, '西港區港南段338、339地號市有土地', true, 102, '供西港區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    4068372, null, 4068372, true, '進行中', '2017-01-01'),

(106, '官田區隆田段229、231、244、248地號市有土地', true, 101, '供官田區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    7344912, null, 7344912, true, '進行中', '2017-01-01'),

(106, '鹽水區新岸段703地號市有土地', true, 100, '供鹽水區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    42367400, null, 42367400, true, '進行中', '2017-01-01'),

(106, '原佳里戶政七股辦公處', true, 105, '供社會局建置社區公共托育家園和托育資源中心',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    3203200, 55734, 3258934, true, '進行中', '2017-01-01');



INSERT INTO activated_assets
(year, location, is_supplementary, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(107, '中西區龍盛社區活動中心2樓', false, '供社會局作為社區關懷據點及A級辦公室使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    6660208, 2003283, 8663491, true, '進行中', '2018-01-01'),

(107, '警察局麻豆分局賀建派出所', false, '供下營區賀建國小置放物品',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    6876000, 361000, 7237000, true, '進行中', '2018-01-01'),

(107, '原關廟代表會1樓', false, '供社會局設置社區公共托育家園',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    3562325, 358829, 3921154, true, '進行中', '2018-01-01'),

(107, '佳里區佳安東路2號、6號(佳里多摩市)', false, '供社會局照管中心作辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    2008728, 1439800, 3448528, true, '進行中', '2018-01-01'),

(107, '永新社區活動中心2樓', false, '供文資處辦理剪黏創作傳習工作坊',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    7293049, 907272, 8200321, true, '進行中', '2018-01-01'),

(107, '佳里區佳安東路12號(佳里多摩市)', false, '供財政稅務局佳里分局作倉庫使用',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    950820, 683300, 1634120, true, '進行中', '2018-01-01'),

(107, '南瀛綠都心甲梯辦公室', false, '供新營區公所作調解委員會辦公室使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    2133627, 246561, 2380188, true, '進行中', '2018-01-01'),

(107, '警察局白河分局河東派出所宿舍', false, '供環保局白河區清潔隊作辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    1192836, 287300, 1480136, true, '進行中', '2018-01-01'),

(107, '南區文華市場2樓', false, '供經發局作檔案室使用',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    3444010, 3550500, 6994510, true, '進行中', '2018-01-01'),

(107, '原官田代表會2樓', true, '供社會局設置社區公共托育家園',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    3558880, 214073, 3772953, true, '進行中', '2018-01-01'),

(107, '原社會局長青公寓1、2樓', true, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    103840363, 12639506, 116479869, true, '進行中', '2018-01-01'),

(107, '松柏育樂中心3樓', true, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    37176637, 4007131, 41183768, true, '進行中', '2018-01-01'),

(107, '官田老人養護中心1樓', true, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    14498892, 9196427, 23695319, true, '進行中', '2018-01-01'),

(107, '山上區農民教育中心2樓', true, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    null, 642441, 642441, true, '進行中', '2018-01-01'),

(107, '新化區老人文康活動中心3樓', true, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    3442276, 1684631, 5126907, true, '進行中', '2018-01-01'),

(107, '永康區復華里活動中心2樓', true, '供社會局作為日間照顧中心使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    31399149, 1433639, 32832788, true, '進行中', '2018-01-01'),

(107, '麻豆市三公有零售市場4樓', false, '供社會局建置長照整合服務家園',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    3771186, 3342608, 7113794, true, '進行中', '2018-01-01'),

(107, '柳營國中資源回收教室', false, '供社會局設置社區公共托育家園',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    2289177, 244800, 2533977, true, '進行中', '2018-01-01'),

(107, '南區再興社區活動中心', false, '供社會局設置社區公共托育家園',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    15135100, 1166400, 16301500, true, '進行中', '2018-01-01'),

(107, '南區新都段71-5、71-25及鹽埕段234-134地號市有土地', false, '供交通局開闢收費停車場',
    (SELECT id FROM usage_types WHERE name='停車場'),
    106461120, null, 106461120, true, '進行中', '2018-01-01'),

(107, '新市社教館4至5樓', true, '供社會局設置親子悠遊館',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    18390879, 1330735, 19721614, true, '進行中', '2018-01-01'),

(107, '社會福利綜合大樓1樓', true, '供社會局設置親子悠遊館',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    109965759, 8954957, 118920716, true, '進行中', '2018-01-01'),

(107, '佳里區老人文康中心2樓', true, '供社會局設置親子悠遊館',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    51746477, 1096417, 52842894, true, '進行中', '2018-01-01'),

(107, '安平區漁光段868及870地號市有土地', true, '供安平區公所規劃作臨時停車場',
    (SELECT id FROM usage_types WHERE name='停車場'),
    219902960, null, 219902960, true, '進行中', '2018-01-01'),

(107, '東區府東段709地號市有土地', true, '供東區區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    29347453, null, 29347453, true, '進行中', '2018-01-01'),

(107, '南區鹽埕段3109-118地號市有土地', true, '供南區區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    16178400, null, 16178400, true, '進行中', '2018-01-01'),

(107, '東區竹篙厝段1565地號市有土地', true, '供東區區公所規劃作臨時停車場',
    (SELECT id FROM usage_types WHERE name='停車場'),
    36842120, null, 36842120, true, '進行中', '2018-01-01'),

(107, '鹽水區仁愛段281及857-1地號市有土地', false, '供鹽水區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    54883763, null, 54883763, true, '進行中', '2018-01-01'),

(107, '鹽水區仁愛段266及269地號市有土地', false, '供鹽水區公所開闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    6532484, null, 6532484, true, '進行中', '2018-01-01'),

(107, '新市區三里聯合活動中心2樓', false, '供社會局設置社區公共托育家園',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    1575106, 553240, 2128346, true, '進行中', '2018-01-01'),

(107, '佳里區民生街17巷21號宿舍', false, '供財稅局佳里分局作倉庫使用',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    6105400, 231800, 6337200, true, '進行中', '2018-01-01'),

(107, '柳科工業區暨環保園區育成中心3樓實驗室廠房(編號304及305)', false, '304供工務局、305供勞工局作會計憑證及檔案庫房供勞工局作會計憑證及檔案庫房',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    11097936, 3820811, 14918747, true, '進行中', '2018-01-01'),

(107, '原警察局善化分局', false, '供內政部移民署臺南市專勤隊及第二服務站使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    65971716, 3127374, 69099090, true, '進行中', '2018-01-01'),

(107, '中西區福安里活動中心', false, '供內政部移民署臺南市第一服務站使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    null, 1283600, 1283600, true, '進行中', '2018-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, supplementary_year, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(108, '安南區長和段341-2地號(原大同平宅用地)', false, null, '供第四幼兒園作戶外教學空間',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    6013108, null, 6013108, true, '進行中', '2019-01-01'),

(108, '柳科工業區暨環保園區育成中心3樓實驗室廠房(編號306)', false, null, '供勞工局作檔案庫房(放置原公誠檔案庫房之檔案)',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    5548898, 2110255, 7659153, true, '進行中', '2019-01-01'),

(108, '柳科工業區暨環保園區育成中心3樓實驗室廠房(編號307)', false, null, '供都發局作檔案庫房(放置原公誠檔案庫房之檔案)',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    5548898, 2110255, 7659153, true, '進行中', '2019-01-01'),

(108, '新營區中正路37巷178號(稅務局宿舍)', false, null, '供都發局規劃為文創基地型態之辦公場域',
    (SELECT id FROM usage_types WHERE name='創業育成空間'),
    2649202, 112850, 2762052, true, '進行中', '2019-01-01'),

(108, '麻豆區市三公有零售市場地下室', false, null, '供社會局設置長照整合服務園區社福專用停車場',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    17234125, 2387481, 19621606, true, '進行中', '2019-01-01'),

(108, '北區光武里活動中心2樓', false, null, '供社會局設置親子悠遊館',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    55408536, 1208517, 56617053, true, '進行中', '2019-01-01'),

(108, '柳科工業區暨環保園區育成中心1樓實驗室廠房(編號112)', false, null, '供工務局作檔案庫房(放置原公誠檔案庫房之檔案)',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    5548898, 2110255, 7659153, true, '進行中', '2019-01-01'),

(108, '中西區建國里活動中心及善化區南關里活動中心2樓', false, null, '供社會局設置親子悠遊館、公共托育家園及身障服務空間',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    44961417, 1033538, 45994955, true, '進行中', '2019-01-01'),

(108, '北區大興里活動中心2樓', false, null, '供北區區公所辦理失智照護服務',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    12393930, 755558, 13149488, true, '進行中', '2019-01-01'),

(108, '中西區天后里活動中心', false, null, '供社會局設置愛心實物銀行實體店面',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    7386687, 2907100, 10293787, true, '進行中', '2019-01-01'),

(108, '新營區東興段503、504地號土地及大同路78巷13號宿舍', false, null, '供新營區公所整體規劃運用，增加地方休憩場所',
    (SELECT id FROM usage_types WHERE name='休閒遊憩設施'),
    6166968, 260, 6167228, true, '進行中', '2019-01-01'),

(108, '中西區星鑽段1939地號市有土地', false, null, '供警察局中正派出所警用車輛停放',
    (SELECT id FROM usage_types WHERE name='停車場'),
    3097159, null, 3097159, true, '進行中', '2019-01-01'),

(108, '警察局白河分局河東派出所', false, null, '供環保局白河區清潔隊作辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    6769574, 750425, 7519999, true, '進行中', '2019-01-01'),

(108, '友愛市場4樓', false, null, '供美商寶蘊凌科網路科技有限公司辦理微軟及臺南市政府AI發展啟動計畫',
    (SELECT id FROM usage_types WHERE name='創業育成空間'),
    27781097, 3687044, 31468141, true, '進行中', '2019-01-01'),

(108, '南瀛綠都心地下室丙梯', false, null, '供社會局作為實物銀行及工務局作為檔案室',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    16418578, 524281, 16942859, true, '進行中', '2019-01-01'),

(108, '財政稅務局安南分局2、3樓', true, 106, '供財政部南區國稅局安南稽徵所辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    19937781, 4105200, 24042981, true, '進行中', '2019-01-01'),

(108, '財政稅務局新營分局2-4樓', true, 107, '供財政部南區國稅局新營分局辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    90747058, 8028744, 98775802, true, '進行中', '2019-01-01'),

(108, '財政稅務局佳里分局3、4樓', false, null, '供財政部南區國稅局佳里稽徵所辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    16697319, 3378700, 20076019, true, '進行中', '2019-01-01'),

(108, '原水仙里活動中心', false, null, '供工務局作為檔案室',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    10258743, 920500, 11179243, true, '進行中', '2019-01-01'),

(108, '原中西區北勢里活動中心', false, null, '供文化局作為古蹟限定商品倉儲空間',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    5567090, 399100, 5966190, true, '進行中', '2019-01-01'),

(108, '永康區西灣里活動中心2樓', false, null, '供社會局設置社區公共托育家園',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    12990419, 230000, 13220419, true, '進行中', '2019-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, supplementary_year, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(109, '北區大道社區活動中心3、4樓', false, null, '供社會局作身心障礙者社區整合型服務中心',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    4227111, 516000, 4743111, true, '進行中', '2020-01-01'),

(109, '東區精忠段143、146地號部分市有土地', true, 108, '供警察局作臨時拖吊場使用',
    (SELECT id FROM usage_types WHERE name='交通設施'),
    92156400, null, 92156400, true, '進行中', '2020-01-01'),

(109, '麻豆區保安段992、994、995地號市有土地', false, null, '供麻豆區衛生所辦理公共衛生業務',
    (SELECT id FROM usage_types WHERE name='醫療衛生'),
    27226788, null, 27226788, true, '進行中', '2020-01-01'),

(109, '永康區埔園龍埔里活動中心2樓', false, null, '供社會局設置社區公共托育家園',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    1448810, 230039, 1678849, true, '進行中', '2020-01-01'),

(109, '北區大豐里活動中心2樓', false, null, '供民間單位設置社區整體照顧服務體系-C單位及身心障礙者日間作業設施新增據點',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    6642156, 1051940, 7694096, true, '進行中', '2020-01-01'),

(109, '鹽水公有零售市場3樓', false, null, '供社會局設置親子悠遊館',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    4058954, 817277, 4876231, true, '進行中', '2020-01-01'),

(109, '七股區城內里活動中心2樓', false, null, '供七股區公所辦理身心障礙者社區式日間服務',
    (SELECT id FROM usage_types WHERE name='醫療衛生'),
    null, 608900, 608900, true, '進行中', '2020-01-01'),

(109, '仁德區體育公園體育館1樓', false, null, '供工務局(建管科)作為檔案室使用',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    20445853, 2113744, 22559597, true, '進行中', '2020-01-01'),

(109, '中西區新美段867地號內及868地號市有土地', false, null, '供停車管理處作收費停車場',
    (SELECT id FROM usage_types WHERE name='停車場'),
    15375569, null, 15375569, true, '進行中', '2020-01-01'),

(109, '玉井區三埔里活動中心1樓', false, null, '供玉井區公所出租設立長照服務機構',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    64405, 367500, 431905, true, '進行中', '2020-01-01'),

(109, '中西區南美里活動中心3樓教室', false, null, '供中西區公所出租「社團法人臺南市性別平等促進會」使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    884815, 160521, 1045336, true, '進行中', '2020-01-01'),

(109, '中西區郡王里活動中心1樓辦公室', false, null, '供中西區公所出租「台南市美容職業工會」使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    1109123, 51798, 1160921, true, '進行中', '2020-01-01'),

(109, '新營區中正路5號及區東區富德街23號辦公室', false, null, '供警察局出租本市退休警察人員南瀛協會及府城協會作辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    16224442, 78780, 16303222, true, '進行中', '2020-01-01'),

(109, '東區巴克禮紀念公園自然環境教育中心', false, null, '供工務局出租長榮大學辦理推廣環境教育課程',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    2309688, 753000, 3062688, true, '進行中', '2020-01-01'),

(109, '佳里區佳安東路10號(佳里多摩市)', false, null, '供社會局設置社區公共托育家園',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    1057908, 668200, 1726108, true, '進行中', '2020-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(110, '六甲公有零售市場2樓部分空間(丙區)(面積1,294㎡)', false, '供社會局設置親子悠遊館',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    32150124, 2126552, 34276676, true, '進行中', '2021-01-01'),

(110, '新化區知義里及唪口里活動中心1樓', false, '供新化區公出租所做為社區照顧關懷據點使用',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    7941400, 321600, 8263000, true, '進行中', '2021-01-01'),

(110, '安南區長和段192、240、250地號(原大同平宅基地)', false, '供警察局興建第三分局、和順派出所新廳舍',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    135517822, null, 135517822, true, '進行中', '2021-01-01'),

(110, '中西區星鑽段2410地號內市有土地(面積1,852㎡)', false, '供停車管理處開闢收費停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    405150000, null, 405150000, true, '進行中', '2021-01-01'),

(110, '中西區星鑽段1313、1313-1地號', false, '供交通局設置收費機車停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    11017900, null, 11017900, true, '進行中', '2021-01-01'),

(110, '關廟區關廟場建物北花段307地號及176-1建號', false, '農產運銷公司關廟場建物供關廟區公所規劃供里民使用暨作為財稅局菸酒科倉庫',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    53338373, 892200, 54230573, true, '進行中', '2021-01-01'),

(110, '歸仁區市場2樓西側空間(面積661.16㎡)', false, '供衛生局設置心理衛生中心據點',
    (SELECT id FROM usage_types WHERE name='醫療衛生'),
    16181771, 1220357, 17402128, true, '進行中', '2021-01-01'),

(110, '原消防局鹽水分隊辦公室', false, '供衛生局設置心理衛生中心據點',
    (SELECT id FROM usage_types WHERE name='醫療衛生'),
    8920170, 1200800, 10120970, true, '進行中', '2021-01-01'),

(110, '安南區警察局原安順派出所', false, '供衛生局設置心理衛生中心據點',
    (SELECT id FROM usage_types WHERE name='醫療衛生'),
    12579997, 741000, 13320997, true, '進行中', '2021-01-01'),

(110, '善化區市場2樓(面積462.24㎡)', false, '供勞工局作為銀髪人才就業服務據點',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    8662111, 1295195, 9957306, false, '進行中', '2021-01-01'),

(110, '中西區新美段867、868、873地號內市有土地(面積444.84、60.16、20㎡)', false, '供中西區公所開闢收費停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    17194150, null, 17194150, true, '進行中', '2021-01-01'),

(110, '下營區營平段259、259-2地號內市有土地(面積315.46、154.42㎡)', false, '供下營區公所建闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    13814472, null, 13814472, true, '進行中', '2021-01-01'),

(110, '中西區星鑽段1478地號內市有土地(面積161.66㎡)', false, '供中西區衛生所設置衛生保健及防疫使用場所',
    (SELECT id FROM usage_types WHERE name='醫療衛生'),
    6531064, null, 6531064, true, '進行中', '2021-01-01'),

(110, '新營區中正路37巷178號(稅務局宿舍)', false, '供新營區公所作為忠政里環保義工隊日常作業辦公場所',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    2649230, 96550, 2745780, true, '進行中', '2021-01-01'),

(110, '東山區東興段198-4、198-5地號市有土地', false, '供東山區公所設置停車空間及環境綠美化',
    (SELECT id FROM usage_types WHERE name='停車場'),
    9058630, null, 9058630, true, '進行中', '2021-01-01'),

(110, '仁德區保甲段356、356-1、356-2地號市有土地', false, '供仁德區公所新建大甲里活動中心',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    11374649, null, 11374649, true, '進行中', '2021-01-01'),

(110, '北區消防局公園分隊辦公室', false, '供衛生局設置心理衛生中心據點',
    (SELECT id FROM usage_types WHERE name='醫療衛生'),
    null, 624300, 624300, true, '進行中', '2021-01-01'),

(110, '南瀛綠都心丙梯D、E及乙梯工務局舊辦公室地下室內(面積37.51、42.24、80㎡)', false, '供教育局設置新營社區大學辦學使用',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    13316809, 263851, 13580660, true, '進行中', '2021-01-01'),

(110, '玉井區玉中段480地號市有土地(面積128.56㎡)', false, '供玉井區公所建闢停車場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    1259888, null, 1259888, true, '進行中', '2021-01-01'),

(110, '新營區三民路100號閒置宿舍', false, '供臺南市政府警察局少年輔導委員會新營區駐點辦公室',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    29987078, 225200, 30212278, true, '進行中', '2021-01-01'),

(110, '安平區漁光里活動中心2樓辦公室(面積101.55㎡)', false, '供安平區公所出租作為110年度身心障礙者社區日間作業設施服務',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    null, 192700, 192700, true, '進行中', '2021-01-01'),

(110, '新化區王公廟小段1105-1地號市有土地(面積3595㎡)', false, '新化區清潔隊公務使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    60036500, null, 60036500, true, '進行中', '2021-01-01'),

(110, '南瀛綠都心地下室青創基地空間C內(面積63.53㎡)', false, '供臺南市後備指揮部新營區輔導中心使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    2445587, 102119, 2547706, true, '進行中', '2021-01-01'),

(110, '柳營區新厝里活動中心1樓(面積407.9㎡)', false, '辦理社區式日式照顧服務(樂活社會福利慈善事業基金會)',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    1590810, 815400, 2406210, true, '進行中', '2021-01-01'),

(110, '仁德區太子土庫里活動中心3樓(面積339.10㎡)', false, '辦理綜合式服務類長期服務機構(台南私立荷園社會福利慈善事業基金會)',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    9494800, 779200, 10274000, true, '進行中', '2021-01-01'),

(110, '中西區星鑽段1451、1439、1440、1433地號市有土地(面積285.80、183.39、239.75、169.01㎡)', false, '辦理其他公益性場地',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    35469180, null, 35469180, true, '進行中', '2021-01-01'),

(110, '中西區玉宇段124地號市有土地(面積187.31㎡)', false, '供中西區公所開闢停車場及活動廣場使用',
    (SELECT id FROM usage_types WHERE name='停車場'),
    12999314, null, 12999314, true, '進行中', '2021-01-01'),

(110, '中西區星鑽段2374、2376、2376-1地號市有土地及南華街98號旁市有房屋(面積136.5㎡)', false, '供社會局辦理實物愛心銀行實體(旗艦)店面',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    7876050, 92900, 7968950, true, '進行中', '2021-01-01'),

(110, '關廟區老人文康中心1樓(面積561.5㎡)', false, '辦理社區長照機構日間照顧中心(一粒麥子社會福利慈善事業基金會)',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    6513400, 1215500, 7728900, true, '進行中', '2021-01-01'),

(110, '東區龍山社區活動中心3樓會議室(二)(面積105㎡)', false, '供社會局設置社區公共托育家園',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    3391500, 307064, 3698564, true, '進行中', '2021-01-01'),

(110, '東區仁和里活動中心2樓(面積123.2㎡)', false, '供社會局設置社區公共托育家園',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    4016320, 169000, 4185320, true, '進行中', '2021-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, supplementary_year, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(111, '龍崎區龍船活動中心1樓(面積217.5㎡)', false, null, '設置日間照顧服務中心',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    7450500, 257500, 7708000, true, '進行中', '2022-01-01'),

(111, '消防局第五救災救護大隊大灣分隊辦公廳舍(永康區)(425.85面積㎡)', false, null, '供警察局交通分隊大灣小隊辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    13967880, 658800, 14626680, true, '進行中', '2022-01-01'),

(111, '中西區府前路二段370號(原移民署)(面積168.27㎡)', false, null, '供環保局做為藏金閣展示中心及中西區清潔隊辦公廳舍使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    16052117, 725000, 16777117, true, '進行中', '2022-01-01'),

(111, '新營區原警察局少年隊4樓(新營區埤寮59-8號)(面積673.95㎡)', false, null, '供農業局作為檔案室',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    14676293, 1546800, 16223093, true, '進行中', '2022-01-01'),

(111, '學甲區集合段1177及1178地號市有土地(面積1755.49㎡)', false, null, '供社會局新建北門區社會福利服務中心及公共托嬰中心',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    17415856, null, 17415856, true, '進行中', '2022-01-01'),

(111, '善化區善化市場2樓C區(面積112.32㎡)(善化區中山路377號2樓)', false, null, '供都發局作為檔案室',
    (SELECT id FROM usage_types WHERE name='檔案室/倉儲'),
    2112710, 366410, 2479120, true, '進行中', '2022-01-01'),

(111, '中西區環河街56號(面積189.06㎡)(星鑽段2229地號及3310建號市有房地)', false, null, '出租南市區漁會作為信用部使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    12421242, 816700, 13237942, true, '進行中', '2022-01-01'),

(111, '仁德區崁腳北段1260、1261、 1267-1地號(面積2912.64㎡)', false, null, '交通局(公共運輸處)短期出租府城客運作為市區公車車輛調度使用',
    (SELECT id FROM usage_types WHERE name='交通運輸設施'),
    55048896, null, 55048896, true, '進行中', '2022-01-01'),

(111, '仁德區崁腳北段 1267-1地號(面積6750.31㎡)', false, null, '交通局(公共運輸處)短期出租國光客運作為公車車輛調度使用',
    (SELECT id FROM usage_types WHERE name='交通運輸設施'),
    127580859, null, 127580859, true, '進行中', '2022-01-01'),

(111, '仁德區崁腳北段1259地號(面積1536.32㎡)', false, null, '交通局(公共運輸處)短期出租漢程客運作為市區公車車輛調度使用',
    (SELECT id FROM usage_types WHERE name='交通運輸設施'),
    29036448, null, 29036448, true, '進行中', '2022-01-01'),

(111, '善化區善化市場2樓A、B區及西側空間(面積595㎡)', false, null, '供衛生局設置心理衛生中心據點',
    (SELECT id FROM usage_types WHERE name='醫療衛生'),
    11191867, 1941163, 13133030, true, '進行中', '2022-01-01'),

(111, '七股區義合里多功能活動中心(面積222.926㎡)', false, null, '辦理社區式長期照顧服務(樂活社會福利慈善事業基金會)',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    null, 349200, 349200, true, '進行中', '2022-01-01'),

(111, '安平區漁光里活動中心2樓辦公室及2樓教室4(增加面積31.39㎡)', true, 110, '辦理身心障礙者社區日間作業設施服務(樂活社會福利慈善事業基金會)',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    null, 59600, 59600, true, '進行中', '2022-01-01'),

(111, '將軍區西和社區活動中心1樓(面積389.35㎡)', false, null, '作為日間照顧服務中心(財團法人高雄市華仁社會福利慈善事業基金會)',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    1012310, 451000, 1463310, true, '進行中', '2022-01-01'),

(111, '七股區龍山里漁民活動中心(面積635.3㎡)', false, null, '設置日間照顧服務中心',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    null, 718700, 718700, true, '進行中', '2022-01-01'),

(111, '仁德區中軍段923地號(面積9231.73㎡)', false, null, '規劃興建第五救災救護大隊文賢分隊及警察局歸仁分局德南派出所辦公廳舍',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    42465958, null, 42465958, true, '進行中', '2022-01-01'),

(111, '東山頂田社區活動中心東山區頂田段234地號(面積481.16㎡)', false, null, '作為日間照顧服務中心(社團法人臺南市常青樹協會)',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    null, 1274400, 1274400, true, '進行中', '2022-01-01'),

(111, '原關廟區環保局辦公室2、3樓關廟區仁愛段1147、1148地號', false, null, '供衛生局設置社區心衛中心',
    (SELECT id FROM usage_types WHERE name='醫療衛生'),
    26398624, 685800, 27084424, true, '進行中', '2022-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(112, '北區實踐社區活動中心2樓(面積197.8㎡)', false, '供臺南市四季愛心歌友會辦理公益性質活動課程',
    (SELECT id FROM usage_types WHERE name='文教設施'),
    14813915, 391600, 15205515, true, '進行中', '2023-01-01'),

(112, '中西區友愛市場2樓(面積1282.9m²)', false, '打造臺南青年創業及數位人才之創生育成空間',
    (SELECT id FROM usage_types WHERE name='創業育成空間'),
    24067885, 3391000, 27458885, true, '進行中', '2023-01-01'),

(112, '山上區山上里農民教育活動中心2樓(面積303.3m²)', false, '作為日間照顧服務中心(財團法人台南市私立聖功社會福利慈善基金會)',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    null, 576300, 576300, true, '進行中', '2023-01-01'),

(112, '安平區遊憩碼頭建築物2樓(面積:72m²)', false, '供觀光旅遊局辦理「安平區遊憩碼頭建築物2樓飲食空間公開標租案」',
    (SELECT id FROM usage_types WHERE name='辦理標租作業'),
    1274400, 194100, 1468500, true, '進行中', '2023-01-01'),

(112, '安南區海北段375地號', false, '供文資處辦理移轉管理、地上建物受贈及後續專案出租',
    (SELECT id FROM usage_types WHERE name='辦理標租作業'),
    9069098, null, 9069098, true, '進行中', '2023-01-01'),

(112, '南區殯儀館永安門旁建物(面積32.99m²)及柳營祿園殯葬專區火化場2樓(面積40.55m²)', false, '供台南市葬儀商業同業公會進駐成立聯合服務中心',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    917468, 138643, 1056111, true, '進行中', '2023-01-01'),

(112, '善化區善化市場二樓西側(面積約80坪)', false, '設置南科特定區區段徵收辦公室',
    (SELECT id FROM usage_types WHERE name='辦理標租作業'),
    27142104, 839136, 27981240, true, '進行中', '2023-01-01'),

(112, '新營區中正路37巷150號、168號、172號宿舍', false, '供文化局作工作站，供考古文物暫存、整理，人員辦公及研究工作使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    10291008, 413600, 10704608, true, '進行中', '2023-01-01'),

(112, '東區竹篙厝段1682地號(部分)公開標租(星期一至五)暨專案出租(星期六、日)', false, '1.短期活化公開標租(星期一至五)予惠提實業有限公司辦理夜市。2.專案出租予臺南市農會辦理假日農市。',
    (SELECT id FROM usage_types WHERE name='商業市集'),
    327041980, null, 327041980, true, '進行中', '2023-01-01'),

(112, '龍崎區龍船派出所1樓部分(面積:58.2m²)及2樓(面積:116.4m²)', false, '設立消防局龍崎分隊之辦公空間',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    174600, 203850, 378450, true, '進行中', '2023-01-01'),

(112, '新市區大社社區活動中心1樓(面積：322.5m2)', false, '供「社團法人臺南市弘福社區關懷照顧服務協會」承租籌設大社社區長照機構',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    null, 321900, 321900, true, '進行中', '2023-01-01'),

(112, '龍崎舊公有零售市場1樓(面積：636.8m2)', false, '供龍崎區公所辦理超商進駐',
    (SELECT id FROM usage_types WHERE name='商業服務設施'),
    3311360, 475800, 3787160, true, '進行中', '2023-01-01'),

(112, '新市區文康育樂中心2樓', false, '供社團法人臺南市弘福社區關懷照顧服務協會承租作日間照顧服務中心',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    13248963, 1171400, 14420363, true, '進行中', '2023-01-01'),

(112, '麻豆區總榮里活動中心2樓', false, '供社會局設置麻豆親子館',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    null, 298600, 298600, true, '進行中', '2023-01-01'),

(112, '北區北安段743-2地號、南區鹽埕段290-942、290-943地號內及白河區中興段1745地號', false, '市有土地活化(112年第2次公開標租)',
    (SELECT id FROM usage_types WHERE name='辦理標租作業'),
    26494877, null, 26494877, true, '進行中', '2023-01-01');


INSERT INTO activated_assets
(year, location, is_supplementary, usage_plan, usage_type_id, land_value, building_value, benefit_value, is_counted, status, start_date)
VALUES
(113, '原警察局新化分局岡林派出所(面積：144.4m2)', false, '供左鎮區公所予岡林巡守隊進駐',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    993600, 165200, 1158800, true, '進行中', '2024-01-01'),

(113, '新營區微型創新教育體驗基地', false, '供新營區公所出租設計顧問公司',
    (SELECT id FROM usage_types WHERE name='商業服務設施'),
    25047816, 675000, 25722816, true, '進行中', '2024-01-01'),

(113, '警察局歸仁分局龍船派出所2樓', false, '供消防局設立龍崎消防救護站',
    (SELECT id FROM usage_types WHERE name='緊急救援設施'),
    647250, 135900, 783150, true, '進行中', '2024-01-01'),

(113, '南區灣裡聯合里活動中心1樓部分場地(面積：96.59㎡)', false, '出租予臺南郵局',
    (SELECT id FROM usage_types WHERE name='郵政服務設施'),
    8892571, 150816, 9043387, true, '進行中', '2024-01-01'),

(113, '中西區中頭社區活動中心2樓辦公室(面積：73㎡)', false, '辦理公開標租作業',
    (SELECT id FROM usage_types WHERE name='辦理標租作業'),
    3629252, 170106, 3799358, true, '進行中', '2024-01-01'),

(113, '六甲區六甲段4-8及4-11地號市有土地', false, '供警察局興建多功能訓練中心',
    (SELECT id FROM usage_types WHERE name='教育訓練設施'),
    35926566, null, 35926566, true, '進行中', '2024-01-01'),

(113, '永康區五王段116-5地號市有土地', false, '供永康區公所為綠美化使用',
    (SELECT id FROM usage_types WHERE name='環境綠化設施'),
    21104796, null, 21104796, true, '進行中', '2024-01-01'),

(113, '新營區忠政段101地號市有土地', false, '由交通局設置收費停車場',
    (SELECT id FROM usage_types WHERE name='停車場'),
    7698154, null, 7698154, true, '進行中', '2024-01-01'),

(113, '西港區双營段1653地號市有土地', false, '供西港區公所為綠美化及民眾休憩空間使用',
    (SELECT id FROM usage_types WHERE name='環境綠化設施'),
    12768030, null, 12768030, true, '進行中', '2024-01-01'),

(113, '安南區塭南里活動中心2樓', false, '供社會局出租設置身心障礙者社區式日間照顧服務',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    3375246, 494640, 3869886, true, '進行中', '2024-01-01'),

(113, '安定區安定段1074-2地號等37筆土地', false, '供工務局出租予台積電建置3奈米廠所需工務所設置使用',
    (SELECT id FROM usage_types WHERE name='產業支援設施'),
    94551300, null, 94551300, true, '進行中', '2024-01-01'),

(113, '安南區長和段1072、1074及1075地號市有土地', false, '辦理公開標租作業',
    (SELECT id FROM usage_types WHERE name='辦理標租作業'),
    26628979, null, 26628979, true, '進行中', '2024-01-01'),

(113, '安平區第三幼兒園1及2樓', false, '供社會局設置安平身心障礙者服務中心',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    12555280, 939265, 13494545, true, '進行中', '2024-01-01'),

(113, '安平區第三幼兒園3及4樓', true, '供社會局設置身障日間服務據點及安平區社會福利服務中心',
    (SELECT id FROM usage_types WHERE name='社會福利設施'),
    12555280, 939265, 13494545, true, '進行中', '2024-01-01'),

(113, '中西區南廠里活動中心2樓辦公室(面積：19.2㎡)', false, '辦理公開標租作業',
    (SELECT id FROM usage_types WHERE name='辦理標租作業'),
    626397, 64220, 690617, true, '進行中', '2024-01-01'),

(113, '永康區永二段240-1及241-1地號市有土地', false, '供永康區公所新建網寮里活動中心',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    29712285, null, 29712285, true, '進行中', '2024-01-01'),

(113, '永康區平道段105地號市有土地', false, '供永康區公所新建三民里活動中心',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    39639859, null, 39639859, true, '進行中', '2024-01-01'),

(113, '官田區鎮北段865及866地號市有土地', false, '供官田區公所設置機車考照練習場',
    (SELECT id FROM usage_types WHERE name='交通設施'),
    6526688, null, 6526688, true, '進行中', '2024-01-01'),

(113, '北區文元文成元美里聯合活動中心四樓教室B', false, '供社會局作為台南市第二區居家托育服務中心',
    (SELECT id FROM usage_types WHERE name='親子育兒設施'),
    4839680, 172863, 5012543, true, '進行中', '2024-01-01'),

(113, '永康區永安段11地號', false, '新建永康區蔦松里活動中心',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    32419820, null, 32419820, true, '進行中', '2024-01-01'),

(113, '北區大和社區活動中心2樓', false, '辦理公開標租作業',
    (SELECT id FROM usage_types WHERE name='辦理標租作業'),
    9906377, 3029000, 12935377, true, '進行中', '2024-01-01'),

(113, '官田區番子田段740地號等6筆土地', false, '新建官田區隆田里活動中心',
    (SELECT id FROM usage_types WHERE name='活動中心'),
    3850000, null, 3850000, true, '進行中', '2024-01-01'),

(113, '新營區武昌街3號1樓辦公室及東區富德街23號辦公室', false, '出租予臺南市大台南警察之友會及台南市警察之友會作辦公室使用',
    (SELECT id FROM usage_types WHERE name='辦公廳舍/行政空間'),
    2590133, 77820, 2667953, true, '進行中', '2024-01-01');



-- 先建立需求機關資料
INSERT INTO agencies (name) VALUES
('警察局'),
('社會局'),
('市場處'),
('工務局'),
('消防局'),
('南區區公所'),
('農業局'),
('交通局'),
('健保局')
ON CONFLICT (name) DO NOTHING;

-- 建立已活化資產與需求機關的關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
VALUES
-- 100-1 警察局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '舊安南地政事務所'),
 (SELECT id FROM agencies WHERE name = '警察局')),

-- 100-2 警察局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '東門派出所'),
 (SELECT id FROM agencies WHERE name = '警察局')),

-- 100-3 警察局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '原臺南縣團管區'),
 (SELECT id FROM agencies WHERE name = '警察局')),

-- 100-4 社會局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '原崎內國小'),
 (SELECT id FROM agencies WHERE name = '社會局')),

-- 100-5 社會局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '佳里代表會2樓'),
 (SELECT id FROM agencies WHERE name = '社會局')),

-- 100-6 市場處
((SELECT id FROM activated_assets WHERE year = 100 AND location = '仁德第一市場4樓'),
 (SELECT id FROM agencies WHERE name = '臺南市市場處')),

-- 100-7 工務局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '東區竹篙厝段1684地號土地'),
 (SELECT id FROM agencies WHERE name = '工務局')),

-- 100-8 工務局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '臺南地政事務所4樓部分空間'),
 (SELECT id FROM agencies WHERE name = '工務局')),

-- 100-9 消防局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '台南市佳里區潭墘段617地號'),
 (SELECT id FROM agencies WHERE name = '消防局')),

-- 100-10 消防局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '台南市楠西區東勢段532地號'),
 (SELECT id FROM agencies WHERE name = '消防局')),

-- 100-11 消防局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '北區北元段1059地號'),
 (SELECT id FROM agencies WHERE name = '消防局')),

-- 100-12 南區區公所
((SELECT id FROM activated_assets WHERE year = 100 AND location = '文華公有零售市場二樓'),
 (SELECT id FROM agencies WHERE name = '南區區公所')),

-- 100-13 農業局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '民治市政中心世紀大樓三樓'),
 (SELECT id FROM agencies WHERE name = '農業局')),

-- 100-14 交通局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '元安里活動中心'),
 (SELECT id FROM agencies WHERE name = '交通局')),

-- 100-15 健保局
((SELECT id FROM activated_assets WHERE year = 100 AND location = '台南市中西區廣慈段547地號'),
 (SELECT id FROM agencies WHERE name = '健保局'));

INSERT INTO agencies (name) VALUES
('交通部觀光署')
ON CONFLICT (name) DO NOTHING;


-- 建立已活化資產與需求機關的關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '中西區友愛公有零售市場2、3樓' THEN ag.name = '經濟發展局'
    WHEN a.location = '第一幼稚園北門分園' THEN ag.name = '工務局'
    WHEN a.location = '安平區海興公有零售市場' THEN ag.name = '安平區公所'
    WHEN a.location = '本淵寮公有零售市場2、3樓' THEN ag.name = '秘書處'
    WHEN a.location = '善化第一公有零售市場2樓' THEN ag.name = '水利局'
    WHEN a.location = '原關廟原代表會2、3樓' THEN ag.name = '環保局'
    WHEN a.location = '北門區永華國小' THEN ag.name = '交通部觀光署'
    WHEN a.location = '台南市關廟區民生段570地號' THEN ag.name = '交通局'
    WHEN a.location = '永康原代表會3樓' THEN ag.name = '社會局'
END
WHERE a.year = 101;

INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '麻豆果菜市場' THEN ag.name = '交通局'
    WHEN a.location = '佳里區原法務部調查局臺南市調查處' THEN ag.name = '佳里區公所'
    WHEN a.location = '台南市仁德區車頭段185、291、292及296地號' THEN ag.name = '交通局'
    WHEN a.location = '中西區「機25」臨安段1082-1及1082-2地號' THEN ag.name = '交通局'
    WHEN a.location = '永新社區活動中心3樓' THEN ag.name = '原住民族事務委員會'
    WHEN a.location = '台南市仁德區崁腳段380-31、32、33、34、35、41、43地號(以上全部土地)、同段380-29 、30地號(以上部分土地)' THEN ag.name = '交通局'
    WHEN a.location = '柳營原代表會2、3樓' THEN ag.name = '工務局'
    WHEN a.location = '台南市鹽水區仁愛段159-1、176、176-1、176-2、177、177-1、178及179-1地號' THEN ag.name = '消防局'
    WHEN a.location = '台南市鹽水區仁愛段268地號' THEN ag.name = '環保局'
    WHEN a.location = '原西港代表會' THEN ag.name = '西港區公所'
END
WHERE a.year = 102;


-- 建立一般的一對一關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '友愛公有零售市場4樓' THEN ag.name = '警察局'
    WHEN a.location = '麻豆市三公有零售市場3樓' THEN ag.name = '社會局'
    WHEN a.location = '新化區公所2樓' THEN ag.name = '工務局'
    WHEN a.location = '原學甲代表會' THEN ag.name = '學甲區公所'
    WHEN a.location = '開元市場3樓' THEN ag.name = '社會局'
    WHEN a.location = '平通市場1樓及地下停車場' THEN ag.name = '交通局'
    WHEN a.location = '仁德區正義段953建號' THEN ag.name = '仁德區公所'
    WHEN a.location = '柳營小腳腿多功能活動中心2樓' THEN ag.name = '社會局'
    WHEN a.location = '柳營科技工業區暨環保科技園區之管研大樓3樓' THEN ag.name = '文化局'
    WHEN a.location = '新化段王公廟小段1105地號' THEN ag.name = '環保局'
END
WHERE a.year = 103;

-- 處理多對多關聯（原官田代表會）
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
CROSS JOIN agencies ag
WHERE a.year = 103
AND a.location = '原官田代表會'
AND ag.name IN ('環保局', '官田區公所');

-- 處理多對多關聯（仁德第二圖書館）
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
CROSS JOIN agencies ag
WHERE a.year = 103
AND a.location = '仁德第二圖書館'
AND ag.name IN ('工務局', '大甲國小', '仁德區公所');


INSERT INTO agencies (name, note) VALUES
('奇美醫院', '醫院')
ON CONFLICT (name) DO NOTHING;

-- 建立一般的一對一關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '原新營代表會' THEN ag.name = '社會局'
    WHEN a.location = '西港區老人文康活動中心2樓' THEN ag.name = '社會局'
    WHEN a.location = '佳里代表會1樓' THEN ag.name = '社會局'
    WHEN a.location = '關廟代表會1樓' THEN ag.name = '環保局'
    WHEN a.location = '鹽水區老人文康活動中心1樓' THEN ag.name = '社會局'
    WHEN a.location = '六甲區七甲龍湖活動中心2樓' THEN ag.name = '社會局'
    WHEN a.location = '大內代表會3樓' THEN ag.name = '大內區公所'
    WHEN a.location = '南瀛綠都心建物及地下層' THEN ag.name = '勞工局'
    WHEN a.location = '北門公有零售市場2樓' THEN ag.name = '北門區公所'
    WHEN a.location = '將軍區西和社區活動中心1樓' THEN ag.name = '奇美醫院'
    WHEN a.location = '新市區社內里老人文康中心1、3樓' THEN ag.name = '奇美醫院'
    WHEN a.location = '後壁代表會' THEN ag.name = '後壁區公所'
    WHEN a.location = '白河老人文康活動中心2樓' THEN ag.name = '社會局'
    WHEN a.location = '關廟果菜市場' THEN ag.name = '交通局'
    WHEN a.location = '六甲營區（六甲段4-10、4-11、15地號）' THEN ag.name = '動物防疫保護處'
    WHEN a.location = '善化區老人文康活動中心3樓' THEN ag.name = '社會局'
    WHEN a.location = '警察局白河分局青山派出所' THEN ag.name = '東山區公所'
END
WHERE a.year = 104;

-- 處理多對多關聯（原新營憲兵隊及地下室2間房間）
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
CROSS JOIN agencies ag
WHERE a.year = 104
AND a.location = '原新營憲兵隊及地下室2間房間'
AND ag.name IN ('警察局', '觀光旅遊局');


INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '麻豆區保安段992、994、995地號' THEN ag.name = '消防局'
    WHEN a.location = '警察局中西區忠義路4間眷屬宿舍' THEN ag.name = '文化局'
    WHEN a.location = '開元公有零售市場4樓' THEN ag.name = '文化局'
    WHEN a.location = '善化第一公有零售市場2樓' THEN ag.name = '善化區公所'
    WHEN a.location = '國防部陸軍隆田退舍' THEN ag.name = '環保局'
    WHEN a.location = '七股區國民黨部' THEN ag.name = '佳里戶政事務所'
    WHEN a.location = '麻豆市三公有零售市場4樓' THEN ag.name = '麻豆區公所'
    WHEN a.location = '原將軍代表會1、2樓' THEN ag.name = '警察局'
END
WHERE a.year = 105;

-- 106
-- 建立一般的一對一關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '楠西區鹿田派出所' THEN ag.name = '社會局'
    WHEN a.location = '仁德老人文康活動中心4樓' THEN ag.name = '社會局'
    WHEN a.location = '安南區安西段2157、2158地號' THEN ag.name = '警察局'
    WHEN a.location = '新營區忠政段931-1地號(稅務局宿舍)' THEN ag.name = '新營區公所'
    WHEN a.location = '中西區康樂段541-1、543、543-2、547、548、548-15、548-16、564-2、564-3地號市有土地' THEN ag.name = '交通局'
    WHEN a.location = '中西區萬昌段241地號市有土地' THEN ag.name = '交通局'
    WHEN a.location = '中西區南寧段213-1、213-2、213-3、213-4地號市有土地' THEN ag.name = '交通局'
    WHEN a.location = '東區泉南段702、703地號市有土地' THEN ag.name = '交通局'
    WHEN a.location = '東區育樂段302、302-1、302-2地號國有土地' THEN ag.name = '交通局'
    WHEN a.location = '中西區玉宇段79-1地號市有土地' THEN ag.name = '中西區公所'
    WHEN a.location = '中西區南寧段210地號市有土地' THEN ag.name = '交通局'
    WHEN a.location = '中西區康樂段236、254、336、336-19、336-20地號市有土地' THEN ag.name = '中西區公所'
    WHEN a.location = '中西區環河段29-2、29-3、29-4、31-1、32-2、33、33-4地號市有土地' THEN ag.name = '交通局'
    WHEN a.location = '東區竹篙厝段2111、2111-1、2111-27、2111-39地號市有土地' THEN ag.name = '交通局'
    WHEN a.location = '東區路東段852、853-3、853-4地號市有土地' THEN ag.name = '交通局'
    WHEN a.location = '東區泉南段495、496、497、685、700地號市有土地' THEN ag.name = '東區區公所'
    WHEN a.location = '南區公英段1150地號市有土地' THEN ag.name = '南區區公所'
    WHEN a.location = '南區鹽埕段234-32、234-33地號市有土地' THEN ag.name = '南區區公所'
    WHEN a.location = '南區新都段71-33、71-34地號市有土地' THEN ag.name = '南區區公所'
    WHEN a.location = '西港區港南段338、339地號市有土地' THEN ag.name = '西港區公所'
    WHEN a.location = '官田區隆田段229、231、244、248地號市有土地' THEN ag.name = '官田區公所'
    WHEN a.location = '鹽水區新岸段703地號市有土地' THEN ag.name = '鹽水區公所'
    WHEN a.location = '原佳里戶政七股辦公處' THEN ag.name = '社會局'
END
WHERE a.year = 106;


-- 處理多對多關聯（柳營科技工業區暨環保園區管理研究大樓2樓商務辦公室）
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
CROSS JOIN agencies ag
WHERE a.year = 106
AND a.location = '柳營科技工業區暨環保園區管理研究大樓2樓商務辦公室'
AND ag.name IN ('觀光旅遊局', '勞工局');


INSERT INTO agencies (name, note) VALUES
('內政部移民署', '內政部')
ON CONFLICT (name) DO NOTHING;

-- 107
-- 建立一般的一對一關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '中西區龍盛社區活動中心2樓' THEN ag.name = '社會局'
    WHEN a.location = '警察局麻豆分局賀建派出所' THEN ag.name = '賀建國小'
    WHEN a.location = '原關廟代表會1樓' THEN ag.name = '社會局'
    WHEN a.location = '佳里區佳安東路2號、6號(佳里多摩市)' THEN ag.name = '社會局'
    WHEN a.location = '永新社區活動中心2樓' THEN ag.name = '文化資產管理處'
    WHEN a.location = '佳里區佳安東路12號(佳里多摩市)' THEN ag.name = '財政稅務局'
    WHEN a.location = '南瀛綠都心甲梯辦公室' THEN ag.name = '新營區公所'
    WHEN a.location = '警察局白河分局河東派出所宿舍' THEN ag.name = '環境保護局'
    WHEN a.location = '南區文華市場2樓' THEN ag.name = '經濟發展局'
    WHEN a.location = '原官田代表會2樓' THEN ag.name = '社會局'
    -- ... (省略中間相似的對應關係)
    WHEN a.location = '南區鹽埕段3109-118地號市有土地' THEN ag.name = '南區區公所'
    WHEN a.location = '東區竹篙厝段1565地號市有土地' THEN ag.name = '東區區公所'
    WHEN a.location = '鹽水區仁愛段281及857-1地號市有土地' THEN ag.name = '鹽水區公所'
    WHEN a.location = '鹽水區仁愛段266及269地號市有土地' THEN ag.name = '鹽水區公所'
    WHEN a.location = '新市區三里聯合活動中心2樓' THEN ag.name = '社會局'
    WHEN a.location = '佳里區民生街17巷21號宿舍' THEN ag.name = '財政稅務局'
    WHEN a.location = '原警察局善化分局' THEN ag.name = '內政部移民署'
    WHEN a.location = '中西區福安里活動中心' THEN ag.name = '內政部移民署'
END
WHERE a.year = 107;

-- 處理多對多關聯（柳科工業區暨環保園區育成中心3樓實驗室廠房）
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
CROSS JOIN agencies ag
WHERE a.year = 107
AND a.location = '柳科工業區暨環保園區育成中心3樓實驗室廠房(編號304及305)'
AND ag.name IN ('工務局', '勞工局');



INSERT INTO agencies (name, note) VALUES
('南區國稅局', '財政部')
ON CONFLICT (name) DO NOTHING;


-- 108
-- 建立一般的一對一關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '安南區長和段341-2地號(原大同平宅用地)' THEN ag.name = '教育局'
    WHEN a.location = '柳科工業區暨環保園區育成中心3樓實驗室廠房(編號306)' THEN ag.name = '勞工局'
    WHEN a.location = '柳科工業區暨環保園區育成中心3樓實驗室廠房(編號307)' THEN ag.name = '都市發展局'
    WHEN a.location = '新營區中正路37巷178號(稅務局宿舍)' THEN ag.name = '都市發展局'
    WHEN a.location = '麻豆區市三公有零售市場地下室' THEN ag.name = '社會局'
    WHEN a.location = '北區光武里活動中心2樓' THEN ag.name = '社會局'
    WHEN a.location = '柳科工業區暨環保園區育成中心1樓實驗室廠房(編號112)' THEN ag.name = '工務局'
    WHEN a.location = '中西區建國里活動中心及善化區南關里活動中心2樓' THEN ag.name = '社會局'
    WHEN a.location = '北區大興里活動中心2樓' THEN ag.name = '民政局'
    WHEN a.location = '中西區天后里活動中心' THEN ag.name = '社會局'
    WHEN a.location = '新營區東興段503、504地號土地及大同路78巷13號宿舍' THEN ag.name = '新營區公所'
    WHEN a.location = '中西區星鑽段1939地號市有土地' THEN ag.name = '警察局'
    WHEN a.location = '警察局白河分局河東派出所' THEN ag.name = '環境保護局'
    WHEN a.location = '友愛市場4樓' THEN ag.name = '智慧發展中心'
    WHEN a.location = '財政稅務局安南分局2、3樓' THEN ag.name = '南區國稅局'
    WHEN a.location = '財政稅務局新營分局2-4樓' THEN ag.name = '南區國稅局'
    WHEN a.location = '財政稅務局佳里分局3、4樓' THEN ag.name = '南區國稅局'
    WHEN a.location = '原水仙里活動中心' THEN ag.name = '工務局'
    WHEN a.location = '原中西區北勢里活動中心' THEN ag.name = '文化局'
    WHEN a.location = '永康區西灣里活動中心2樓' THEN ag.name = '社會局'
END
WHERE a.year = 108;

-- 處理多對多關聯（南瀛綠都心地下室丙梯）
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
CROSS JOIN agencies ag
WHERE a.year = 108
AND a.location = '南瀛綠都心地下室丙梯'
AND ag.name IN ('社會局', '工務局');



-- 109
-- 建立已活化資產與需求機關的關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '北區大道社區活動中心3、4樓' THEN ag.name = '社會局'
    WHEN a.location = '東區精忠段143、146地號部分市有土地' THEN ag.name = '警察局'
    WHEN a.location = '麻豆區保安段992、994、995地號市有土地' THEN ag.name = '衛生局'
    WHEN a.location = '永康區埔園龍埔里活動中心2樓' THEN ag.name = '社會局'
    WHEN a.location = '北區大豐里活動中心2樓' THEN ag.name = '北區區公所'
    WHEN a.location = '鹽水公有零售市場3樓' THEN ag.name = '社會局'
    WHEN a.location = '七股區城內里活動中心2樓' THEN ag.name = '七股區公所'
    WHEN a.location = '仁德區體育公園體育館1樓' THEN ag.name = '工務局'
    WHEN a.location = '中西區新美段867地號內及868地號市有土地' THEN ag.name = '停車管理處'
    WHEN a.location = '玉井區三埔里活動中心1樓' THEN ag.name = '玉井區公所'
    WHEN a.location = '中西區南美里活動中心3樓教室' THEN ag.name = '中西區公所'
    WHEN a.location = '中西區郡王里活動中心1樓辦公室' THEN ag.name = '中西區公所'
    WHEN a.location = '新營區中正路5號及區東區富德街23號辦公室' THEN ag.name = '警察局'
    WHEN a.location = '東區巴克禮紀念公園自然環境教育中心' THEN ag.name = '工務局'
    WHEN a.location = '佳里區佳安東路10號(佳里多摩市)' THEN ag.name = '社會局'
END
WHERE a.year = 109;


-- 110
-- 建立已活化資產與需求機關的關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '六甲公有零售市場2樓部分空間(丙區)(面積1,294㎡)' THEN ag.name = '社會局'
    WHEN a.location = '新化區知義里及唪口里活動中心1樓' THEN ag.name = '新化區公所'
    WHEN a.location = '安南區長和段192、240、250地號(原大同平宅基地)' THEN ag.name = '警察局'
    WHEN a.location = '中西區星鑽段2410地號內市有土地(面積1,852㎡)' THEN ag.name = '交通局'
    WHEN a.location = '中西區星鑽段1313、1313-1地號' THEN ag.name = '交通局'
    WHEN a.location = '關廟區關廟場建物北花段307地號及176-1建號' THEN ag.name = '關廟區公所'
    WHEN a.location IN ('歸仁區市場2樓西側空間(面積661.16㎡)', '原消防局鹽水分隊辦公室', '安南區警察局原安順派出所', '北區消防局公園分隊辦公室') THEN ag.name = '衛生局'
    WHEN a.location = '善化區市場2樓(面積462.24㎡)' THEN ag.name = '勞工局'
    WHEN a.location LIKE '中西區新美段867、868、873地號%' THEN ag.name = '中西區公所'
    WHEN a.location = '下營區營平段259、259-2地號內市有土地(面積315.46、154.42㎡)' THEN ag.name = '下營區公所'
    WHEN a.location = '中西區星鑽段1478地號內市有土地(面積161.66㎡)' THEN ag.name = '中西區衛生所'
    WHEN a.location = '新營區中正路37巷178號(稅務局宿舍)' THEN ag.name = '新營區公所'
    WHEN a.location = '東山區東興段198-4、198-5地號市有土地' THEN ag.name = '東山區公所'
    WHEN a.location = '仁德區保甲段356、356-1、356-2地號市有土地' THEN ag.name = '仁德區公所'
    WHEN a.location = '南瀛綠都心丙梯D、E及乙梯工務局舊辦公室地下室內(面積37.51、42.24、80㎡)' THEN ag.name = '教育局'
    WHEN a.location = '玉井區玉中段480地號市有土地(面積128.56㎡)' THEN ag.name = '玉井區公所'
    WHEN a.location = '新營區三民路100號閒置宿舍' THEN ag.name = '警察局'
    WHEN a.location IN ('安平區漁光里活動中心2樓辦公室(面積101.55㎡)', '柳營區新厝里活動中心1樓(面積407.9㎡)', '仁德區太子土庫里活動中心3樓(面積339.10㎡)') THEN ag.name = '民政局'
    WHEN a.location = '新化區王公廟小段1105-1地號市有土地(面積3595㎡)' THEN ag.name = '環境保護局'
    WHEN a.location = '南瀛綠都心地下室青創基地空間C內(面積63.53㎡)' THEN ag.name = '工務局'
    WHEN a.location IN ('中西區星鑽段1451、1439、1440、1433地號市有土地(面積285.80、183.39、239.75、169.01㎡)', '中西區玉宇段124地號市有土地(面積187.31㎡)') THEN ag.name = '中西區公所'
    WHEN a.location IN ('中西區星鑽段2374、2376、2376-1地號市有土地及南華街98號旁市有房屋(面積136.5㎡)', '關廟區老人文康中心1樓(面積561.5㎡)', '東區龍山社區活動中心3樓會議室(二)(面積105㎡)', '東區仁和里活動中心2樓(面積123.2㎡)') THEN ag.name = '社會局'
END
WHERE a.year = 110;


INSERT INTO agencies (name, note) VALUES
('南市區漁會', '漁會'),
('府城客運公司', '客運'),
('國光客運公司', '客運'),
('漢程客運公司', '客運')
ON CONFLICT (name) DO NOTHING;


-- 111
-- 建立已活化資產與需求機關的關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '龍崎區龍船活動中心1樓' THEN ag.name = '龍崎區公所'
    WHEN a.location = '消防局第五救災救護大隊大灣分隊辦公廳舍(永康區)(425.85面積㎡)' THEN ag.name = '警察局'
    WHEN a.location = '中西區府前路二段370號(原移民署)(面積168.27㎡)' THEN ag.name = '環境保護局'
    WHEN a.location = '新營區原警察局少年隊4樓(新營區埤寮59-8號)(面積673.95㎡)' THEN ag.name = '農業局'
    WHEN a.location = '學甲區集合段1177及1178地號市有土地(面積1755.49㎡)' THEN ag.name = '社會局'
    WHEN a.location = '善化區善化市場2樓C區(面積112.32㎡)(善化區中山路377號2樓)' THEN ag.name = '都市發展局'
    WHEN a.location = '中西區環河街56號(面積189.06㎡)(星鑽段2229地號及3310建號市有房地)' THEN ag.name = '南市區漁會'
    WHEN a.location = '仁德區崁腳北段1260、1261、 1267-1地號(面積2912.64㎡)' THEN ag.name = '府城客運公司'
    WHEN a.location = '仁德區崁腳北段 1267-1地號(面積6750.31㎡)' THEN ag.name = '國光客運公司'
    WHEN a.location = '仁德區崁腳北段1259地號(面積1536.32㎡)' THEN ag.name = '漢程客運公司'
    WHEN a.location IN ('善化區善化市場2樓A、B區及西側空間(面積595㎡)', '原關廟區環保局辦公室2、3樓關廟區仁愛段1147、1148地號') THEN ag.name = '衛生局'
    WHEN a.location IN ('七股區義合里多功能活動中心(面積222.926㎡)', '七股區龍山里漁民活動中心(面積635.3㎡)') THEN ag.name = '七股區公所'
    WHEN a.location = '安平區漁光里活動中心2樓辦公室及2樓教室4(增加面積31.39㎡)' THEN ag.name = '安平區公所'
    WHEN a.location = '將軍區西和社區活動中心1樓(面積389.35㎡)' THEN ag.name = '將軍區公所'
    WHEN a.location = '仁德區中軍段923地號(面積9231.73㎡)' THEN ag.name = '消防局'
    WHEN a.location = '東山頂田社區活動中心東山區頂田段234地號(面積481.16㎡)' THEN ag.name = '東山區公所'
END
WHERE a.year = 111;


-- 112
-- 建立已活化資產與需求機關的關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '北區實踐社區活動中心2樓(面積197.8㎡)' THEN ag.name = '北區區公所'
    WHEN a.location = '中西區友愛市場2樓(面積1282.9m²)' THEN ag.name = '研究發展考核委員會'
    WHEN a.location = '山上區山上里農民教育活動中心2樓(面積303.3m²)' THEN ag.name = '山上區公所'
    WHEN a.location = '安平區遊憩碼頭建築物2樓(面積:72m²)' THEN ag.name = '觀光旅遊局'
    WHEN a.location = '安南區海北段375地號' THEN ag.name = '文化資產管理處'
    WHEN a.location LIKE '南區殯儀館永安門旁建物%' THEN ag.name = '殯葬管理所'
    WHEN a.location = '善化區善化市場二樓西側(面積約80坪)' THEN ag.name = '地政局'
    WHEN a.location = '新營區中正路37巷150號、168號、172號宿舍' THEN ag.name = '文化局'
    WHEN a.location IN (
        '東區竹篙厝段1682地號(部分)公開標租(星期一至五)暨專案出租(星期六、日)',
        '北區北安段743-2地號、南區鹽埕段290-942、290-943地號內及白河區中興段1745地號'
    ) THEN ag.name = '財政稅務局'
    WHEN a.location = '龍崎區龍船派出所1樓部分(面積:58.2m²)及2樓(面積:116.4m²)' THEN ag.name = '消防局'
    WHEN a.location IN (
        '新市區大社社區活動中心1樓(面積：322.5m2)',
        '新市區文康育樂中心2樓'
    ) THEN ag.name = '新市區公所'
    WHEN a.location = '龍崎舊公有零售市場1樓(面積：636.8m2)' THEN ag.name = '龍崎區公所'
    WHEN a.location = '麻豆區總榮里活動中心2樓' THEN ag.name = '社會局'
END
WHERE a.year = 112;

-- 113
-- 建立已活化資產與需求機關的關聯
INSERT INTO activated_asset_demand_agencies
(activated_asset_id, agency_id)
SELECT
    a.id as activated_asset_id,
    ag.id as agency_id
FROM activated_assets a
LEFT JOIN agencies ag ON CASE
    WHEN a.location = '原警察局新化分局岡林派出所(面積：144.4m2)' THEN ag.name = '左鎮區公所'
    WHEN a.location = '新營區微型創新教育體驗基地' THEN ag.name = '新營區公所'
    WHEN a.location = '警察局歸仁分局龍船派出所2樓' THEN ag.name = '消防局'
    WHEN a.location = '南區灣裡聯合里活動中心1樓部分場地(面積：96.59㎡)' THEN ag.name = '南區區公所'
    WHEN a.location IN (
        '中西區中頭社區活動中心2樓辦公室(面積：73㎡)',
        '中西區南廠里活動中心2樓辦公室(面積：19.2㎡)'
    ) THEN ag.name = '中西區公所'
    WHEN a.location IN (
        '六甲區六甲段4-8及4-11地號市有土地',
        '新營區武昌街3號1樓辦公室及東區富德街23號辦公室'
    ) THEN ag.name = '警察局'
    WHEN a.location IN (
        '永康區五王段116-5地號市有土地',
        '永康區永二段240-1及241-1地號市有土地',
        '永康區平道段105地號市有土地',
        '永康區永安段11地號'
    ) THEN ag.name = '永康區公所'
    WHEN a.location = '新營區忠政段101地號市有土地' THEN ag.name = '秘書處'
    WHEN a.location = '西港區双營段1653地號市有土地' THEN ag.name = '西港區公所'
    WHEN a.location IN (
        '安南區塭南里活動中心2樓',
        '安平區第三幼兒園1及2樓',
        '安平區第三幼兒園3及4樓',
        '北區文元文成元美里聯合活動中心四樓教室B'
    ) THEN ag.name = '社會局'
    WHEN a.location = '安定區安定段1074-2地號等37筆土地' THEN ag.name = '工務局'
    WHEN a.location = '安南區長和段1072、1074及1075地號市有土地' THEN ag.name = '臺南市市場處'
    WHEN a.location IN (
        '官田區鎮北段865及866地號市有土地',
        '官田區番子田段740地號等6筆土地'
    ) THEN ag.name = '官田區公所'
    WHEN a.location = '北區大和社區活動中心2樓' THEN ag.name = '北區區公所'
END
WHERE a.year = 113;
