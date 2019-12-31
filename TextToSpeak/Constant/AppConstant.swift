//
//  AppConstant.swift
//  TextToSpeak
//
//  Created by admin on 30/12/2019.
//  Copyright © 2019 SangNX. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    
    static let SCREEN_SIZE: CGRect = UIScreen.main.bounds
    static let SREEEN_WIDTH = SCREEN_SIZE.width
    static let SCREEN_HEIGHT = SCREEN_SIZE.height
    static let STATUS_BAR_BOTTOM = SCREEN_HEIGHT >= 812 || SREEEN_WIDTH >= 812 ? CGFloat(37) : CGFloat(0)
    static let STATUS_BAR_TOP = SCREEN_HEIGHT >= 812 ? CGFloat(44) : CGFloat(20)
    static let TOOL_BAR_HEIGHT = CGFloat(44)
    static let TAB_BAR_HEIGHT = CGFloat(49)
    static let HEIGTH_TABBAR: CGFloat = 70 + STATUS_BAR_BOTTOM
}

let TITLE                       = "title"
let CODE                        = "code"
let HELLO                       = "hello"
let LIST_VOICES                 = "listVoices"
let NAME                        = "name"
let VOICE                       = "voice"

//HELLO ANOTHER LANGUAGUE
let HELLO_ENGLISH               = "Hello my name is "

//CODE COUNTRY
let CODE_AUSTRALIAN                         = "en-AU"
let CODE_UNITED_KINGDOM                     = "en-GB"
let CODE_IRISH                              = "en-IE"
let CODE_INDIAN                             = "en-IN"
let CODE_UNITED_STATES                      = "en-US"
let CODE_SOUTH_AFICA                        = "en-ZA"
let CODE_SAUDI_ARABIA                       = "ar-SA"
let CODE_CZECK                              = "cs-CZ"
let CODE_DANISH                             = "da-DK"
let CODE_GERMAN                             = "de-DE"
let CODE_GREEK                              = "el-GR"
let CODE_SPAIN                              = "es-ES"
let CODE_MEXICO                             = "es-MX"
let CODE_FINLAND                            = "fi-FI"
let CODE_CANADA                             = "fr-CA"
let CODE_FRANCE                             = "fr-FR"
let CODE_ISRAEL                             = "he-IL"
let CODE_HINDI                              = "hi-IN"
let CODE_HUNGARY                            = "hu-HU"
let CODE_INDONESIA                          = "id-ID"
let CODE_ITALY                              = "it-IT"
let CODE_JAPAN                              = "ja-JP"
let CODE_KOREAN                             = "ko-KR"
let CODE_BEGIUM                             = "nl-BE"
let CODE_NETHERLANDS                        = "nl-NL"
let CODE_NORWAY                             = "no-NO"
let CODE_POLAND                             = "pl-PL"
let CODE_BRAZIL                             = "pt-BR"
let CODE_PORTUGAL                           = "pt-PT"
let CODE_ROMANIA                            = "ro-RO"
let CODE_RUSSIAN                            = "ru-RU"
let CODE_SLOVAKIA                           = "sk-SK"
let CODE_SWEDEN                             = "sv-SE"
let CODE_THAILAND                           = "th-TH"
let CODE_TURKEY                             = "tr-TR"
let CODE_CHINA                              = "zh-CN"
let CODE_HONGKONG                           = "zh-HK"
let CODE_TAIWAN                             = "zh-TW"

//----->TITLE
let STR_AUSTRALIAN                  = "English (Australian)"
let STR_UNITED_KINGDOM              = "English (United Kingdom)"
let STR_IRISH                       = "English (Irish)"
let STR_INDIAN                      = "English (Indian)"
let STR_UNITED_STATES               = "English (United States)"
let STR_SOUTH_AFICA                 = "English (South Afica)"
let STR_SAUDI_ARABIA                = "Arabic (Saudi Arabia)"
let STR_CZECK                       = "Czeck (Czeck Republic)"
let STR_DANISH                      = "Danish (Denmark)"
let STR_GERMAN                      = "German (Germany)"
let STR_GREEK                       = "Greek (Greece)"
let STR_SPAIN                       = "Spanish (Spain)"
let STR_MEXICO                      = "Spanish (Mexico)"
let STR_FINLAND                     = "Finnish (Finland)"
let STR_CANADA                      = "French (Canada)"
let STR_FRANCE                      = "French (France)"
let STR_ISRAEL                      = "Hebrew (Israel)"
let STR_HINDI                       = "Hindi (India)"
let STR_HUNGARY                     = "Hungarian (Hungary)"
let STR_INDONESIA                   = "Indonesian (Indonesia)"
let STR_ITALY                       = "Italian (Italy)"
let STR_JAPAN                       = "Japanese (Japan)"
let STR_KOREAN                      = "Korean (South Korea)"
let STR_BEGIUM                      = "Dutch (Belgium)"
let STR_NETHERLANDS                 = "Dutch (Netherlands)"
let STR_NORWAY                      = "Norwegian (Norway)"
let STR_POLAND                      = "Polish (Poland)"
let STR_BRAZIL                      = "Portuguese (Brazil)"
let STR_PORTUGAL                    = "Portuguese (Portugal)"
let STR_ROMANIA                     = "Romanian (Romania)"
let STR_RUSSIAN                     = "Russian (Russia)"
let STR_SLOVAKIA                    = "Slovak (Slovakia)"
let STR_SWEDEN                      = "Swedish (Sweden)"
let STR_THAILAND                    = "Thai (Thailand)"
let STR_TURKEY                      = "Turkish (Turkey)"
let STR_CHINA                       = "Chinese (China)"
let STR_HONGKONG                    = "Chinese (Hong Kong)"
let STR_TAIWAN                      = "Chinese (TAIWAN)"

//-----> NAME VOICE

//***-AUSTRALIAN
let Catherine = "Catherine"
let Catherine_Bundle = "com.apple.ttsbundle.siri_female_en-AU_compact"

let Gordon = "Gordon"
let Gordon_Bundle = "com.apple.ttsbundle.siri_male_en-AU_compact"

let Karen = "Karen"
let Karen_Bundle = "com.apple.ttsbundle.Karen-compact"

//***-UNITED_KINGDOM
let Arthur = "Arthur"
let Arthur_Bundle = "com.apple.ttsbundle.siri_male_en-GB_compact"

let Daniel = "Daniel"
let Daniel_Bundle = "com.apple.ttsbundle.Daniel-compact"

let Martha = "Martha"
let Martha_Bundle = "com.apple.ttsbundle.siri_female_en-GB_compact"

//***-IRISH
let Moira = "Moira"
let Moira_Bundle = "com.apple.ttsbundle.Moira-compact"

//***-INDIAN
let Rishi = "Rishi"
let Rishi_Bundle = "com.apple.ttsbundle.Moira-compact"

//***-UNITED_STATES
let Aaron = "Aaron"
let Aaron_Bundle = "com.apple.ttsbundle.Rishi-compact"

let Alex = "Alex"
let Alex_Bundle = "com.apple.speech.voice.Alex"

let Fred = "Fred"
let Fred_Bundle = "com.apple.speech.synthesis.voice.Fred"

let Nicky = "Nicky"
let Nicky_Bundle = "com.apple.ttsbundle.siri_female_en-US_compact"

let Samantha = "Samantha"
let Samantha_Bundle = "com.apple.ttsbundle.Samantha-compact"

//***-SOUTH_AFICA
let Tessa = "Tessa"
let Tessa_Bundle = "com.apple.ttsbundle.Tessa-compact"

//***-SAUDI_ARABIA
let Maged = "Maged"
let Maged_Bundle = "com.apple.ttsbundle.Maged-compact"

//***-CZECK
let Zuzana = "Zuzana"
let Zuzana_Bundle = "com.apple.ttsbundle.Zuzana-compacts"

//***-DANISH
let Sara = "Sara"
let Sara_Bundle = "com.apple.ttsbundle.Sara-compact"

//***-GERMAN
let Anna = "Anna"
let Anna_Bundle = "com.apple.ttsbundle.Anna-compact"

let Helena = "Helena"
let Helena_Bundle = "com.apple.ttsbundle.siri_female_de-DE_compact"

let Martin = "Martin"
let Martin_Bundle = "com.apple.ttsbundle.siri_male_de-DE_compact"

//***-GREEK
let Melina = "Melina"
let Melina_Bundle = "com.apple.ttsbundle.Melina-compact"

//***-SPAIN
let Monica = "Mónica"
let Monica_Bundle = "com.apple.ttsbundle.Monica-compact"

//***-MEXICO
let Paulina = "Paulina"
let Paulina_Bundle = "com.apple.ttsbundle.Paulina-compact"

//***-FINLAND
let Satu = "Satu"
let Satu_Bundle = "com.apple.ttsbundle.Satu-compact"

//***-CANADA
let Amelie = "Amélie"
let Amelie_Bundle = "com.apple.ttsbundle.Amelie-compact"

//***-FRANCE
let DanielFR = "Daniel"
let DanielFR_Bundle = "com.apple.ttsbundle.siri_male_fr-FR_compact"

let Marie = "Marie"
let Marie_Bundle = "com.apple.ttsbundle.siri_female_fr-FR_compact"

let Thomas = "Thomas"
let Thomas_Bundle = "com.apple.ttsbundle.Thomas-compact"

//***-ISRAEL
let Carmit = "Carmit"
let Carmit_Bundle = "com.apple.ttsbundle.Carmit-compact"

//***-HINDI
let Lekha = "Lekha"
let Lekha_Bundle = "com.apple.ttsbundle.Lekha-compact"

//***-HUNGARY
let Mariska = "Mariska"
let Mariska_Bundle = "com.apple.ttsbundle.Mariska-compact"

//***-INDONESIA
let Damayanti = "Damayanti"
let Damayanti_Bundle = "com.apple.ttsbundle.Damayanti-compact"

//***-ITALY
let Alice = "Alice"
let Alice_Bundle = "com.apple.ttsbundle.Alice-compact"

//***-JAPAN
let Hattori = "Hattori"
let Hattori_Bundle = "com.apple.ttsbundle.siri_male_ja-JP_compact"

let Kyoko = "Kyoko"
let Kyoko_Bundle = "com.apple.ttsbundle.Kyoko-compact"

let Oren = "O-ren"
let Oren_Bundle = "com.apple.ttsbundle.siri_female_ja-JP_compact"

//***-KOREAN
let Yuna = "Yuna"
let Yuna_Bundle = "com.apple.ttsbundle.Yuna-compact"

//***-BEGIUM
let Ellen = "Ellen"
let Ellen_Bundle = "com.apple.ttsbundle.Ellen-compact"

//***-NETHERLANDS
let Xander = "Xander"
let Xander_Bundle = "com.apple.ttsbundle.Xander-compact"

//***-NORWAY
let Nora = "Nora"
let Nora_Bundle = "com.apple.ttsbundle.Nora-compact"

//***-POLAND
let Zosia = "Zosia"
let Zosia_Bundle = "com.apple.ttsbundle.Zosia-compact"

//***-BRAZIL
let Luciana = "Luciana"
let Luciana_Bundle = "com.apple.ttsbundle.Luciana-compact"

//***-PORTUGAL
let Joana = "Joana"
let Joana_Bundle = "com.apple.ttsbundle.Joana-compact"

//***-ROMANIA
let Ioana = "Ioana"
let Ioana_Bundle = "com.apple.ttsbundle.Ioana-compact"

//***-RUSSIAN
let Milena = "Milena"
let Milena_Bundle = "com.apple.ttsbundle.Milena-compact"

//***-SLOVAKIA
let Laura = "Laura"
let Laura_Bundle = "com.apple.ttsbundle.Laura-compact"

//***-SWEDEN
let Alva = "Alva"
let Alva_Bundle = "com.apple.ttsbundle.Alva-compact"

//***-THAILAND
let Kanya = "Kanya"
let Kanya_Bundle = "com.apple.ttsbundle.Kanya-compact"

//***-TURKEY
let Yelda = "Yelda"
let Yelda_Bundle = "com.apple.ttsbundle.Yelda-compact"

//***-CHINA
let Limu = "Li-mu"
let Limu_Bundle = "com.apple.ttsbundle.siri_male_zh-CN_compact"

let Tian = "Tian-Tian"
let Tian_Bundle = "com.apple.ttsbundle.Ting-Ting-compact"

let Yushu = "Yu-shu"
let Yushu_Bundle = "com.apple.ttsbundle.siri_female_zh-CN_compact"

//***-HONGKONG
let SinJi = "Sin-Ji"
let SinJi_Bundle = "com.apple.ttsbundle.Sin-Ji-compact"

//***-TAIWAN
let MeiJia = "Mei-Jia"
let MeiJia_Bundle = "com.apple.ttsbundle.Mei-Jia-compact"

