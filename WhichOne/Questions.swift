//
//  Questions.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 15.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

struct HanziDefinition {
    let pinyin: String
    let translation: String
}

let hanziDefinitions: [Character: HanziDefinition] = {
    var definitions = [Character: HanziDefinition]()

    definitions["泰"] = HanziDefinition(pinyin: "tài",    translation: "healthy, surname Tai, short for Thailand")
    definitions["秦"] = HanziDefinition(pinyin: "qín",    translation: "Qin (name of a dynasty)")
    definitions["奏"] = HanziDefinition(pinyin: "zòu",    translation: "to play (music), beat")
    definitions["奉"] = HanziDefinition(pinyin: "fèng",   translation: "to give something respectfully")

    definitions["士"] = HanziDefinition(pinyin: "shì",    translation: "a professional")
    definitions["土"] = HanziDefinition(pinyin: "tǔ",     translation: "to give something respectfully")

    definitions["末"] = HanziDefinition(pinyin: "mò",     translation: "the end")
    definitions["未"] = HanziDefinition(pinyin: "wèi",    translation: "not yet")
    
    definitions["尚"] = HanziDefinition(pinyin: "shàng",  translation: "still, yet, esteem")
    definitions["向"] = HanziDefinition(pinyin: "xiàng",  translation: "facing (something or someone)")
    definitions["同"] = HanziDefinition(pinyin: "tóng",   translation: "the same, alike")
    
    definitions["己"] = HanziDefinition(pinyin: "jǐ",     translation: "oneself, personal")
    definitions["已"] = HanziDefinition(pinyin: "yǐ",     translation: "already, cease, end")
    
    definitions["卸"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["御"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    
    definitions["牽"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["舉"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    
    definitions["鍾"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["鐘"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    
    definitions["裡"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["理"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["埋"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    
    definitions["公"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["共"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    
    definitions["塞"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["賽"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["寨"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["難"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["雜"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["雞"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["日"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["曰"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["狀"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["壯"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    
    definitions["熱"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["熟"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["搬"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["辦"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["祖"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["租"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["詐"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["許"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["妻"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["婦"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["史"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["便"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["更"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["使"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["陰"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["隱"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["船"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["般"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["田"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["由"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["申"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["甲"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["曲"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["刁"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["勾"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["勻"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["均"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["句"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["裏"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["裹"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["插"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["抽"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["曲"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["典"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["依"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["移"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["狂"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["荒"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["提"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["趕"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["傅"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["傳"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["久"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["九"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["要"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["耍"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["橘"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["橋"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["和"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["如"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["農"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["晨"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["聊"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["卿"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["裝"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["將"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["醬"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["漿"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["直"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["真"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["值"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["蒙"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["矇"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["朦"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["懞"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["鳥"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["烏"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["噩"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["惡"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["產"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["展"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["主"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["注"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["栗"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["票"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["彩"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["影"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["譯"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["釋"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["板"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["版"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["今"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["令"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["命"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["牛"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["午"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["洽"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["浴"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["州"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["川"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["洲"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["賓"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["寶"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["圈"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["團"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["圓"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["因"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["困"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["暮"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["慕"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["當"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["富"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["乘"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["乖"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["禹"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["寓"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["萬"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["厲"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["渴"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["喝"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["配"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["陪"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["棵"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["顆"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["晴"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["清"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["頂"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["預"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["項"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["衛"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["微"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["恕"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["怒"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["虛"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["慮"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["處"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["虎"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["胡"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["朝"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["房"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["屋"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["室"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["失"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["矢"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["餘"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["欲"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["團"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["園"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["獨"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["觸"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["夾"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["來"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["繁"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["緊"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["襄"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["哀"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["喪"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["衷"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["徵"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["微"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["積"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["績"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["堅"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["聖"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["允"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["充"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["峰"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["降"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["予"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["矛"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["隆"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["降"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["卷"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["券"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["拳"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["貴"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["責"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["儘"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["僅"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["質"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["贊"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["赤"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["亦"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["實"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["寶"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["都"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["部"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["挺"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["延"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["隆"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["降"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["沈"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["深"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["即"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["朗"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["齋"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["齊"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["矯"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["矮"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["湖"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["潮"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["毀"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["殼"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["崖"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["嵐"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["辜"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["喜"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["曖"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["暖"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["昧"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["味"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["鹽"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["監"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["嘗"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["掌"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["常"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["痔"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["痣"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["餘"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["欲"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["盹"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["頓"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["處"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["虛"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["隻"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["集"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["禿"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["秀"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["秃"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["緣"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["綠"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["秘"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["密"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["曝"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["曬"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["官"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["宮"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["侍"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["待"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["允"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["充"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["屋"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["居"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["晶"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["昌"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["唱"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["勝"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["騰"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["波"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["渡"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["荔"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["協"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["賓"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["寶"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["沈"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["沉"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["構"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["溝"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["減"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["滅"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["奮"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["奪"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["拳"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["卷"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["捲"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["消"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["稍"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["削"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["姜"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["妻"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["邊"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["遍"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["藉"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["籍"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["幸"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["辛"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["枉"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["框"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["旅"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["族"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["援"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["緩"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["暑"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["曙"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["截"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["裁"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["戒"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["戴"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["條"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["絛"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["型"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["刑"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["形"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["仰"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["迎"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    definitions["墜"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")
    definitions["墮"] = HanziDefinition(pinyin: "tbd",    translation: "tbd")

    return definitions
}()

struct Question: Equatable {
    let sentence: String
    // The first answer is always the correct one.
    let answers: [Character]
    
    var correctAnswer: Character {
        return answers.first!
    }
}

let allQuestions: [Question] = {
    var questions = [Question]()
    
    questions.append(Question(sentence: "小王：我想去�國玩！", answers: ["泰", "秦", "奏", "奉"]))
    
    questions.append(Question(sentence: "那位護�一點也不兇！", answers: ["士", "土"]))
    questions.append(Question(sentence: "這不屬於我們的領�。", answers: ["土", "士"]))
    
    questions.append(Question(sentence: "我週�什麼都沒做", answers: ["末", "未"]))
    
    questions.append(Question(sentence: "本館�未客滿", answers: ["尚", "向", "同"]))
    
    questions.append(Question(sentence: "她還真的自�整理了房子！", answers: ["己", "已"]))
    
    return questions
}()
